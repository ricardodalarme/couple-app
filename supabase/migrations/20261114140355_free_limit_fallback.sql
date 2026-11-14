SET local check_function_bodies = off;

CREATE OR REPLACE FUNCTION private.enforce_free_card_limit()
  RETURNS TRIGGER
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
begin
  if not private.has_plus(new.author_id)
     and private.month_usage(new.author_id, 'cards') >= private.free_limit('cards') then
    raise exception 'FREE_LIMIT_REACHED' using errcode = 'P0001';
  end if;
  return new;
end $function$;

CREATE OR REPLACE FUNCTION private.enforce_free_slip_limit()
  RETURNS TRIGGER
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
begin
  -- saveSlip is an upsert: editing an existing slip must keep working at the limit.
  if exists (select 1 from public.slips where id = new.id) then
    return new;
  end if;
  if not private.has_plus(new.author_id)
     and private.month_usage(new.author_id, 'slips') >= private.free_limit('slips') then
    raise exception 'FREE_LIMIT_REACHED' using errcode = 'P0001';
  end if;
  return new;
end $function$;

CREATE OR REPLACE FUNCTION private.free_limit (
  p_what text
)
  RETURNS integer
  LANGUAGE sql
  STABLE
  SET search_path TO ''
  AS $function$
  select case p_what
    when 'slips' then coalesce((select value::integer from public.app_config where key = 'free_slips_per_month'), 15)
    else coalesce((select value::integer from public.app_config where key = 'free_cards_per_month'), 1) end;
$function$;

CREATE OR REPLACE FUNCTION public.my_plus()
  RETURNS public.plus_state
  LANGUAGE plpgsql
  STABLE
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
declare v_uid uuid := private.require_user(); r public.plus_state; e public.entitlements;
begin
  r.profile_id := v_uid;
  r.has_plus := private.has_plus(v_uid);
  select * into e from public.entitlements where profile_id = v_uid;
  if not found or e.status in ('expired', 'refunded') then
    select * into e from public.entitlements where profile_id = private.partner_id();
    r.paid_by_partner := found and r.has_plus;
  else
    r.paid_by_partner := false;
  end if;
  r.plan := e.plan; r.status := e.status; r.expires_at := e.expires_at;
  r.slips_left_this_month := greatest(0, private.free_limit('slips') - private.month_usage(v_uid, 'slips'));
  r.cards_left_this_month := greatest(0, private.free_limit('cards') - private.month_usage(v_uid, 'cards'));
  return r;
end $function$;
