-- Pauses: tables, indexes and constraints.

-- Pause with a promise to return ---------------------------------------------------------------------
create table public.pauses (
  id uuid primary key default gen_random_uuid(),
  started_by uuid not null references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  return_at timestamptz not null,
  message text not null check (char_length(message) between 1 and 200),
  started_at timestamptz not null default now(),
  ended_at timestamptz,
  constraint pauses_return_within_a_day check (return_at <= started_at + interval '24 hours')
);
create unique index pauses_one_active_per_person on public.pauses (started_by) where ended_at is null;
create index pauses_couple_idx on public.pauses (couple_id);
create index pauses_started_by_idx on public.pauses (started_by, started_at desc);
