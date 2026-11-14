-- Programs, quizzes and daily ideas: tables, indexes and constraints.

create table public.idea_responses (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  content_slug text not null, day date not null, response public.idea_response not null,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique (author_id, content_slug, day));
create table public.program_enrollments (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  program_slug text not null, current_day smallint not null default 1, completed_at timestamptz,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique (author_id, program_slug));
create table public.lesson_progress (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  program_slug text not null, lesson_day smallint not null, status public.lesson_status not null default 'done',
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique (author_id, program_slug, lesson_day));
create table public.quiz_results (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  quiz_key public.quiz_key not null, ranked text[] not null,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique (author_id, quiz_key));

create trigger idea_responses_local_date before insert on public.idea_responses
  for each row execute function private.set_local_date('day');
