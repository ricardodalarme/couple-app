-- Agreements: tables, indexes and constraints.

create table public.agreements (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  title text not null check (char_length(title) between 1 and 120), body text check (char_length(body) <= 1000),
  agreed_by uuid[] not null default '{}', review_on date,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
