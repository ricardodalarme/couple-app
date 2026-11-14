-- Gifts: row level security, grants and policies.

-- Gift ideas: the author writes, and the partner reads the ones shared with the current couple.
alter table public.gift_ideas enable row level security;
grant select, insert, update, delete on public.gift_ideas to authenticated;
create policy gift_ideas_select_own_or_couple on public.gift_ideas for select to authenticated
  using (author_id = (select auth.uid()) or couple_id = (select private.current_couple_id()));
create policy gift_ideas_insert_own on public.gift_ideas for insert to authenticated
  with check (author_id = (select auth.uid()) and (couple_id is null or couple_id = (select private.current_couple_id())));
create policy gift_ideas_update_own on public.gift_ideas for update to authenticated
  using (author_id = (select auth.uid()))
  with check (author_id = (select auth.uid()) and (couple_id is null or couple_id = (select private.current_couple_id())));
create policy gift_ideas_delete_own on public.gift_ideas for delete to authenticated
  using (author_id = (select auth.uid()));
