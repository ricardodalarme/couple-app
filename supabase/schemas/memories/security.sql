-- Memories, story and capsules: row level security, grants and policies.

-- Capsules: sealed until the open date, author-only writes, and nobody edits after sealing.
alter table public.capsules enable row level security;
grant select, insert, delete on public.capsules to authenticated;
revoke update on public.capsules from authenticated;
create policy capsules_select_own_or_opened on public.capsules for select to authenticated
  using (author_id = (select auth.uid()) or (couple_id = (select private.current_couple_id()) and opens_on <= current_date));
create policy capsules_insert_own on public.capsules for insert to authenticated
  with check (author_id = (select auth.uid()) and (couple_id is null or couple_id = (select private.current_couple_id())));
create policy capsules_delete_own on public.capsules for delete to authenticated
  using (author_id = (select auth.uid()));
