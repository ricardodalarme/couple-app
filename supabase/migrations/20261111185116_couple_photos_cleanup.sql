alter table public.couple_photos
  add constraint couple_photos_storage_path_couple
  check (storage_path like couple_id::text || '/%');

create or replace function public.unpair() returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_couple_id uuid := private.current_couple_id();
begin
  if v_couple_id is null then
    return false;
  end if;
  insert into private.storage_deletions (bucket, path)
  select 'couple_photos', storage_path from public.couple_photos where couple_id = v_couple_id;
  delete from public.couple_photos where couple_id = v_couple_id;
  update public.couple_members set left_at = now() where couple_id = v_couple_id and left_at is null;
  update public.couples set archived_at = now() where id = v_couple_id;
  return true;
end $$;

create or replace function private.erase_profile(p_profile_id uuid) returns void
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
