-- Games: tables, indexes and constraints.

-- Games: one invites, the other joins, answers are private until both finish. No score, no winner. ----
create table public.game_sessions (
  id uuid primary key default gen_random_uuid(),
  couple_id uuid not null references public.couples (id) on delete cascade,
  game public.game_kind not null,
  invited_by uuid not null references public.profiles (id) on delete cascade,
  status public.game_status not null default 'invited',
  item_slugs text[] not null default '{}',
  outcome public.game_outcome,
  created_at timestamptz not null default now(),
  finished_at timestamptz
);
create index game_sessions_couple_idx on public.game_sessions (couple_id, created_at desc);
create index game_sessions_invited_by_idx on public.game_sessions (invited_by);
create unique index game_sessions_one_open on public.game_sessions (couple_id, game)
  where status in ('invited', 'active');
create table public.game_answers (
  id uuid primary key default gen_random_uuid(),
  session_id uuid not null references public.game_sessions (id) on delete cascade,
  author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  idx smallint not null check (idx between 0 and 50),
  answer text not null check (char_length(answer) between 1 and 500),
  created_at timestamptz not null default now(),
  constraint game_answers_once unique (session_id, author_id, idx)
);
create index game_answers_author_idx on public.game_answers (author_id);
