-- Important dates and date ideas: tables, indexes and constraints.

create table public.saved_date_ideas (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  content_slug text, title text not null check (char_length(title) between 1 and 120), notes text check (char_length(notes) <= 1000),
  status public.date_idea_status not null default 'saved', planned_for date,
  place_name text check (char_length(place_name) <= 120), place_address text check (char_length(place_address) <= 240),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.important_dates (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  title text not null check (char_length(title) between 1 and 120),
  kind public.important_date_kind not null default 'custom',
  month smallint not null check (month between 1 and 12), day smallint not null check (day between 1 and 31), year smallint check (year between 1900 and 2200),
  yearly boolean not null default true, remind_days smallint[] not null default '{7,1}', hidden boolean not null default false,
  origin public.important_date_origin not null default 'manual', holiday_key text,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
