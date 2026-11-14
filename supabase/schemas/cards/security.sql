-- Cards: row level security, grants and policies.

alter table public.cards enable row level security;
alter table public.card_items enable row level security;
alter table public.card_reactions enable row level security;
alter table public.card_opens enable row level security;
grant select on public.cards, public.card_items, public.card_reactions, public.card_opens to authenticated;

-- The author sees their own cards in any status; the recipient sees them once sent. Deleted cards are hidden from both.
create policy cards_select on public.cards for select to authenticated
  using (deleted_at is null and (author_id = (select auth.uid())
         or (recipient_id = (select auth.uid()) and status = 'sent')));
create policy card_items_select_visible_card on public.card_items for select to authenticated
  using (exists (select 1 from public.cards c where c.id = card_id));
create policy card_reactions_select_visible_card on public.card_reactions for select to authenticated
  using (exists (select 1 from public.cards c where c.id = card_id));
create policy card_opens_select_recipient_or_shared on public.card_opens for select to authenticated
  using (exists (
    select 1 from public.cards c
    where c.id = card_id
      and (c.recipient_id = (select auth.uid())
           or (c.author_id = (select auth.uid()) and private.shares_read_receipts(c.recipient_id)))));
