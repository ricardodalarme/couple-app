-- Declarative mirror of migration 20261110000800_couple_flows.sql (DDL only; seed rows and cron jobs live in the migration).
-- NOTE: this file alters or redefines objects first declared in earlier files; when running pg-delta, fold each object into one definition.
-- Things two people do with each other: pause, signals (need, miss us, hug, distance, repair, heavy day),
-- messages for the widget, couple questions, weekly check-in, games. (BE-017, BE-022 pause part, BE-026..BE-029)

-- Pause with a promise to return ---------------------------------------------------------------------
create table public.pauses (
  id uuid primary key default gen_random_uuid(),
  started_by uuid not null references public.profiles (id) on delete cascade,
  couple_id uuid references public.couples (id) on delete set null,
  return_at timestamptz not null,
  message text not null check (char_length(message) between 1 and 200),
  started_at timestamptz not null default now(),
  ended_at timestamptz,
  constraint pauses_return_within_a_day check (return_at <= started_at + interval '24 hours')
);
create unique index pauses_one_active_per_person on public.pauses (started_by) where ended_at is null;
create index pauses_couple_idx on public.pauses (couple_id);
create index pauses_started_by_idx on public.pauses (started_by, started_at desc);
alter table public.pauses enable row level security;
grant select on public.pauses to authenticated;
-- The partner sees only the message the person wrote and the return time. No reason, no history of extensions.
create policy pauses_select_own_or_couple on public.pauses for select to authenticated
  using (started_by = (select auth.uid()) or couple_id = (select private.current_couple_id()));

create function public.start_pause(return_at timestamptz, message text default null) returns public.pauses
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.pauses; v_partner uuid := private.partner_id();
begin
  if return_at is null or return_at <= now() or return_at > now() + interval '24 hours' then
    raise exception 'INVALID_RETURN_TIME' using errcode = 'P0001';
  end if;
  update public.pauses p set ended_at = now() where p.started_by = v_uid and p.ended_at is null;
  insert into public.pauses (started_by, couple_id, return_at, message)
  values (v_uid, private.current_couple_id(), start_pause.return_at, coalesce(nullif(btrim(start_pause.message), ''), 'Preciso de um tempo.'))
  returning * into v_row;
  perform private.enqueue_notification(v_partner, 'pause_started', v_row.id, 'pause_started:' || v_row.id);
  insert into private.notification_outbox (profile_id, type, ref_id, dedupe_key, send_after)
  values (v_uid, 'pause_over', v_row.id, 'pause_over:' || v_row.id, v_row.return_at) on conflict (dedupe_key) do nothing;
  if v_partner is not null then perform private.signal('user:' || v_partner, 'pause_changed'); end if;
  return v_row;
end $$;

create function public.end_pause() returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_partner uuid := private.partner_id(); v_id uuid;
begin
  update public.pauses p set ended_at = now() where p.started_by = v_uid and p.ended_at is null returning p.id into v_id;
  if v_id is null then return false; end if;
  update private.notification_outbox set sent_at = now(), outcome = 'cancelled' where dedupe_key = 'pause_over:' || v_id and sent_at is null;
  if v_partner is not null then perform private.signal('user:' || v_partner, 'pause_changed'); end if;
  return true;
end $$;

-- Pauses never stay open: closed at the promised time (hourly job, plus on read through active_pause).
create function private.expire_pauses() returns integer
language plpgsql security definer set search_path = '' as $$
declare v_n integer;
begin
  update public.pauses set ended_at = return_at where ended_at is null and return_at <= now();
  get diagnostics v_n = row_count;
  return v_n;
end $$;

-- The pause that matters to the caller right now: their own, or their partner's.
create function public.active_pause() returns public.pauses
language sql stable security definer set search_path = '' as $$
  select p.* from public.pauses p
  where p.ended_at is null and p.return_at > now()
    and (p.started_by = auth.uid() or (p.couple_id = private.current_couple_id() and p.started_by = private.partner_id()))
  order by (p.started_by = auth.uid()) desc, p.started_at desc limit 1;
$$;

