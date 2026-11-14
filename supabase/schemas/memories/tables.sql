-- Memories, story and capsules: tables, indexes and constraints.

create table public.memories (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  title text not null check (char_length(title) between 1 and 160), body text check (char_length(body) <= 3000),
  happened_on date not null, date_precision public.date_precision not null default 'day',
  place text check (char_length(place) <= 120), photo_path text check (char_length(photo_path) <= 300),
  origin public.memory_origin not null default 'manual', source_id uuid,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.story_events (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  kind public.story_event_kind not null, title text check (char_length(title) <= 120),
  happened_on date not null, date_precision public.date_precision not null default 'day',
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());

create table public.capsules (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  body text not null check (char_length(body) between 1 and 3000), opens_on date not null, opened_at timestamptz,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());

create trigger memories_local_date before insert on public.memories
  for each row execute function private.set_local_date('happened_on');

create index if not exists capsules_author_idx on public.capsules (author_id, created_at desc);
create index if not exists capsules_couple_idx on public.capsules (couple_id);
create trigger capsules_set_updated_at before update on public.capsules
  for each row execute function private.set_updated_at();
