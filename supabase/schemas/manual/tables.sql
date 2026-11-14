-- My manual and partner facts: tables, indexes and constraints.

create table public.partner_facts (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  label text not null check (char_length(label) between 1 and 80), value text not null check (char_length(value) between 1 and 500),
  category public.partner_fact_category,
  source public.partner_fact_source not null default 'manual',
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());

create table public.manual_entries (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  key text not null check (char_length(key) between 1 and 60), value text not null check (char_length(value) between 1 and 1000),
  shared boolean not null default false,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique (author_id, key));
