-- Couple questions and weekly check-in: tables, indexes and constraints.

-- Couple question: answers stay hidden until both have answered -------------------------------------
create table public.question_answers (
  id uuid primary key default gen_random_uuid(),
  author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  question_slug text not null check (char_length(question_slug) between 1 and 80),
  body text not null check (char_length(btrim(body)) between 1 and 1000),
  created_at timestamptz not null default now(),
  constraint question_answers_once unique (author_id, couple_id, question_slug)
);
create unique index question_answers_solo_once on public.question_answers (author_id, question_slug)
  where couple_id is null;
create index question_answers_couple_idx on public.question_answers (couple_id, question_slug);

-- Weekly check-in: four private answers each, revealed when both finished ---------------------------
create table public.checkin_answers (
  id uuid primary key default gen_random_uuid(),
  author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid not null references public.couples (id) on delete cascade,
  week_start date not null,
  question smallint not null check (question between 1 and 4),
  body text not null check (char_length(btrim(body)) between 1 and 1000),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint checkin_answers_once unique (author_id, couple_id, week_start, question)
);
create index checkin_answers_couple_idx on public.checkin_answers (couple_id, week_start);

create trigger checkin_answers_set_updated_at before update on public.checkin_answers
  for each row execute function private.set_updated_at();
