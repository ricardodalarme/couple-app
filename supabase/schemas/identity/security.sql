-- Identity: row level security, grants and policies.

alter table public.profiles enable row level security;
alter table public.profile_settings enable row level security;
alter table public.couples enable row level security;
alter table public.couple_members enable row level security;

grant select on public.profiles, public.profile_settings, public.couples, public.couple_members to authenticated;
grant update (display_name, avatar_path) on public.profiles to authenticated;
grant update (theme, locale, time_zone, goal, phase, partner_name, onboarded_at, share_read_receipts) on public.profile_settings to authenticated;

create policy profiles_select_self_or_partner on public.profiles for select to authenticated
  using (id = (select auth.uid()) or id = (select private.partner_id()));
create policy profiles_update_self on public.profiles for update to authenticated
  using (id = (select auth.uid())) with check (id = (select auth.uid()));
create policy profile_settings_select_self on public.profile_settings for select to authenticated
  using (profile_id = (select auth.uid()));
create policy profile_settings_update_self on public.profile_settings for update to authenticated
  using (profile_id = (select auth.uid())) with check (profile_id = (select auth.uid()));
create policy couples_select_member on public.couples for select to authenticated
  using (id = (select private.current_couple_id()));
create policy couple_members_select_member on public.couple_members for select to authenticated
  using (left_at is null and couple_id = (select private.current_couple_id()));

alter table public.invites enable row level security;
grant select (id, created_by, expires_at, used_at, cancelled_at, created_at) on public.invites to authenticated;
create policy invites_select_creator on public.invites for select to authenticated
  using (created_by = (select auth.uid()));
