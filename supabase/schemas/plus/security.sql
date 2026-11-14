-- Plus: row level security, grants and policies.

alter table public.entitlements enable row level security;
grant select on public.entitlements to authenticated;
-- Plus covers both: each partner can see the other's entitlement row (plan and status only matter).
create policy entitlements_select_own_or_partner on public.entitlements for select to authenticated
  using (profile_id = (select auth.uid()) or profile_id = (select private.partner_id()));

alter table private.purchase_events enable row level security;
