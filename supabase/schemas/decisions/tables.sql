-- Decisions: tables, indexes and constraints.

create table public.decisions (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  title text not null check (char_length(title) between 1 and 120), closed_at timestamptz,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());

create table public.decision_options (
  id uuid primary key default gen_random_uuid(), decision_id uuid not null references public.decisions (id) on delete cascade,
  author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  title text not null check (char_length(title) between 1 and 120), created_at timestamptz not null default now());
-- Private ranking: the other person's ranks are never readable, only the combined result.
create table public.decision_ranks (
  id uuid primary key default gen_random_uuid(), option_id uuid not null references public.decision_options (id) on delete cascade,
  author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  rank smallint not null check (rank between 1 and 20), created_at timestamptz not null default now(), updated_at timestamptz not null default now(),
  unique (option_id, author_id));

create index decision_ranks_option_idx on public.decision_ranks (option_id);
