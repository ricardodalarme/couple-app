-- Learnings saved from the chat: the author can insert their own pending items. (APP-084, APP-085)
grant insert (target, text, excerpt) on public.learned_items to authenticated;

create policy learned_items_insert_own on public.learned_items for insert to authenticated
  with check (author_id = (select auth.uid()));
