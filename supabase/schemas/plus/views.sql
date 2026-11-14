-- Plus: views.

create view public.plus_state with (security_invoker = true) as
  select p.id as profile_id, false as has_plus, false as paid_by_partner, null::public.entitlement_plan as plan,
         null::public.entitlement_status as status, null::timestamptz as expires_at, 0 as slips_left_this_month,
         0 as cards_left_this_month
  from public.profiles p where false;
grant select on public.plus_state to authenticated;
