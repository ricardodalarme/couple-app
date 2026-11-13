grant insert (target, text, excerpt) on public.learned_items to authenticated;

create policy learned_items_insert_own on public.learned_items for insert to authenticated
  with check (author_id = (select auth.uid()));