-- No reminders during a pause or a fresh "fight" (product rule). Partner-initiated messages still arrive.
create function private.is_quiet_moment(p_profile_id uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (select 1 from public.pauses p where p.ended_at is null and p.return_at > now()
                 and (p.started_by = p_profile_id or p.couple_id in (select couple_id from public.couple_members where profile_id = p_profile_id and left_at is null)))
      or exists (select 1 from public.temperature_checks t where t.author_id = p_profile_id and t.level = 'fight' and t.created_at > now() - interval '24 hours')
      or exists (select 1 from public.profile_settings s where s.profile_id = p_profile_id
                 and (s.relationship_status <> 'together' or s.app_paused_until > now()));
$$;

-- Signals: one-tap messages between partners ---------------------------------------------------------
create table public.signals (
  id uuid primary key default gen_random_uuid(),
  sender_id uuid not null references public.profiles (id) on delete cascade,
  recipient_id uuid not null references public.profiles (id) on delete cascade,
  kind text not null check (kind in ('need', 'miss_us', 'hug', 'distance', 'repair', 'heavy_day', 'good_news')),
  value text check (char_length(value) <= 40),
  body text check (char_length(body) <= 500),
  response text check (response in ('here', 'talk', 'more_time', 'will_do', 'not_now', 'plan', 'later', 'heart')),
  responded_at timestamptz,
  seen_at timestamptz,
  created_at timestamptz not null default now()
);
create index signals_recipient_idx on public.signals (recipient_id, created_at desc);
create index signals_sender_idx on public.signals (sender_id, created_at desc);
alter table public.signals enable row level security;
grant select on public.signals to authenticated;
create policy signals_select_sender_or_recipient on public.signals for select to authenticated
  using (sender_id = (select auth.uid()) or recipient_id = (select auth.uid()));

create function public.send_signal(kind text, value text default null, body text default null) returns public.signals
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_partner uuid := private.partner_id(); v_row public.signals;
begin
  if v_partner is null then raise exception 'NOT_PAIRED' using errcode = 'P0001'; end if;
  if not private.hit_rate_limit('signal:' || v_uid, 30, interval '1 day') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  insert into public.signals (sender_id, recipient_id, kind, value, body)
  values (v_uid, v_partner, send_signal.kind, send_signal.value, nullif(btrim(send_signal.body), '')) returning * into v_row;
  perform private.enqueue_notification(v_partner, 'signal_' || v_row.kind, v_row.id, 'signal:' || v_row.id);
  perform private.signal('user:' || v_partner, 'signal');
  return v_row;
end $$;

-- Responses are never counted or scored; either answer is fine.
create function public.respond_to_signal(signal_id uuid, response text default null) returns public.signals
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.signals;
begin
  update public.signals s
  set seen_at = coalesce(s.seen_at, now()),
      response = coalesce(respond_to_signal.response, s.response),
      responded_at = case when respond_to_signal.response is null then s.responded_at else now() end
  where s.id = signal_id and s.recipient_id = v_uid returning s.* into v_row;
  if v_row.id is null then raise exception 'NOT_FOUND' using errcode = 'P0001'; end if;
  if response is not null then perform private.signal('user:' || v_row.sender_id, 'signal_response'); end if;
  return v_row;
end $$;

-- Messages to the partner (note, drawing, voice, "thinking of you" pack) ------------------------------
create table public.partner_messages (
  id uuid primary key default gen_random_uuid(),
  sender_id uuid not null references public.profiles (id) on delete cascade,
  recipient_id uuid not null references public.profiles (id) on delete cascade,
  kind text not null check (kind in ('note', 'drawing', 'voice', 'pack')),
  body text check (char_length(body) <= 280),
  media_path text check (char_length(media_path) <= 300),
  for_widget boolean not null default false,
  seen_at timestamptz,
  hearted_at timestamptz,
  created_at timestamptz not null default now(),
  constraint partner_messages_has_content check (body is not null or media_path is not null)
);
create index partner_messages_recipient_idx on public.partner_messages (recipient_id, created_at desc);
create index partner_messages_sender_idx on public.partner_messages (sender_id, created_at desc);
alter table public.partner_messages enable row level security;
grant select on public.partner_messages to authenticated;
create policy partner_messages_select_sender_or_recipient on public.partner_messages for select to authenticated
  using (sender_id = (select auth.uid()) or recipient_id = (select auth.uid()));

create function public.send_partner_message(kind text, body text default null, media_path text default null, for_widget boolean default false)
returns public.partner_messages language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_partner uuid := private.partner_id(); v_row public.partner_messages;
begin
  if v_partner is null then raise exception 'NOT_PAIRED' using errcode = 'P0001'; end if;
  if not private.hit_rate_limit('partner_message:' || v_uid, 30, interval '1 day') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  -- The widget shows a note only if the receiver allowed it; otherwise it is delivered in the app only.
  insert into public.partner_messages (sender_id, recipient_id, kind, body, media_path, for_widget)
  values (v_uid, v_partner, send_partner_message.kind, nullif(btrim(send_partner_message.body), ''), send_partner_message.media_path,
          coalesce(send_partner_message.for_widget, false)
            and coalesce((select widget_allow_partner_notes from public.profile_settings where profile_id = v_partner), false))
  returning * into v_row;
  perform private.enqueue_notification(v_partner, 'partner_message', v_row.id, 'partner_message:' || v_row.id);
  perform private.signal('user:' || v_partner, 'partner_message');
  return v_row;
end $$;

create function public.mark_partner_message(message_id uuid, hearted boolean default false) returns public.partner_messages
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.partner_messages;
begin
  update public.partner_messages m
  set seen_at = coalesce(m.seen_at, now()), hearted_at = case when hearted then coalesce(m.hearted_at, now()) else m.hearted_at end
  where m.id = message_id and m.recipient_id = v_uid returning m.* into v_row;
  if v_row.id is null then raise exception 'NOT_FOUND' using errcode = 'P0001'; end if;
  return v_row;
end $$;

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
alter table public.question_answers enable row level security;
grant select, insert, delete on public.question_answers to authenticated;
create function private.answered_question(p_slug text) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (select 1 from public.question_answers
                 where author_id = auth.uid() and question_slug = p_slug
                   and couple_id is not distinct from private.current_couple_id());
$$;
grant execute on function private.answered_question(text) to authenticated;
create policy question_answers_select_own_or_revealed on public.question_answers for select to authenticated
  using (author_id = (select auth.uid())
         or (author_id = (select private.partner_id()) and couple_id = (select private.current_couple_id())
             and private.answered_question(question_slug)));
create policy question_answers_insert_own on public.question_answers for insert to authenticated
  with check (author_id = (select auth.uid()) and (couple_id is null or couple_id = (select private.current_couple_id())));
create policy question_answers_delete_own on public.question_answers for delete to authenticated
  using (author_id = (select auth.uid()));

-- Has my partner answered? (True/false only, so Hoje can say "Ricardo já respondeu. Responda para ver.")
create function public.partner_answered(question_slug text) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (select 1 from public.question_answers a
                 where a.author_id = private.partner_id() and a.couple_id = private.current_couple_id()
                   and a.question_slug = partner_answered.question_slug);
$$;

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
alter table public.checkin_answers enable row level security;
grant select, insert, update, delete on public.checkin_answers to authenticated;
create function private.checkin_done(p_couple_id uuid, p_week date, p_profile_id uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select count(*) = 4 from public.checkin_answers
  where couple_id = p_couple_id and week_start = p_week and author_id = p_profile_id;
$$;
grant execute on function private.checkin_done(uuid, date, uuid) to authenticated;
create policy checkin_answers_select_own_or_both_done on public.checkin_answers for select to authenticated
  using (author_id = (select auth.uid())
         or (couple_id = (select private.current_couple_id())
             and private.checkin_done(couple_id, week_start, (select auth.uid()))
             and private.checkin_done(couple_id, week_start, author_id)));
create policy checkin_answers_insert_own on public.checkin_answers for insert to authenticated
  with check (author_id = (select auth.uid()) and couple_id = (select private.current_couple_id()));
create policy checkin_answers_update_own on public.checkin_answers for update to authenticated
  using (author_id = (select auth.uid())) with check (author_id = (select auth.uid()) and couple_id = (select private.current_couple_id()));
create policy checkin_answers_delete_own on public.checkin_answers for delete to authenticated
  using (author_id = (select auth.uid()));
create trigger checkin_answers_set_updated_at before update on public.checkin_answers
  for each row execute function private.set_updated_at();

-- Games: one invites, the other joins, answers are private until both finish. No score, no winner. ----
create table public.game_sessions (
  id uuid primary key default gen_random_uuid(),
  couple_id uuid not null references public.couples (id) on delete cascade,
  game text not null check (game in ('me_or_you', 'how_well', 'twenty_questions', 'never_have_we', 'compliments', 'mission')),
  invited_by uuid not null references public.profiles (id) on delete cascade,
  status text not null default 'invited' check (status in ('invited', 'active', 'finished', 'cancelled')),
  item_slugs text[] not null default '{}',
  outcome text check (outcome in ('great', 'ok', 'did_not_happen')),
  created_at timestamptz not null default now(),
  finished_at timestamptz
);
create index game_sessions_couple_idx on public.game_sessions (couple_id, created_at desc);
create index game_sessions_invited_by_idx on public.game_sessions (invited_by);
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
alter table public.game_sessions enable row level security;
alter table public.game_answers enable row level security;
grant select on public.game_sessions, public.game_answers to authenticated;
create policy game_sessions_select_couple on public.game_sessions for select to authenticated
  using (couple_id = (select private.current_couple_id()));
create policy game_answers_select_own_or_finished on public.game_answers for select to authenticated
  using (author_id = (select auth.uid())
         or exists (select 1 from public.game_sessions g where g.id = session_id and g.status = 'finished'));

create function public.invite_to_game(game text, item_slugs text[] default '{}') returns public.game_sessions
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_couple uuid := private.current_couple_id(); v_row public.game_sessions;
begin
  if v_couple is null then raise exception 'NOT_PAIRED' using errcode = 'P0001'; end if;
  update public.game_sessions g set status = 'cancelled'
  where g.couple_id = v_couple and g.game = invite_to_game.game and g.status in ('invited', 'active');
  insert into public.game_sessions (couple_id, game, invited_by, item_slugs)
  values (v_couple, invite_to_game.game, v_uid, coalesce(invite_to_game.item_slugs, '{}')) returning * into v_row;
  perform private.enqueue_notification(private.partner_id(), 'game_invite', v_row.id, 'game_invite:' || v_row.id);
  perform private.signal('couple:' || v_couple, 'game_changed');
  return v_row;
end $$;

-- Join, cancel, or finish (finish needs both to have answered every item when the game has items).
create function public.update_game(session_id uuid, action text, outcome text default null) returns public.game_sessions
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.game_sessions; v_n integer;
begin
  select * into v_row from public.game_sessions g
  where g.id = session_id and g.couple_id = private.current_couple_id() for update;
  if not found then raise exception 'NOT_FOUND' using errcode = 'P0001'; end if;
  if action = 'join' and v_row.status = 'invited' and v_row.invited_by <> v_uid then
    update public.game_sessions g set status = 'active' where g.id = v_row.id returning g.* into v_row;
  elsif action = 'cancel' and v_row.status in ('invited', 'active') then
    update public.game_sessions g set status = 'cancelled' where g.id = v_row.id returning g.* into v_row;
  elsif action = 'finish' and v_row.status = 'active' then
    v_n := coalesce(array_length(v_row.item_slugs, 1), 0);
    if v_n > 0 and (select count(*) from public.game_answers a where a.session_id = v_row.id) < 2 * v_n then
      raise exception 'GAME_NOT_COMPLETE' using errcode = 'P0001';
    end if;
    update public.game_sessions g set status = 'finished', finished_at = now(), outcome = update_game.outcome
    where g.id = v_row.id returning g.* into v_row;
  else
    raise exception 'INVALID_GAME_ACTION' using errcode = 'P0001';
  end if;
  perform private.signal('couple:' || v_row.couple_id, 'game_changed');
  return v_row;
end $$;

create function public.answer_game(session_id uuid, idx integer, answer text) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user();
begin
  if not exists (select 1 from public.game_sessions g
                 where g.id = session_id and g.couple_id = private.current_couple_id() and g.status = 'active') then
    raise exception 'NOT_FOUND' using errcode = 'P0001';
  end if;
  insert into public.game_answers as a (session_id, author_id, idx, answer)
  values (answer_game.session_id, v_uid, answer_game.idx, answer_game.answer)
  on conflict on constraint game_answers_once do update set answer = excluded.answer;
  return true;
end $$;

grant execute on function public.start_pause(timestamptz, text), public.end_pause(), public.active_pause(),
  public.send_signal(text, text, text), public.respond_to_signal(uuid, text),
  public.send_partner_message(text, text, text, boolean), public.mark_partner_message(uuid, boolean),
  public.partner_answered(text), public.invite_to_game(text, text[]), public.update_game(uuid, text, text),
  public.answer_game(uuid, integer, text) to authenticated;

-- The sender can take back a note or drawing (mirrors migration 20261111000300_delete_partner_message.sql).
create function public.delete_partner_message(message_id uuid) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_recipient uuid;
begin
  delete from public.partner_messages m
  where m.id = delete_partner_message.message_id and m.sender_id = v_uid
  returning m.recipient_id into v_recipient;
  if not found then return false; end if;
  perform private.signal('user:' || v_recipient, 'partner_message');
  return true;
end $$;
grant execute on function public.delete_partner_message(uuid) to authenticated;
