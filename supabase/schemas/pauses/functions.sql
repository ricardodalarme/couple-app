-- Pauses: functions.

create function public.start_pause(return_at timestamptz, message text default null) returns public.pauses
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.pauses; v_partner uuid := private.partner_id();
begin
  if return_at is null or return_at <= now() or return_at > now() + interval '24 hours' then
    raise exception 'INVALID_RETURN_TIME' using errcode = 'P0001';
  end if;
  update public.pauses p set ended_at = now() where p.started_by = v_uid and p.ended_at is null;
  insert into public.pauses (started_by, couple_id, return_at, message)
  values (v_uid, private.current_couple_id(), start_pause.return_at, coalesce(nullif(btrim(start_pause.message), ''), 'Preciso de um tempo.'))
  returning * into v_row;
  perform private.enqueue_notification(v_partner, 'pause_started', v_row.id, 'pause_started:' || v_row.id);
  insert into private.notification_outbox (profile_id, type, ref_id, dedupe_key, send_after)
  values (v_uid, 'pause_over', v_row.id, 'pause_over:' || v_row.id, v_row.return_at) on conflict (dedupe_key) do nothing;
  if v_partner is not null then perform private.signal('user:' || v_partner, 'pause_changed'); end if;
  return v_row;
end $$;

create function public.end_pause() returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_partner uuid := private.partner_id(); v_id uuid;
begin
  update public.pauses p set ended_at = now() where p.started_by = v_uid and p.ended_at is null returning p.id into v_id;
  if v_id is null then return false; end if;
  update private.notification_outbox set sent_at = now(), outcome = 'cancelled' where dedupe_key = 'pause_over:' || v_id and sent_at is null;
  if v_partner is not null then perform private.signal('user:' || v_partner, 'pause_changed'); end if;
  return true;
end $$;

-- Pauses never stay open: closed at the promised time (hourly job, plus on read through active_pause).
create function private.expire_pauses() returns integer
language plpgsql security definer set search_path = '' as $$
declare v_n integer;
begin
  update public.pauses set ended_at = return_at where ended_at is null and return_at <= now();
  get diagnostics v_n = row_count;
  return v_n;
end $$;

-- The pause that matters to the caller right now: their own, or their partner's.
create function public.active_pause() returns public.pauses
language sql stable security definer set search_path = '' as $$
  select p.* from public.pauses p
  where p.ended_at is null and p.return_at > now()
    and (p.started_by = auth.uid() or (p.couple_id = private.current_couple_id() and p.started_by = private.partner_id()))
  order by (p.started_by = auth.uid()) desc, p.started_at desc limit 1;
$$;

-- No reminders during a pause or a fresh "fight" (product rule). Partner-initiated messages still arrive.
create function private.is_quiet_moment(p_profile_id uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (select 1 from public.pauses p where p.ended_at is null and p.return_at > now()
                 and (p.started_by = p_profile_id or p.couple_id in (select couple_id from public.couple_members where profile_id = p_profile_id and left_at is null)))
      or exists (select 1 from public.temperature_checks t where t.author_id = p_profile_id and t.level = 'fight' and t.created_at > now() - interval '24 hours')
      or exists (select 1 from public.profile_settings s where s.profile_id = p_profile_id
                 and (s.relationship_status <> 'together' or s.app_paused_until > now()));
$$;
