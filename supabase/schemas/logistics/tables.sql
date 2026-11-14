-- Logistics: tables, indexes and constraints.

create table public.logistic_items (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  title text not null check (char_length(title) between 1 and 120), assignee_id uuid references public.profiles (id) on delete set null,
  due_on date, week_start date, invisible_work boolean not null default false, done_at timestamptz,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.logistics_meetings (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  week_start date not null, notes text check (char_length(notes) <= 3000), held_at timestamptz,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.planning_areas (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  area text not null check (char_length(area) between 1 and 80), owner_id uuid references public.profiles (id) on delete set null,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());

create index logistic_items_assignee_idx on public.logistic_items (assignee_id);
create index planning_areas_owner_idx on public.planning_areas (owner_id);
