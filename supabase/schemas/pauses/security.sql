-- Pauses: row level security, grants and policies.

alter table public.pauses enable row level security;
grant select on public.pauses to authenticated;
-- The partner sees only the message the person wrote and the return time. No reason, no history of extensions.
create policy pauses_select_own_or_couple on public.pauses for select to authenticated
  using (started_by = (select auth.uid()) or couple_id = (select private.current_couple_id()));
