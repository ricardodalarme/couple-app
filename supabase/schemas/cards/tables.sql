-- Cards: tables, indexes and constraints.

create table public.cards (
  id uuid primary key default gen_random_uuid(),
  author_id uuid not null references public.profiles (id) on delete cascade,
  recipient_id uuid references public.profiles (id) on delete set null,
  couple_id uuid references public.couples (id) on delete set null,
  week_start date not null,
  status public.card_status not null default 'draft',
  note text check (char_length(note) <= 500),
  sent_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz,
  constraint cards_one_per_week unique (author_id, week_start),
  constraint cards_sent_has_time check ((status = 'sent') = (sent_at is not null))
);
create index cards_recipient_idx on public.cards (recipient_id, sent_at desc) where status = 'sent';
create index cards_couple_id_idx on public.cards (couple_id);
comment on constraint cards_author_id_fkey on public.cards is e'@graphql({"foreign_name": "author", "local_name": "authoredCards"})';
comment on constraint cards_recipient_id_fkey on public.cards is e'@graphql({"foreign_name": "recipient", "local_name": "receivedCards"})';
create trigger cards_set_updated_at before update on public.cards
  for each row execute function private.set_updated_at();

-- Frozen copy of the slip text: later edits to a slip never change a card.
create table public.card_items (
  id uuid primary key default gen_random_uuid(),
  card_id uuid not null references public.cards (id) on delete cascade,
  slip_id uuid references public.slips (id) on delete set null,
  body text not null,
  feeling text,
  position integer not null,
  constraint card_items_slip_once unique (card_id, slip_id)
);
create index card_items_slip_id_idx on public.card_items (slip_id);
comment on constraint card_items_card_id_fkey on public.card_items is e'@graphql({"foreign_name": "card", "local_name": "items"})';

create table public.card_reactions (
  card_id uuid primary key references public.cards (id) on delete cascade,
  reaction text check (char_length(reaction) between 1 and 16),
  reply text check (char_length(btrim(reply)) between 1 and 500),
  from_guest boolean not null default false,
  reacted_at timestamptz not null default now(),
  constraint card_reactions_not_empty check (reaction is not null or reply is not null)
);
comment on constraint card_reactions_card_id_fkey on public.card_reactions is e'@graphql({"foreign_name": "card", "local_name": "reaction"})';

-- Opened only when a person taps Open. The author sees it only if the recipient shares read receipts.
create table public.card_opens (
  card_id uuid primary key references public.cards (id) on delete cascade,
  opened_at timestamptz not null default now()
);
comment on constraint card_opens_card_id_fkey on public.card_opens is e'@graphql({"foreign_name": "card", "local_name": "open"})';

-- "Enviar agora" (X-62): a single slip can be sent on its own, without touching the weekly card.
alter table public.cards add column kind public.card_kind not null default 'weekly';
alter table public.cards drop constraint cards_one_per_week;
create unique index cards_one_weekly_per_week on public.cards (author_id, week_start) where kind = 'weekly';
