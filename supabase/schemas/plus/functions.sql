-- Plus: functions.

-- Called by the purchases webhook (service role). Idempotent by event id, ignores out-of-order older events.
create function private.apply_purchase_event(p_event_id text, p_profile_id uuid, p_type text, p_event_at timestamptz,
  p_plan text, p_status text, p_expires_at timestamptz, p_will_renew boolean, p_store text) returns boolean
language plpgsql security definer set search_path = '' as $$
begin
  insert into private.purchase_events (event_id, profile_id, type, event_at) values (p_event_id, p_profile_id, p_type, p_event_at)
  on conflict (event_id) do nothing;
  if not found then return false; end if;
  if not exists (select 1 from public.profiles where id = p_profile_id) then return false; end if;
  insert into public.entitlements as e (profile_id, plan, status, expires_at, will_renew, store, updated_at)
  values (p_profile_id, p_plan::public.entitlement_plan, p_status::public.entitlement_status, p_expires_at, coalesce(p_will_renew, true),
          p_store::public.entitlement_store, p_event_at)
  on conflict (profile_id) do update
    set plan = excluded.plan, status = excluded.status, expires_at = excluded.expires_at,
        will_renew = excluded.will_renew, store = excluded.store, updated_at = excluded.updated_at
    where e.updated_at <= excluded.updated_at;
  perform private.signal('user:' || p_profile_id, 'entitlement_changed');
  return true;
end $$;
grant execute on function private.apply_purchase_event(text, uuid, text, timestamptz, text, text, timestamptz, boolean, text) to service_role;

-- Plus is on when the person or their current partner has a live entitlement (48 h grace after expiry).
create function private.has_plus(p_profile_id uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (
    select 1 from public.entitlements e
    where e.status in ('trialing', 'active', 'grace', 'billing_issue')
      and (e.expires_at is null or e.expires_at > now() - interval '48 hours')
      and (e.profile_id = p_profile_id
           or e.profile_id in (select o.profile_id from public.couple_members me
                               join public.couple_members o on o.couple_id = me.couple_id and o.left_at is null
                               where me.profile_id = p_profile_id and me.left_at is null)));
$$;

create function private.month_usage(p_profile_id uuid, p_what text) returns integer
language sql stable security definer set search_path = '' as $$
  select case p_what
    when 'slips' then (select count(*) from public.slips s where s.author_id = p_profile_id
                         and s.created_at >= date_trunc('month', now()))
    else (select count(*) from public.cards c where c.author_id = p_profile_id and c.status = 'sent'
            and c.sent_at >= date_trunc('month', now())) end::integer;
$$;

create function public.my_plus() returns public.plus_state
language plpgsql stable security definer set search_path = '' as $$
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
  r.slips_left_this_month := greatest(0, (select value::integer from public.app_config where key = 'free_slips_per_month') - private.month_usage(v_uid, 'slips'));
  r.cards_left_this_month := greatest(0, (select value::integer from public.app_config where key = 'free_cards_per_month') - private.month_usage(v_uid, 'cards'));
  return r;
end $$;
grant execute on function public.my_plus() to authenticated;
