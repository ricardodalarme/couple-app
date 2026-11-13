-- Declarative mirror of migration 20261110000700_personal_and_shared_spaces.sql (DDL only; seed rows and cron jobs live in the migration).
-- NOTE: this file alters or redefines objects first declared in earlier files; when running pg-delta, fold each object into one definition.
-- Everything a person keeps for themselves, and everything a couple keeps together.
-- Covers: profile extras (onboarding, story, status), slip extras, temperature, repair notes, journal, partner sheet,
-- gifts, my manual, moods, cycle, programs progress, quizzes (owner-only tables), and rituals, logistics, planning,
-- date ideas, dates, memories, story, lists, agreements, capsules (owner + optional couple tables).
-- (BE-017 private part, BE-018, BE-019, BE-026, BE-027, BE-028, BE-031 progress)

-- Profile extras ------------------------------------------------------------------------------------
alter type public.relationship_phase add value if not exists 'engaged';
alter type public.relationship_phase add value if not exists 'restarting';
alter type public.relationship_phase add value if not exists 'with_parents';
create type public.relationship_status as enum ('together', 'on_break', 'ended', 'bereaved');

alter table public.profiles add column avatar_kind text not null default 'initials' check (avatar_kind in ('photo', 'illustration', 'initials'));
alter table public.profiles add column pronouns text check (char_length(pronouns) <= 30);
grant update (avatar_kind, pronouns) on public.profiles to authenticated;

alter table public.profile_settings
  add column goals text[] not null default '{}' check (goals <@ array['reconnect', 'fight_less', 'keep_romance', 'remember_dates', 'organize_routine', 'just_record']),
  add column together_since date,
  add column relationship_status public.relationship_status not null default 'together',
  add column app_paused_until timestamptz,
  add column holiday_countries text[] not null default '{BR}' check (cardinality(holiday_countries) <= 10),
  add column card_channel text not null default 'link' check (card_channel in ('link', 'app')),
  add column card_theme text not null default 'paper' check (char_length(card_theme) <= 30),
  add column slips_default_for_card boolean not null default false,
  add column widget_allow_partner_notes boolean not null default false,
  add column widget_on_lock_screen boolean not null default false,
  add column widget_in_discreet boolean not null default false,
  add column widget_show_names boolean not null default false,
  add column spice_enabled boolean not null default false,
  add column low_stimulation boolean not null default false,
  add column chat_enabled boolean not null default false,
  add column chat_store_facts boolean not null default false,
  add column heavy_day_sharing text not null default 'off' check (heavy_day_sharing in ('off', 'ask', 'always'));
grant update (goals, together_since, relationship_status, app_paused_until, holiday_countries, card_channel, card_theme,
  slips_default_for_card, widget_allow_partner_notes, widget_on_lock_screen, widget_in_discreet, widget_show_names,
  spice_enabled, low_stimulation, chat_enabled, chat_store_facts, heavy_day_sharing) on public.profile_settings to authenticated;

alter table public.notification_settings add column daily_max smallint not null default 2 check (daily_max between 0 and 2);
grant update (daily_max) on public.notification_settings to authenticated;

-- Slip extras ---------------------------------------------------------------------------------------
alter table public.slips
  add column category text check (category in ('said', 'did', 'noticed', 'helped')),
  add column work_area text check (work_area in ('planning', 'dates', 'kitchen', 'cleaning', 'kids', 'emotional', 'finances', 'other')),
  add column in_jar boolean not null default false;

create function public.set_slip_details(id uuid, category text default null, work_area text default null, in_jar boolean default null)
returns public.slips language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.slips;
begin
  update public.slips s
  set category = coalesce(set_slip_details.category, s.category),
      work_area = coalesce(set_slip_details.work_area, s.work_area),
      in_jar = coalesce(set_slip_details.in_jar, s.in_jar)
  where s.id = set_slip_details.id and s.author_id = v_uid and s.deleted_at is null
  returning s.* into v_row;
  if v_row.id is null then raise exception 'SLIP_NOT_FOUND' using errcode = 'P0001'; end if;
  return v_row;
end $$;

-- "Potinho do dia ruim": one random saved slip, only ever the author's own.
create function public.draw_from_jar() returns public.slips
language sql volatile security definer set search_path = '' as $$
  select s.* from public.slips s
  where s.author_id = auth.uid() and s.in_jar and s.deleted_at is null
  order by random() limit 1;
$$;
grant execute on function public.set_slip_details(uuid, text, text, boolean), public.draw_from_jar() to authenticated;

