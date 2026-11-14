-- Notifications: row level security, grants and policies.

alter table public.devices enable row level security;
grant select (id, profile_id, platform, label, created_at, last_seen_at) on public.devices to authenticated;
create policy devices_select_own on public.devices for select to authenticated
  using (profile_id = (select auth.uid()));

alter table public.notification_settings enable row level security;
grant select on public.notification_settings to authenticated;
grant update (enabled, discreet, card_day, card_hour, muted_types) on public.notification_settings to authenticated;
create policy notification_settings_select_own on public.notification_settings for select to authenticated
  using (profile_id = (select auth.uid()));
create policy notification_settings_update_own on public.notification_settings for update to authenticated
  using (profile_id = (select auth.uid())) with check (profile_id = (select auth.uid()));

alter table private.notification_outbox enable row level security;
