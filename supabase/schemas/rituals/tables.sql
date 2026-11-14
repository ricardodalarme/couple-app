-- Rituals: tables, indexes and constraints.

create table public.rituals (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  title text not null check (char_length(title) between 1 and 80), cadence public.ritual_cadence not null default 'weekly',
  weekday smallint check (weekday between 0 and 6), at_time time, reminder boolean not null default false, archived_at timestamptz,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());

create table public.ritual_logs (
  id uuid primary key default gen_random_uuid(), ritual_id uuid not null references public.rituals (id) on delete cascade,
  author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  done_on date not null, skipped boolean not null default false,
  created_at timestamptz not null default now(), unique (ritual_id, done_on));

create trigger ritual_logs_local_date before insert on public.ritual_logs
  for each row execute function private.set_local_date('done_on');
