-- Notifications: functions.

-- A token belongs to the profile that registered it; only that profile may refresh it.
create function public.register_device(token text, platform text, label text default null) returns boolean
language plpgsql security definer set search_path = '' as $$
declare
  v_uid uuid := private.require_user();
  v_device uuid;
begin
  if platform not in ('ios', 'android') then
    raise exception 'INVALID_PLATFORM' using errcode = 'P0001';
  end if;
  if not private.hit_rate_limit('register_device:' || v_uid, 20, interval '1 hour') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  insert into public.devices as d (profile_id, token, platform, label)
  values (v_uid, register_device.token, register_device.platform::public.device_platform, register_device.label)
  on conflict on constraint devices_token_key do update
    set platform = excluded.platform, label = excluded.label, failure_count = 0, last_seen_at = now()
    where d.profile_id = v_uid
  returning d.id into v_device;
  return v_device is not null;
end $$;
create function public.unregister_device(token text) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user();
begin
  delete from public.devices d where d.token = unregister_device.token and d.profile_id = v_uid;
  return found;
end $$;
create function public.revoke_device(device_id uuid) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user();
begin
  delete from public.devices d where d.id = device_id and d.profile_id = v_uid;
  return found;
end $$;
grant execute on function public.register_device(text, text, text), public.unregister_device(text), public.revoke_device(uuid) to authenticated;

create function public.my_notification_settings() returns public.notification_settings
language sql stable set search_path = '' as $$
  select * from public.notification_settings where profile_id = auth.uid();
$$;
grant execute on function public.my_notification_settings() to authenticated;

create function private.enqueue_notification(p_profile_id uuid, p_type text, p_ref_id uuid default null, p_dedupe_key text default null)
returns void language sql security definer set search_path = '' as $$
  insert into private.notification_outbox (profile_id, type, ref_id, dedupe_key)
  select p_profile_id, p_type, p_ref_id, p_dedupe_key where p_profile_id is not null
  on conflict (dedupe_key) do nothing;
$$;

-- Decision for one notification at a moment: 'send' or 'drop'.
create function private.should_send(p_profile_id uuid, p_type text, p_at timestamptz) returns text
language plpgsql stable security definer set search_path = '' as $$
declare v_s public.notification_settings;
begin
  select * into v_s from public.notification_settings where profile_id = p_profile_id;
  if not found or not v_s.enabled or p_type = any (v_s.muted_types) then
    return 'drop';
  end if;
  return 'send';
end $$;

-- Called by the push-sender Edge Function (service role). Applies preferences, returns what to send now.
create function private.claim_notifications(p_limit integer default 50) returns setof private.push_job
language plpgsql security definer set search_path = '' as $$
declare r private.notification_outbox; v_decision text; v_job private.push_job;
begin
  for r in
    select * from private.notification_outbox
    where sent_at is null and send_after <= now() and attempts < 5
    order by send_after limit p_limit for update skip locked
  loop
    v_decision := private.should_send(r.profile_id, r.type, now());
    if v_decision = 'drop' then
      update private.notification_outbox set sent_at = now(), outcome = 'dropped' where id = r.id;
    else
      update private.notification_outbox set attempts = attempts + 1, send_after = now() + interval '5 minutes' where id = r.id;
      select r.id, r.profile_id, r.type, r.ref_id, ns.discreet,
             (select array_agg(d.token) from public.devices d where d.profile_id = r.profile_id)
      into v_job from public.notification_settings ns where ns.profile_id = r.profile_id;
      if v_job.tokens is null then
        update private.notification_outbox set sent_at = now(), outcome = 'no_device' where id = r.id;
      else
        return next v_job;
      end if;
    end if;
  end loop;
end $$;

create function private.complete_notification(p_outbox_id uuid, p_failed_tokens text[] default '{}') returns void
language plpgsql security definer set search_path = '' as $$
begin
  update private.notification_outbox set sent_at = now(), outcome = 'sent' where id = p_outbox_id and sent_at is null;
  update public.devices set failure_count = failure_count + 1 where token = any (p_failed_tokens);
  delete from public.devices where failure_count >= 3;
end $$;
grant execute on function private.claim_notifications(integer), private.complete_notification(uuid, text[]) to service_role;
grant select on private.push_job to service_role;

-- Notification rules v2: daily cap, and silence for reminders during a pause, a fight or time away ------
create or replace function private.should_send(p_profile_id uuid, p_type text, p_at timestamptz) returns text
language plpgsql stable security definer set search_path = '' as $$
declare
  v_s public.notification_settings;
  v_from_partner boolean := p_type in ('card_received', 'card_reaction', 'partner_joined', 'unpaired', 'pause_started', 'partner_message', 'game_invite')
                            or p_type like 'signal_%';
begin
  select * into v_s from public.notification_settings where profile_id = p_profile_id;
  if not found or not v_s.enabled or p_type = any (v_s.muted_types) then
    return 'drop';
  end if;
  if p_type <> 'pause_over' and not v_from_partner then
    if private.is_quiet_moment(p_profile_id) then
      return 'drop';
    end if;
    if (select count(*) from private.notification_outbox o
        where o.profile_id = p_profile_id and o.outcome = 'sent' and o.sent_at > p_at - interval '24 hours'
          and o.type not in ('card_received', 'card_reaction', 'partner_joined', 'unpaired', 'pause_started', 'partner_message', 'game_invite', 'pause_over')
          and o.type not like 'signal_%') >= v_s.daily_max then
      return 'drop';
    end if;
  end if;
  return 'send';
end $$;
