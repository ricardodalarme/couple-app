-- Gift pages: a gift idea is private until the author shares it with the current couple. (APP-062)
alter table public.gift_ideas
  add column couple_id uuid references public.couples (id) on delete set null;
create index if not exists gift_ideas_couple_idx on public.gift_ideas (couple_id);

drop policy if exists gift_ideas_select_own on public.gift_ideas;
create policy gift_ideas_select_own_or_couple on public.gift_ideas for select to authenticated
  using (author_id = (select auth.uid()) or couple_id = (select private.current_couple_id()));
