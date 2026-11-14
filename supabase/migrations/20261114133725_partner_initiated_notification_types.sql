SET local check_function_bodies = off;

CREATE OR REPLACE FUNCTION private.is_partner_initiated (
  p_type text
)
  RETURNS boolean
  LANGUAGE sql
  IMMUTABLE
  SET search_path TO ''
  AS $function$
  select p_type in ('card_received', 'card_reaction', 'partner_joined', 'unpaired', 'pause_started', 'partner_message', 'game_invite')
         or p_type like 'signal_%';
$function$;

CREATE OR REPLACE FUNCTION private.should_send (
  p_profile_id uuid,
  p_type       text,
  p_at         timestamp with time zone
)
  RETURNS text
  LANGUAGE plpgsql
  STABLE
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
declare
  v_s public.notification_settings;
  v_from_partner boolean := private.is_partner_initiated(p_type);
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
          and not private.is_partner_initiated(o.type) and o.type <> 'pause_over') >= v_s.daily_max then
      return 'drop';
    end if;
  end if;
  return 'send';
end $function$;
