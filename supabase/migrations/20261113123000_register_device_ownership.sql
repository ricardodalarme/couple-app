-- A device token belongs to the profile that registered it: only that profile may refresh it.
-- Mirrors supabase/schemas/public/notifications_today_realtime.sql; edit both together.
create or replace function public.register_device(token text, platform text, label text default null)
returns boolean
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
  values (v_uid, register_device.token, register_device.platform, register_device.label)
  on conflict on constraint devices_token_key do update
    set platform = excluded.platform, label = excluded.label, failure_count = 0, last_seen_at = now()
    where d.profile_id = v_uid
  returning d.id into v_device;
  return v_device is not null;
end $$;
