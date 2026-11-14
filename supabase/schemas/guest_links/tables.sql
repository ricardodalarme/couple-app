-- Guest links: tables, indexes and constraints.

create table public.guest_links (
  id uuid primary key default gen_random_uuid(),
  card_id uuid not null references public.cards (id) on delete cascade,
  token_hash bytea not null unique,
  expires_at timestamptz not null,
  revoked_at timestamptz,
  opened_at timestamptz,
  created_at timestamptz not null default now()
);
create index guest_links_card_id_idx on public.guest_links (card_id);
comment on constraint guest_links_card_id_fkey on public.guest_links is e'@graphql({"foreign_name": "card", "local_name": "guestLinks"})';

-- A guest who pressed "stop receiving" for this sender. The sender is never told.
create table private.guest_stops (
  sender_id uuid primary key references public.profiles (id) on delete cascade,
  stopped_at timestamptz not null default now()
);

create table private.abuse_reports (
  id uuid primary key default gen_random_uuid(),
  reported_profile_id uuid references public.profiles (id) on delete set null,
  card_id uuid references public.cards (id) on delete set null,
  source text not null check (source in ('guest', 'app')),
  reason text not null check (char_length(reason) between 1 and 60),
  details text check (char_length(details) <= 2000),
  card_snapshot jsonb,
  created_at timestamptz not null default now()
);
create index abuse_reports_reported_idx on private.abuse_reports (reported_profile_id);
create index abuse_reports_card_idx on private.abuse_reports (card_id);
