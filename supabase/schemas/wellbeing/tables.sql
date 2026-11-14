-- Wellbeing: tables, indexes and constraints.

create table public.temperature_checks (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  level public.temperature_level not null,
  note text check (char_length(note) <= 500),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.repair_sessions (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  intensity smallint check (intensity between 1 and 10),
  path public.repair_path,
  step smallint not null default 0, feeling_after public.repair_feeling,
  draft text check (char_length(draft) <= 1000), completed_at timestamptz,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.repair_learnings (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  repair_session_id uuid references public.repair_sessions (id) on delete set null,
  kind public.repair_learning_kind not null, note text not null check (char_length(note) between 1 and 1000),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.journal_entries (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  entry_date date not null, body text not null check (char_length(body) between 1 and 5000), mood text check (char_length(mood) <= 30),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.conversation_preps (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  guide public.conversation_guide not null default 'free',
  topic text check (char_length(topic) <= 120), notes text check (char_length(notes) <= 5000), draft text check (char_length(draft) <= 2000),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());

create table public.moods (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  day date not null, mood public.mood not null,
  need public.mood_need, share public.mood_share not null default 'none',
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique (author_id, day));
create table public.cycle_days (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  day date not null, kind public.cycle_day_kind not null default 'heavy', note text check (char_length(note) <= 300),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique (author_id, day));

create trigger moods_local_date before insert on public.moods
  for each row execute function private.set_local_date('day');

create trigger journal_entries_local_date before insert on public.journal_entries
  for each row execute function private.set_local_date('entry_date');

create index repair_learnings_session_idx on public.repair_learnings (repair_session_id);
