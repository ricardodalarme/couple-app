-- Account: functions.

create function public.request_account_deletion() returns public.deletion_requests
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.deletion_requests;
begin
  insert into public.deletion_requests as d (profile_id, purge_after) values (v_uid, now() + interval '14 days')
  on conflict (profile_id) do update set profile_id = excluded.profile_id returning d.* into v_row;
  -- Deleting the account also ends the pairing right away; the partner sees a neutral "unpaired" state.
  perform public.unpair();
  return v_row;
end $$;
create function public.cancel_account_deletion() returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user();
begin
  delete from public.deletion_requests where profile_id = v_uid;
  return found;
end $$;

-- Erases one person: queues their files, then removes the auth user; every table cascades from profiles.
create function private.erase_profile(p_profile_id uuid) returns void
language plpgsql security definer set search_path = '' as $$
begin
  insert into private.storage_deletions (bucket, path)
  select 'couple_photos', cp.storage_path
  from public.couple_photos cp
  join public.couple_members cm on cm.couple_id = cp.couple_id
  where cm.profile_id = p_profile_id;
  delete from public.couple_photos cp
  using public.couple_members cm
  where cm.couple_id = cp.couple_id and cm.profile_id = p_profile_id;
  insert into private.storage_deletions (bucket, path)
  select o.bucket_id, o.name from storage.objects o
  where o.bucket_id in ('avatars', 'memories', 'messages') and (storage.foldername(o.name))[1] = p_profile_id::text;
  delete from private.rate_limits where key like '%:' || p_profile_id::text;
  delete from auth.users where id = p_profile_id;
  delete from public.profiles where id = p_profile_id;
end $$;
create function private.purge_deleted_accounts() returns integer
language plpgsql security definer set search_path = '' as $$
declare v_id uuid; v_n integer := 0;
begin
  for v_id in select profile_id from public.deletion_requests where purge_after <= now() loop
    perform private.erase_profile(v_id);
    v_n := v_n + 1;
  end loop;
  delete from private.rate_limits where window_start < now() - interval '2 days';
  delete from private.notification_outbox where sent_at < now() - interval '30 days';
  return v_n;
end $$;
grant execute on function public.request_account_deletion(), public.cancel_account_deletion() to authenticated;

create function public.create_support_request(topic text, message text, reply_email text default null, app_version text default null) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user();
begin
  if not private.hit_rate_limit('support:' || v_uid, 5, interval '1 day') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  insert into private.support_requests (profile_id, topic, message, reply_email, app_version)
  values (v_uid, create_support_request.topic::public.support_topic, btrim(create_support_request.message),
          create_support_request.reply_email, create_support_request.app_version);
  return true;
end $$;
grant execute on function public.create_support_request(text, text, text, text) to authenticated;
