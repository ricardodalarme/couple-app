-- The content kind and the Plus plan, status and store are closed sets, so they become enum types like the other value sets.
-- Function parameters stay text and are cast inside, because pg_graphql does not expose functions with enum arguments.

create type public.content_kind as enum ('question', 'daily_idea', 'date_idea', 'touch_card', 'spice_card', 'mission', 'me_or_you',
  'how_well', 'never_have_we', 'program', 'lesson', 'mood_tip', 'repair_card', 'ritual_idea', 'holiday', 'notification');
create type public.entitlement_plan as enum ('plus_monthly', 'plus_annual', 'plus_gift');
create type public.entitlement_status as enum ('trialing', 'active', 'grace', 'billing_issue', 'expired', 'refunded');
create type public.entitlement_store as enum ('app_store', 'play_store', 'promo');

-- Content ----------------------------------------------------------------------------------------------
drop policy content_items_read_published on public.content_items;
alter table public.content_items drop constraint content_items_kind_check;
alter table public.content_items
  alter column kind type public.content_kind using kind::public.content_kind;
create policy content_items_read_published on public.content_items for select to authenticated
  using (published and (kind <> 'spice_card' or (select private.spice_allowed())));

-- Compares as text so an unsupported kind still returns nothing instead of failing the cast.
create or replace function public.daily_content(kind text) returns public.content_items
language sql stable security definer set search_path = '' as $$
  with me as (
    -- UTC day, so partners in different time zones still share the same pick
    select s.locale, (now() at time zone 'UTC')::date as today,
           coalesce(private.current_couple_id(), s.profile_id) as seed
    from public.profile_settings s where s.profile_id = auth.uid()),
  pool as (
    select c.*, row_number() over (order by c.position, c.slug) - 1 as n, count(*) over () as total
    from public.content_items c, me
    where c.kind::text = daily_content.kind and daily_content.kind in ('question', 'daily_idea', 'mission', 'touch_card')
      and c.published and not c.plus_only and c.locale = me.locale)
  select p.id, p.kind, p.slug, p.locale, p.title, p.body, p.parent_slug, p.position, p.tags, p.month, p.day, p.country,
         p.plus_only, p.sensitive, p.published
  from pool p, me
  where p.n = (((me.today - date '2026-01-01') + abs(hashtext(me.seed::text)) % 97) % p.total);
$$;
comment on function public.daily_content(text) is e'@graphql({"description": "The editorial item of this kind picked for today. The same pick for both partners."})';

-- Entitlements ---------------------------------------------------------------------------------------
-- plus_state and my_plus carry the column types, so they are recreated around the change.
drop function public.my_plus();
drop view public.plus_state;

alter table public.entitlements drop constraint entitlements_plan_check;
alter table public.entitlements drop constraint entitlements_status_check;
alter table public.entitlements drop constraint entitlements_store_check;
alter table public.entitlements
  alter column plan type public.entitlement_plan using plan::public.entitlement_plan,
  alter column status type public.entitlement_status using status::public.entitlement_status,
  alter column store type public.entitlement_store using store::public.entitlement_store;

create view public.plus_state with (security_invoker = true) as
  select p.id as profile_id, false as has_plus, false as paid_by_partner, null::public.entitlement_plan as plan,
         null::public.entitlement_status as status, null::timestamptz as expires_at, 0 as slips_left_this_month,
         0 as cards_left_this_month
  from public.profiles p where false;
grant select on public.plus_state to authenticated;
comment on view public.plus_state is e'@graphql({"primary_key_columns": ["profile_id"], "description": "Whether the person has Plus, and the free-plan usage this month."})';

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
revoke all on function public.my_plus() from public, anon;
grant execute on function public.my_plus() to authenticated;
comment on function public.my_plus() is e'@graphql({"description": "Whether the caller has Plus and how much of the free plan they used this month."})';

create or replace function private.apply_purchase_event(p_event_id text, p_profile_id uuid, p_type text, p_event_at timestamptz,
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