-- Table definitions ---------------------------------------------------------------------------------
-- Owner-only tables: column author_id, visible and writable only by the author.
create table public.temperature_checks (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  level text not null check (level in ('good', 'so_so', 'turbulent', 'fight')),
  note text check (char_length(note) <= 500),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.repair_sessions (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  intensity smallint check (intensity between 1 and 10),
  path text check (path in ('pause', 'quick', 'soft_start', 'guided', 'apology')),
  step smallint not null default 0, feeling_after text check (feeling_after in ('calmer', 'still_tense', 'need_more_time')),
  draft text check (char_length(draft) <= 1000), completed_at timestamptz,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.repair_learnings (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  repair_session_id uuid references public.repair_sessions (id) on delete set null,
  kind text not null check (kind in ('trigger', 'need', 'good_fix')), note text not null check (char_length(note) between 1 and 1000),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.journal_entries (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  entry_date date not null default current_date, body text not null check (char_length(body) between 1 and 5000), mood text check (char_length(mood) <= 30),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.conversation_preps (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  guide text not null default 'free' check (guide in ('free', 'transition', 'money', 'apology', 'difficult')),
  topic text check (char_length(topic) <= 120), notes text check (char_length(notes) <= 5000), draft text check (char_length(draft) <= 2000),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.partner_facts (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  label text not null check (char_length(label) between 1 and 80), value text not null check (char_length(value) between 1 and 500),
  category text check (category in ('likes', 'dislikes', 'sizes', 'health', 'comfort', 'people', 'other')),
  source text not null default 'manual' check (source in ('manual', 'chat', 'game', 'learning')),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.gift_ideas (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  kind text not null default 'idea' check (kind in ('idea', 'wish')),
  title text not null check (char_length(title) between 1 and 120), note text check (char_length(note) <= 1000),
  occasion_date_id uuid, status text not null default 'idea' check (status in ('idea', 'planned', 'given')), budget text check (budget in ('free', 'low', 'medium', 'high')),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.manual_entries (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  key text not null check (char_length(key) between 1 and 60), value text not null check (char_length(value) between 1 and 1000),
  shared boolean not null default false,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique (author_id, key));
create table public.moods (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  day date not null default current_date, mood text not null check (mood in ('happy', 'tired', 'sad', 'stressed', 'loving', 'playful')),
  need text check (need in ('listen', 'opinion', 'hug', 'space')), share text not null default 'none' check (share in ('none', 'mood', 'mood_need')),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique (author_id, day));
create table public.cycle_days (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  day date not null, kind text not null default 'heavy' check (kind in ('heavy', 'light', 'note')), note text check (char_length(note) <= 300),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique (author_id, day));
create table public.idea_responses (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  content_slug text not null, day date not null default current_date, response text not null check (response in ('will_do', 'done', 'skip', 'saved')),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique (author_id, content_slug, day));
create table public.program_enrollments (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  program_slug text not null, current_day smallint not null default 1, completed_at timestamptz,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique (author_id, program_slug));
create table public.lesson_progress (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  program_slug text not null, lesson_day smallint not null, status text not null default 'done' check (status in ('done', 'saved')),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique (author_id, program_slug, lesson_day));
create table public.quiz_results (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  quiz_key text not null check (quiz_key in ('loved', 'conflict_style')), ranked text[] not null,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(), unique (author_id, quiz_key));

-- Owner + optional couple tables: private while couple_id is null, shared with the partner when it is set.
create table public.rituals (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  title text not null check (char_length(title) between 1 and 80), cadence text not null default 'weekly' check (cadence in ('daily', 'weekly', 'biweekly', 'monthly')),
  weekday smallint check (weekday between 0 and 6), at_time time, reminder boolean not null default false, archived_at timestamptz,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
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
create table public.saved_date_ideas (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  content_slug text, title text not null check (char_length(title) between 1 and 120), notes text check (char_length(notes) <= 1000),
  status text not null default 'saved' check (status in ('saved', 'planned', 'done')), planned_for date,
  place_name text check (char_length(place_name) <= 120), place_address text check (char_length(place_address) <= 240),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.important_dates (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  title text not null check (char_length(title) between 1 and 120),
  kind text not null default 'custom' check (kind in ('relationship', 'birthday', 'first', 'holiday', 'trip', 'reunion', 'custom')),
  month smallint not null check (month between 1 and 12), day smallint not null check (day between 1 and 31), year smallint check (year between 1900 and 2200),
  yearly boolean not null default true, remind_days smallint[] not null default '{7,1}', hidden boolean not null default false,
  origin text not null default 'manual' check (origin in ('manual', 'auto', 'chat')), holiday_key text,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.memories (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  title text not null check (char_length(title) between 1 and 160), body text check (char_length(body) <= 3000),
  happened_on date not null default current_date, date_precision text not null default 'day' check (date_precision in ('day', 'month', 'year')),
  place text check (char_length(place) <= 120), photo_path text check (char_length(photo_path) <= 300),
  origin text not null default 'manual' check (origin in ('manual', 'slip', 'card', 'question', 'game', 'mission', 'share', 'chat', 'first')), source_id uuid,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.story_events (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  kind text not null check (kind in ('met', 'dating', 'engaged', 'married', 'custom')), title text check (char_length(title) <= 120),
  happened_on date not null, date_precision text not null default 'day' check (date_precision in ('day', 'month', 'year')),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.lists (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  title text not null check (char_length(title) between 1 and 80), kind text not null default 'custom' check (kind in ('travel', 'restaurants', 'movies', 'custom')),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.agreements (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  title text not null check (char_length(title) between 1 and 120), body text check (char_length(body) <= 1000),
  agreed_by uuid[] not null default '{}', review_on date,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.capsules (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  body text not null check (char_length(body) between 1 and 3000), opens_on date not null, opened_at timestamptz,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.decisions (
  id uuid primary key default gen_random_uuid(), author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  title text not null check (char_length(title) between 1 and 120), closed_at timestamptz,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());

-- Children of the shared tables: follow the visibility of their parent.
create table public.ritual_logs (
  id uuid primary key default gen_random_uuid(), ritual_id uuid not null references public.rituals (id) on delete cascade,
  author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  done_on date not null default current_date, skipped boolean not null default false,
  created_at timestamptz not null default now(), unique (ritual_id, done_on));
create table public.list_items (
  id uuid primary key default gen_random_uuid(), list_id uuid not null references public.lists (id) on delete cascade,
  author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  title text not null check (char_length(title) between 1 and 160), status text not null default 'dream' check (status in ('dream', 'planned', 'done')),
  position integer not null default 0, created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table public.decision_options (
  id uuid primary key default gen_random_uuid(), decision_id uuid not null references public.decisions (id) on delete cascade,
  author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  title text not null check (char_length(title) between 1 and 120), created_at timestamptz not null default now());
-- Private ranking: the other person's ranks are never readable, only the combined result.
create table public.decision_ranks (
  id uuid primary key default gen_random_uuid(), option_id uuid not null references public.decision_options (id) on delete cascade,
  author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  rank smallint not null check (rank between 1 and 20), created_at timestamptz not null default now(), updated_at timestamptz not null default now(),
  unique (option_id, author_id));

alter table public.gift_ideas add constraint gift_ideas_occasion_date_id_fkey foreign key (occasion_date_id) references public.important_dates (id) on delete set null;

-- Policies, grants, triggers and indexes for all of the above, generated from three patterns --------------
do $$
declare t text;
begin
  -- pattern 1: owner only
  foreach t in array array['temperature_checks', 'repair_sessions', 'repair_learnings', 'journal_entries', 'conversation_preps',
    'partner_facts', 'manual_entries', 'moods', 'cycle_days', 'idea_responses', 'program_enrollments',
    'lesson_progress', 'quiz_results', 'decision_ranks'] loop
    execute format('alter table public.%I enable row level security', t);
    execute format('grant select, insert, update, delete on public.%I to authenticated', t);
    execute format('create policy %I on public.%I for select to authenticated using (author_id = (select auth.uid()))', t || '_select_own', t);
    execute format('create policy %I on public.%I for insert to authenticated with check (author_id = (select auth.uid()))', t || '_insert_own', t);
    execute format('create policy %I on public.%I for update to authenticated using (author_id = (select auth.uid())) with check (author_id = (select auth.uid()))', t || '_update_own', t);
    execute format('create policy %I on public.%I for delete to authenticated using (author_id = (select auth.uid()))', t || '_delete_own', t);
    execute format('create index if not exists %I on public.%I (author_id, created_at desc)', t || '_author_idx', t);
    execute format('create trigger %I before update on public.%I for each row execute function private.set_updated_at()', t || '_set_updated_at', t);
  end loop;
  -- pattern 2: owner, plus the current partner when couple_id is set
  foreach t in array array['rituals', 'logistic_items', 'logistics_meetings', 'planning_areas', 'saved_date_ideas', 'important_dates',
    'memories', 'story_events', 'lists', 'agreements', 'decisions'] loop
    execute format('alter table public.%I enable row level security', t);
    execute format('grant select, insert, update, delete on public.%I to authenticated', t);
    execute format('create policy %I on public.%I for select to authenticated using (author_id = (select auth.uid()) or couple_id = (select private.current_couple_id()))', t || '_select_own_or_couple', t);
    execute format('create policy %I on public.%I for insert to authenticated with check (author_id = (select auth.uid()) and (couple_id is null or couple_id = (select private.current_couple_id())))', t || '_insert_own', t);
    execute format('create policy %I on public.%I for update to authenticated using (author_id = (select auth.uid()) or couple_id = (select private.current_couple_id())) with check ((couple_id is null and author_id = (select auth.uid())) or couple_id = (select private.current_couple_id()))', t || '_update_own_or_couple', t);
    execute format('create policy %I on public.%I for delete to authenticated using (author_id = (select auth.uid()) or couple_id = (select private.current_couple_id()))', t || '_delete_own_or_couple', t);
    execute format('create index if not exists %I on public.%I (author_id, created_at desc)', t || '_author_idx', t);
    execute format('create index if not exists %I on public.%I (couple_id)', t || '_couple_idx', t);
    execute format('create index if not exists %I on public.%I (couple_id, created_at desc)', t || '_couple_created_idx', t);
    execute format('create trigger %I before update on public.%I for each row execute function private.set_updated_at()', t || '_set_updated_at', t);
  end loop;
end $$;

-- Gift ideas: the author writes, and the partner reads the ones shared with the current couple.
alter table public.gift_ideas enable row level security;
grant select, insert, update, delete on public.gift_ideas to authenticated;
create policy gift_ideas_select_own_or_couple on public.gift_ideas for select to authenticated
  using (author_id = (select auth.uid()) or couple_id = (select private.current_couple_id()));
create policy gift_ideas_insert_own on public.gift_ideas for insert to authenticated
  with check (author_id = (select auth.uid()) and (couple_id is null or couple_id = (select private.current_couple_id())));
create policy gift_ideas_update_own on public.gift_ideas for update to authenticated
  using (author_id = (select auth.uid()))
  with check (author_id = (select auth.uid()) and (couple_id is null or couple_id = (select private.current_couple_id())));
create policy gift_ideas_delete_own on public.gift_ideas for delete to authenticated
  using (author_id = (select auth.uid()));
create index if not exists gift_ideas_author_idx on public.gift_ideas (author_id, created_at desc);
create index if not exists gift_ideas_couple_idx on public.gift_ideas (couple_id);
create index if not exists gift_ideas_couple_created_idx on public.gift_ideas (couple_id, created_at desc);
create trigger gift_ideas_set_updated_at before update on public.gift_ideas
  for each row execute function private.set_updated_at();

-- pattern 3: children are visible and writable exactly when their parent row is visible
do $$
declare r record;
begin
  for r in select * from (values ('ritual_logs', 'rituals', 'ritual_id'), ('list_items', 'lists', 'list_id'), ('decision_options', 'decisions', 'decision_id')) v (child, parent, fk) loop
    execute format('alter table public.%I enable row level security', r.child);
    execute format('grant select, insert, update, delete on public.%I to authenticated', r.child);
    execute format('create policy %I on public.%I for select to authenticated using (exists (select 1 from public.%I p where p.id = %I))', r.child || '_select_via_parent', r.child, r.parent, r.fk);
    execute format('create policy %I on public.%I for insert to authenticated with check (author_id = (select auth.uid()) and exists (select 1 from public.%I p where p.id = %I))', r.child || '_insert_via_parent', r.child, r.parent, r.fk);
    execute format('create policy %I on public.%I for update to authenticated using (exists (select 1 from public.%I p where p.id = %I)) with check (exists (select 1 from public.%I p where p.id = %I))', r.child || '_update_via_parent', r.child, r.parent, r.fk, r.parent, r.fk);
    execute format('create policy %I on public.%I for delete to authenticated using (exists (select 1 from public.%I p where p.id = %I))', r.child || '_delete_via_parent', r.child, r.parent, r.fk);
    execute format('create index if not exists %I on public.%I (%I)', r.child || '_parent_idx', r.child, r.fk);
    execute format('create index if not exists %I on public.%I (author_id)', r.child || '_author_idx', r.child);
  end loop;
end $$;
create trigger list_items_set_updated_at before update on public.list_items
  for each row execute function private.set_updated_at();
create index decision_ranks_option_idx on public.decision_ranks (option_id);
create index gift_ideas_occasion_idx on public.gift_ideas (occasion_date_id);
create index logistic_items_assignee_idx on public.logistic_items (assignee_id);
create index planning_areas_owner_idx on public.planning_areas (owner_id);
create index repair_learnings_session_idx on public.repair_learnings (repair_session_id);

-- Exceptions to the patterns ------------------------------------------------------------------------
-- My manual: the partner reads only entries I marked as shared.
create policy manual_entries_select_shared_by_partner on public.manual_entries for select to authenticated
  using (shared and author_id = (select private.partner_id()));
-- Capsules: sealed until the open date, author-only writes, and nobody edits after sealing.
alter table public.capsules enable row level security;
grant select, insert, delete on public.capsules to authenticated;
revoke update on public.capsules from authenticated;
create policy capsules_select_own_or_opened on public.capsules for select to authenticated
  using (author_id = (select auth.uid()) or (couple_id = (select private.current_couple_id()) and opens_on <= current_date));
create policy capsules_insert_own on public.capsules for insert to authenticated
  with check (author_id = (select auth.uid()) and (couple_id is null or couple_id = (select private.current_couple_id())));
create policy capsules_delete_own on public.capsules for delete to authenticated
  using (author_id = (select auth.uid()));
create index if not exists capsules_author_idx on public.capsules (author_id, created_at desc);
create index if not exists capsules_couple_idx on public.capsules (couple_id);
create trigger capsules_set_updated_at before update on public.capsules
  for each row execute function private.set_updated_at();

create function private.enforce_capsule_open_window() returns trigger
language plpgsql set search_path = '' as $$
begin
  if new.opens_on < current_date + 7 then
    raise exception 'CAPSULE_OPENS_TOO_SOON' using errcode = '23514';
  end if;
  if new.opens_on > (current_date + interval '50 years')::date then
    raise exception 'CAPSULE_OPENS_TOO_FAR' using errcode = '23514';
  end if;
  return new;
end $$;
create trigger capsules_open_window before insert on public.capsules
  for each row execute function private.enforce_capsule_open_window();
-- Temperature "fight" expires after 24 hours (product rule): the current state for the caller.
create function public.current_temperature() returns public.temperature_checks
language sql stable security definer set search_path = '' as $$
  select t.* from public.temperature_checks t
  where t.author_id = auth.uid() and (t.level <> 'fight' or t.created_at > now() - interval '24 hours')
  order by t.created_at desc limit 1;
$$;
-- Mood the partner chose to share today (need only when they shared it).
create view public.partner_mood with (security_invoker = true) as
  select m.id, m.day, m.mood, m.need from public.moods m where false;
grant select on public.partner_mood to authenticated;
create function public.partner_mood_today() returns public.partner_mood
language sql stable security definer set search_path = '' as $$
  select m.id, m.day, m.mood, case when m.share = 'mood_need' then m.need end
  from public.moods m join public.profile_settings s on s.profile_id = m.author_id
  where m.author_id = private.partner_id() and m.share <> 'none' and m.day = (now() at time zone s.time_zone)::date;
$$;
-- Agreements: each partner adds their own agreement, nobody can agree for the other.
create function public.agree(agreement_id uuid, agreed boolean default true) returns public.agreements
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.agreements;
begin
  update public.agreements a
  set agreed_by = case when agreed then array(select distinct unnest(a.agreed_by || v_uid)) else array_remove(a.agreed_by, v_uid) end
  where a.id = agreement_id and (a.author_id = v_uid or a.couple_id = private.current_couple_id())
  returning a.* into v_row;
  if v_row.id is null then raise exception 'NOT_FOUND' using errcode = 'P0001'; end if;
  return v_row;
end $$;
revoke update (agreed_by) on public.agreements from authenticated;
revoke update on public.agreements from authenticated;
grant update (title, body, review_on, couple_id) on public.agreements to authenticated;
-- Decide together: options ordered by the combined ranking, only once both partners have ranked every option.
create function public.decision_result(decision_id uuid) returns setof public.decision_options
language sql stable security definer set search_path = '' as $$
  select o.* from public.decision_options o
  join public.decisions d on d.id = o.decision_id
  where o.decision_id = decision_result.decision_id
    and (d.author_id = auth.uid() or d.couple_id = private.current_couple_id())
    and not exists (
      select 1 from public.decision_options o2 cross join (values (auth.uid()), (private.partner_id())) who (id)
      where o2.decision_id = d.id
        and not exists (select 1 from public.decision_ranks r where r.option_id = o2.id and r.author_id = who.id))
  order by (select sum(r.rank) from public.decision_ranks r where r.option_id = o.id), o.created_at;
$$;
grant execute on function public.current_temperature(), public.partner_mood_today(), public.agree(uuid, boolean),
  public.decision_result(uuid) to authenticated;
