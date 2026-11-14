-- Signals: tables, indexes and constraints.

-- Signals: one-tap messages between partners ---------------------------------------------------------
create table public.signals (
  id uuid primary key default gen_random_uuid(),
  sender_id uuid not null references public.profiles (id) on delete cascade,
  recipient_id uuid not null references public.profiles (id) on delete cascade,
  kind public.signal_kind not null,
  value text check (char_length(value) <= 40),
  body text check (char_length(body) <= 500),
  response public.signal_response,
  responded_at timestamptz,
  seen_at timestamptz,
  created_at timestamptz not null default now()
);
create index signals_recipient_idx on public.signals (recipient_id, created_at desc);
create index signals_sender_idx on public.signals (sender_id, created_at desc);
create index signals_recipient_unseen_idx on public.signals (recipient_id) where seen_at is null;
