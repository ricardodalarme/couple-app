-- Mascot chat: row level security, grants and policies.

alter table public.chat_messages enable row level security;
alter table public.learned_items enable row level security;
grant select on public.chat_messages to authenticated;
grant select, delete on public.learned_items to authenticated;
grant insert (target, text, excerpt) on public.learned_items to authenticated;
grant update (text, status) on public.learned_items to authenticated;
create policy chat_messages_select_own on public.chat_messages for select to authenticated using (author_id = (select auth.uid()));
create policy learned_items_select_own on public.learned_items for select to authenticated using (author_id = (select auth.uid()));
create policy learned_items_insert_own on public.learned_items for insert to authenticated with check (author_id = (select auth.uid()));
create policy learned_items_update_own on public.learned_items for update to authenticated using (author_id = (select auth.uid())) with check (author_id = (select auth.uid()));
create policy learned_items_delete_own on public.learned_items for delete to authenticated using (author_id = (select auth.uid()));
