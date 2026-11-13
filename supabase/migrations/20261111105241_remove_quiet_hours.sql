drop function if exists private.quiet_end_at(uuid, timestamptz);
alter table public.notification_settings
  drop column if exists quiet_start,
  drop column if exists quiet_end;

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

create or replace function private.claim_notifications(p_limit integer default 50) returns setof private.push_job
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

grant update (enabled, discreet, card_day, card_hour, muted_types) on public.notification_settings to authenticated;
