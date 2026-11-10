-- Declarative mirror of migration 20261110000900_content_plus_lifecycle.sql (DDL only; seed rows and cron jobs live in the migration).
-- NOTE: this file alters or redefines objects first declared in earlier files; when running pg-delta, fold each object into one definition.
-- Content catalog, Plus entitlements and free limits, consents, account deletion, safety support,
-- storage, mascot conversation, widget and Hoje v2, timeline, reminders. (BE-016, BE-019 reminders, BE-020..BE-025, BE-030, BE-031)

-- Small key/value configuration, readable by the app (limits, minimum app version).
create table public.app_config (
  key text primary key check (char_length(key) <= 60),
  value text not null
);
alter table public.app_config enable row level security;
grant select on public.app_config to anon, authenticated;
create policy app_config_read_all on public.app_config for select to anon, authenticated using (true);

-- Content catalog: every piece of editorial content, one row per language -----------------------------
create table public.content_items (
  id uuid primary key default gen_random_uuid(),
  kind text not null check (kind in ('question', 'daily_idea', 'date_idea', 'touch_card', 'spice_card', 'mission', 'me_or_you',
    'how_well', 'never_have_we', 'program', 'lesson', 'mood_tip', 'repair_card', 'ritual_idea', 'holiday', 'notification')),
  slug text not null check (char_length(slug) between 1 and 80),
  locale text not null check (locale in ('pt-BR', 'en')),
  title text not null check (char_length(title) <= 300),
  body text,
  parent_slug text,
  position integer not null default 0,
  tags text[] not null default '{}',
  month smallint check (month between 1 and 12),
  day smallint check (day between 1 and 31),
  country text check (char_length(country) = 2),
  plus_only boolean not null default false,
  sensitive boolean not null default false,
  published boolean not null default true,
  constraint content_items_unique unique (kind, slug, locale)
);
create index content_items_kind_idx on public.content_items (kind, locale, position);
create index content_items_parent_idx on public.content_items (parent_slug);
comment on table public.content_items is e'@graphql({"totalCount": {"enabled": true}, "description": "Editorial content. tags carry filters (phase, goal, budget, time, energy, place). holiday rows use month/day/country."})';
alter table public.content_items enable row level security;
grant select on public.content_items to authenticated;
-- Spice cards exist only for couples where both switched the mode on; unpublished rows never leave the database.
create function private.spice_allowed() returns boolean
language sql stable security definer set search_path = '' as $$
  select coalesce((select bool_and(s.spice_enabled) and count(*) = 2
                   from public.profile_settings s
                   where s.profile_id in (auth.uid(), private.partner_id())), false);
$$;
grant execute on function private.spice_allowed() to authenticated;
create policy content_items_read_published on public.content_items for select to authenticated
  using (published and (kind <> 'spice_card' or (select private.spice_allowed())));

-- Entitlements --------------------------------------------------------------------------------------
create table public.entitlements (
  profile_id uuid primary key references public.profiles (id) on delete cascade,
  plan text not null check (plan in ('plus_monthly', 'plus_annual', 'plus_gift')),
  status text not null check (status in ('trialing', 'active', 'grace', 'billing_issue', 'expired', 'refunded')),
  expires_at timestamptz,
  will_renew boolean not null default true,
  store text check (store in ('app_store', 'play_store', 'promo')),
  updated_at timestamptz not null default now()
);
alter table public.entitlements enable row level security;
grant select on public.entitlements to authenticated;
-- Plus covers both: each partner can see the other's entitlement row (plan and status only matter).
create policy entitlements_select_own_or_partner on public.entitlements for select to authenticated
  using (profile_id = (select auth.uid()) or profile_id = (select private.partner_id()));

create table private.purchase_events (
  event_id text primary key,
  profile_id uuid references public.profiles (id) on delete set null,
  type text not null,
  event_at timestamptz not null,
  received_at timestamptz not null default now()
);
create index purchase_events_profile_idx on private.purchase_events (profile_id);
alter table private.purchase_events enable row level security;

-- Called by the purchases webhook (service role). Idempotent by event id, ignores out-of-order older events.
create function private.apply_purchase_event(p_event_id text, p_profile_id uuid, p_type text, p_event_at timestamptz,
  p_plan text, p_status text, p_expires_at timestamptz, p_will_renew boolean, p_store text) returns boolean
language plpgsql security definer set search_path = '' as $$
begin
  insert into private.purchase_events (event_id, profile_id, type, event_at) values (p_event_id, p_profile_id, p_type, p_event_at)
  on conflict (event_id) do nothing;
  if not found then return false; end if;
  if not exists (select 1 from public.profiles where id = p_profile_id) then return false; end if;
  insert into public.entitlements as e (profile_id, plan, status, expires_at, will_renew, store, updated_at)
  values (p_profile_id, p_plan, p_status, p_expires_at, coalesce(p_will_renew, true), p_store, p_event_at)
  on conflict (profile_id) do update
    set plan = excluded.plan, status = excluded.status, expires_at = excluded.expires_at,
        will_renew = excluded.will_renew, store = excluded.store, updated_at = excluded.updated_at
    where e.updated_at <= excluded.updated_at;
  perform private.signal('user:' || p_profile_id, 'entitlement_changed');
  return true;
end $$;
grant execute on function private.apply_purchase_event(text, uuid, text, timestamptz, text, text, timestamptz, boolean, text) to service_role;

-- Plus is on when the person or their current partner has a live entitlement (48 h grace after expiry).
create function private.has_plus(p_profile_id uuid) returns boolean
language sql stable security definer set search_path = '' as $$
  select exists (
    select 1 from public.entitlements e
    where e.status in ('trialing', 'active', 'grace', 'billing_issue')
      and (e.expires_at is null or e.expires_at > now() - interval '48 hours')
      and (e.profile_id = p_profile_id
           or e.profile_id in (select o.profile_id from public.couple_members me
                               join public.couple_members o on o.couple_id = me.couple_id and o.left_at is null
                               where me.profile_id = p_profile_id and me.left_at is null)));
$$;
create view public.plus_state with (security_invoker = true) as
  select p.id as profile_id, false as has_plus, false as paid_by_partner, null::text as plan, null::text as status,
         null::timestamptz as expires_at, 0 as slips_left_this_month, 0 as cards_left_this_month
  from public.profiles p where false;
comment on view public.plus_state is e'@graphql({"primary_key_columns": ["profile_id"]})';
grant select on public.plus_state to authenticated;

create function private.month_usage(p_profile_id uuid, p_what text) returns integer
language sql stable security definer set search_path = '' as $$
  select case p_what
    when 'slips' then (select count(*) from public.slips s where s.author_id = p_profile_id
                         and s.created_at >= date_trunc('month', now()))
    else (select count(*) from public.cards c where c.author_id = p_profile_id and c.status = 'sent'
            and c.sent_at >= date_trunc('month', now())) end::integer;
$$;

create function public.my_plus() returns public.plus_state
language plpgsql stable security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); r public.plus_state; e public.entitlements;
begin
  r.profile_id := v_uid;
  r.has_plus := private.has_plus(v_uid);
  select * into e from public.entitlements where profile_id = v_uid;
  if not found or e.status in ('expired', 'refunded') then
    select * into e from public.entitlements where profile_id = private.partner_id();
    r.paid_by_partner := found and r.has_plus;
  else
    r.paid_by_partner := false;
  end if;
  r.plan := e.plan; r.status := e.status; r.expires_at := e.expires_at;
  r.slips_left_this_month := greatest(0, (select value::integer from public.app_config where key = 'free_slips_per_month') - private.month_usage(v_uid, 'slips'));
  r.cards_left_this_month := greatest(0, (select value::integer from public.app_config where key = 'free_cards_per_month') - private.month_usage(v_uid, 'cards'));
  return r;
end $$;
grant execute on function public.my_plus() to authenticated;

-- Free limit: applies to NEW slips and to sending cards. Nothing existing is ever locked or deleted.
-- Never applied to pause, repair, safety or deletion (those have no limit check at all).
create function private.enforce_free_slip_limit() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  -- saveSlip is an upsert: editing an existing slip must keep working at the limit.
  if exists (select 1 from public.slips where id = new.id) then
    return new;
  end if;
  if not private.has_plus(new.author_id)
     and private.month_usage(new.author_id, 'slips') >= (select value::integer from public.app_config where key = 'free_slips_per_month') then
    raise exception 'FREE_LIMIT_REACHED' using errcode = 'P0001';
  end if;
  return new;
end $$;
create trigger slips_free_limit before insert on public.slips
  for each row execute function private.enforce_free_slip_limit();

create function private.enforce_free_card_limit() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if not private.has_plus(new.author_id)
     and private.month_usage(new.author_id, 'cards') >= (select value::integer from public.app_config where key = 'free_cards_per_month') then
    raise exception 'FREE_LIMIT_REACHED' using errcode = 'P0001';
  end if;
  return new;
end $$;
create trigger cards_free_limit before update of status on public.cards
  for each row when (new.status = 'sent' and old.status <> 'sent') execute function private.enforce_free_card_limit();

-- Consents (versioned history; the newest row per kind is the current answer) -------------------------
create table public.consents (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  kind text not null check (kind in ('sensitive_data', 'analytics', 'marketing', 'ai', 'terms')),
  granted boolean not null,
  version text not null check (char_length(version) between 1 and 20),
  created_at timestamptz not null default now()
);
create index consents_profile_idx on public.consents (profile_id, kind, created_at desc);
alter table public.consents enable row level security;
grant select, insert on public.consents to authenticated;
create policy consents_select_own on public.consents for select to authenticated using (profile_id = (select auth.uid()));
create policy consents_insert_own on public.consents for insert to authenticated with check (profile_id = (select auth.uid()));

-- Account deletion: 14 days to change your mind, then everything goes --------------------------------
create table public.deletion_requests (
  profile_id uuid primary key references public.profiles (id) on delete cascade,
  requested_at timestamptz not null default now(),
  purge_after timestamptz not null
);
alter table public.deletion_requests enable row level security;
grant select on public.deletion_requests to authenticated;
create policy deletion_requests_select_own on public.deletion_requests for select to authenticated using (profile_id = (select auth.uid()));

-- Files to remove from Storage after their owner is gone (drained by the storage-cleanup Edge Function).
create table private.storage_deletions (
  id bigint generated always as identity primary key,
  bucket text not null, path text not null, queued_at timestamptz not null default now(), done_at timestamptz
);
alter table private.storage_deletions enable row level security;

create function public.request_account_deletion() returns public.deletion_requests
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_row public.deletion_requests;
begin
  insert into public.deletion_requests as d (profile_id, purge_after) values (v_uid, now() + interval '14 days')
  on conflict (profile_id) do update set profile_id = excluded.profile_id returning d.* into v_row;
  -- Deleting the account also ends the pairing right away; the partner sees a neutral "unpaired" state.
  perform public.unpair();
  return v_row;
end $$;
create function public.cancel_account_deletion() returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user();
begin
  delete from public.deletion_requests where profile_id = v_uid;
  return found;
end $$;

-- Erases one person: queues their files, then removes the auth user; every table cascades from profiles.
create function private.erase_profile(p_profile_id uuid) returns void
language plpgsql security definer set search_path = '' as $$
begin
  insert into private.storage_deletions (bucket, path)
  select o.bucket_id, o.name from storage.objects o
  where o.bucket_id in ('avatars', 'memories', 'messages') and (storage.foldername(o.name))[1] = p_profile_id::text;
  delete from private.rate_limits where key like '%:' || p_profile_id::text;
  delete from auth.users where id = p_profile_id;
  delete from public.profiles where id = p_profile_id;
end $$;
create function private.purge_deleted_accounts() returns integer
language plpgsql security definer set search_path = '' as $$
declare v_id uuid; v_n integer := 0;
begin
  for v_id in select profile_id from public.deletion_requests where purge_after <= now() loop
    perform private.erase_profile(v_id);
    v_n := v_n + 1;
  end loop;
  delete from private.rate_limits where window_start < now() - interval '2 days';
  delete from private.notification_outbox where sent_at < now() - interval '30 days';
  return v_n;
end $$;
grant execute on function public.request_account_deletion(), public.cancel_account_deletion() to authenticated;

-- "Terminamos" / after unpairing: remove what I created in the shared space, or keep it private to me.
create function public.resolve_shared_items(keep boolean) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); t text;
begin
  if private.current_couple_id() is not null then raise exception 'STILL_PAIRED' using errcode = 'P0001'; end if;
  foreach t in array array['rituals', 'logistic_items', 'logistics_meetings', 'planning_areas', 'saved_date_ideas', 'important_dates',
    'memories', 'story_events', 'lists', 'agreements', 'capsules', 'decisions'] loop
    if keep then
      execute format('update public.%I set couple_id = null where author_id = $1 and couple_id is not null', t) using v_uid;
    else
      execute format('delete from public.%I where author_id = $1 and couple_id is not null', t) using v_uid;
    end if;
  end loop;
  return true;
end $$;
grant execute on function public.resolve_shared_items(boolean) to authenticated;

-- Safety: nothing is stored. Safe mode and the safety triage live only on the device (a test enforces it),
-- Safety content lives only on the device; there is no table or content kind for it.

-- Support ---------------------------------------------------------------------------------------------
create table private.support_requests (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid references public.profiles (id) on delete set null,
  topic text not null check (topic in ('account', 'billing', 'bug', 'other')),
  message text not null check (char_length(message) between 1 and 2000),
  reply_email text check (char_length(reply_email) <= 254),
  app_version text, created_at timestamptz not null default now()
);
create index support_requests_profile_idx on private.support_requests (profile_id);
alter table private.support_requests enable row level security;
create function public.create_support_request(topic text, message text, reply_email text default null, app_version text default null) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user();
begin
  if not private.hit_rate_limit('support:' || v_uid, 5, interval '1 day') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  insert into private.support_requests (profile_id, topic, message, reply_email, app_version)
  values (v_uid, create_support_request.topic, btrim(create_support_request.message), create_support_request.reply_email, create_support_request.app_version);
  return true;
end $$;
grant execute on function public.create_support_request(text, text, text, text) to authenticated;

-- Storage: private buckets, first folder = owner id. Files are read through short-lived signed URLs. ------
create policy storage_owner_all on storage.objects for all to authenticated
  using (bucket_id in ('avatars', 'memories', 'messages') and (storage.foldername(name))[1] = (select auth.uid())::text)
  with check (bucket_id in ('avatars', 'memories', 'messages') and (storage.foldername(name))[1] = (select auth.uid())::text);
-- The partner may read: my avatar, files of memories I shared, and files I sent them.
create policy storage_partner_read on storage.objects for select to authenticated
  using ((storage.foldername(name))[1] = (select private.partner_id())::text and (
       bucket_id = 'avatars'
    or (bucket_id = 'memories' and exists (select 1 from public.memories m where m.photo_path = name and m.couple_id = (select private.current_couple_id())))
    or (bucket_id = 'messages' and exists (select 1 from public.partner_messages pm where pm.media_path = name and pm.recipient_id = (select auth.uid())))));

-- Mascot conversation (never called "AI chat" in the app). The Edge Function writes mascot messages. ------
create table public.chat_messages (
  id uuid primary key default gen_random_uuid(),
  author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  role text not null check (role in ('user', 'mascot')),
  body text check (char_length(body) <= 4000),
  component text check (component in ('slip', 'date', 'question', 'me_or_you', 'choices', 'next_step', 'pause', 'ritual', 'partner_fact')),
  component_data text,
  created_at timestamptz not null default now()
);
create index chat_messages_author_idx on public.chat_messages (author_id, created_at desc);
create table public.learned_items (
  id uuid primary key default gen_random_uuid(),
  author_id uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  target text not null check (target in ('partner_fact', 'date', 'memory', 'commitment')),
  text text not null check (char_length(text) between 1 and 500),
  excerpt text check (char_length(excerpt) <= 500),
  status text not null default 'pending' check (status in ('pending', 'confirmed', 'rejected')),
  created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);
create index learned_items_author_idx on public.learned_items (author_id, status);
alter table public.chat_messages enable row level security;
alter table public.learned_items enable row level security;
grant select, delete on public.chat_messages to authenticated;
grant select, delete on public.learned_items to authenticated;
grant update (text, status) on public.learned_items to authenticated;
create policy chat_messages_select_own on public.chat_messages for select to authenticated using (author_id = (select auth.uid()));
create policy chat_messages_delete_own on public.chat_messages for delete to authenticated using (author_id = (select auth.uid()));
create policy learned_items_select_own on public.learned_items for select to authenticated using (author_id = (select auth.uid()));
create policy learned_items_update_own on public.learned_items for update to authenticated using (author_id = (select auth.uid())) with check (author_id = (select auth.uid()));
create policy learned_items_delete_own on public.learned_items for delete to authenticated using (author_id = (select auth.uid()));
create trigger learned_items_set_updated_at before update on public.learned_items for each row execute function private.set_updated_at();

-- Messages left today for the caller (Plus only; "O Mascote precisa descansar e volta amanhã").
create function public.chat_messages_left() returns integer
language sql stable security definer set search_path = '' as $$
  select greatest(0,
    (select value::integer from public.app_config
     where key = case when private.has_plus(auth.uid()) then 'chat_messages_per_day_plus' else 'chat_messages_per_day_free' end)
    - (select count(*)::integer from public.chat_messages m
       where m.author_id = auth.uid() and m.role = 'user' and m.created_at >= date_trunc('day', now())));
$$;
grant execute on function public.chat_messages_left() to authenticated;

-- Notification rules v2: daily cap, and silence for reminders during a pause, a fight or time away ------
create or replace function private.should_send(p_profile_id uuid, p_type text, p_at timestamptz) returns text
language plpgsql stable security definer set search_path = '' as $$
declare
  v_s public.notification_settings; v_tz text; v_local time;
  v_from_partner boolean := p_type in ('card_received', 'card_reaction', 'partner_joined', 'unpaired', 'pause_started', 'partner_message', 'game_invite')
                            or p_type like 'signal_%';
begin
  select * into v_s from public.notification_settings where profile_id = p_profile_id;
  if not found or not v_s.enabled or p_type = any (v_s.muted_types) then
    return 'drop';
  end if;
  if p_type <> 'pause_over' and not v_from_partner then
    if private.is_quiet_moment(p_profile_id) then
      return 'drop';
    end if;
    if (select count(*) from private.notification_outbox o
        where o.profile_id = p_profile_id and o.outcome = 'sent' and o.sent_at > p_at - interval '24 hours'
          and o.type not in ('card_received', 'card_reaction', 'partner_joined', 'unpaired', 'pause_started', 'partner_message', 'game_invite', 'pause_over')
          and o.type not like 'signal_%') >= v_s.daily_max then
      return 'drop';
    end if;
  end if;
  select time_zone into v_tz from public.profile_settings where profile_id = p_profile_id;
  v_local := (p_at at time zone coalesce(v_tz, 'UTC'))::time;
  if p_type <> 'pause_over' and v_s.quiet_start <> v_s.quiet_end and (
       (v_s.quiet_start < v_s.quiet_end and v_local >= v_s.quiet_start and v_local < v_s.quiet_end)
    or (v_s.quiet_start > v_s.quiet_end and (v_local >= v_s.quiet_start or v_local < v_s.quiet_end))) then
    return 'delay';
  end if;
  return 'send';
end $$;

-- Daily job: date reminders (N days before), ritual reminders, and one gentle idea for people who want it.
create function private.next_occurrence(p_month smallint, p_day smallint, p_from date) returns date
language sql immutable set search_path = '' as $$
  select min(d) from (
    select (make_date(y, p_month, 1) + (least(p_day, extract(day from (make_date(y, p_month, 1) + interval '1 month - 1 day'))::int) - 1))::date as d
    from generate_series(extract(year from p_from)::int, extract(year from p_from)::int + 1) y) c
  where d >= p_from;
$$;
-- Hourly job, everything evaluated in each person's local time. Caps and quiet hours are applied at send time.
create function private.enqueue_daily_reminders() returns integer
language plpgsql security definer set search_path = '' as $$
declare v_n integer := 0; r record;
begin
  -- dates the person or the couple saved, N days before
  for r in
    select d.id, s.profile_id as target, private.next_occurrence(d.month, d.day, (now() at time zone s.time_zone)::date) as occ,
           (now() at time zone s.time_zone)::date as today, d.remind_days
    from public.important_dates d
    join public.profile_settings s on s.profile_id = d.author_id
      or s.profile_id in (select m.profile_id from public.couple_members m where m.couple_id = d.couple_id and m.left_at is null)
    where not d.hidden and d.kind <> 'holiday' and (d.yearly or d.year >= extract(year from now())::int)
      and extract(hour from now() at time zone s.time_zone) = 10
  loop
    if (r.occ - r.today) = any (r.remind_days) then
      perform private.enqueue_notification(r.target, 'date_coming', r.id, 'date:' || r.id || ':' || r.target || ':' || r.occ || ':' || (r.occ - r.today));
      v_n := v_n + 1;
    end if;
  end loop;
  -- holidays of the countries the person follows, 7 and 1 days before, unless they hid that holiday
  for r in
    select s.profile_id as target, h.slug, private.next_occurrence(h.month, h.day, (now() at time zone s.time_zone)::date) as occ,
           (now() at time zone s.time_zone)::date as today
    from public.profile_settings s
    join public.content_items h on h.kind = 'holiday' and h.published and h.locale = s.locale and h.country = any (s.holiday_countries)
    where extract(hour from now() at time zone s.time_zone) = 10
      and not exists (select 1 from public.important_dates d where d.author_id = s.profile_id and d.holiday_key = h.slug and d.hidden)
  loop
    if (r.occ - r.today) in (7, 1) then
      perform private.enqueue_notification(r.target, 'date_coming', null, 'holiday:' || r.slug || ':' || r.target || ':' || r.occ || ':' || (r.occ - r.today));
      v_n := v_n + 1;
    end if;
  end loop;
  -- rituals with a reminder, at their hour (weekly ones on their weekday)
  for r in
    select rt.id, s.profile_id as target, (now() at time zone s.time_zone)::date as today
    from public.rituals rt
    join public.profile_settings s on s.profile_id = rt.author_id
      or s.profile_id in (select m.profile_id from public.couple_members m where m.couple_id = rt.couple_id and m.left_at is null)
    where rt.reminder and rt.archived_at is null
      and extract(hour from now() at time zone s.time_zone) = extract(hour from coalesce(rt.at_time, time '19:00'))
      and (rt.cadence in ('daily', 'monthly') or rt.weekday is null or rt.weekday = extract(dow from now() at time zone s.time_zone))
      and (rt.cadence <> 'monthly' or extract(day from now() at time zone s.time_zone) = extract(day from rt.created_at at time zone s.time_zone))
  loop
    perform private.enqueue_notification(r.target, 'ritual', r.id, 'ritual:' || r.id || ':' || r.target || ':' || r.today);
    v_n := v_n + 1;
  end loop;
  -- one small idea at noon, and a gentle return after a quiet week (never a guilt trip, at most once a week)
  for r in
    select s.profile_id as target, (now() at time zone s.time_zone)::date as today,
           (select max(sl.created_at) from public.slips sl where sl.author_id = s.profile_id) as last_slip
    from public.profile_settings s
    where extract(hour from now() at time zone s.time_zone) = 12 and s.onboarded_at is not null
  loop
    if r.last_slip is not null and r.last_slip < now() - interval '5 days' then
      perform private.enqueue_notification(r.target, 'gentle_return', null, 'gentle_return:' || r.target || ':' || to_char(r.today, 'IYYY-IW'));
    else
      perform private.enqueue_notification(r.target, 'daily_idea', null, 'daily_idea:' || r.target || ':' || r.today);
    end if;
    v_n := v_n + 1;
  end loop;
  return v_n;
end $$;

-- The same question (or idea) for both partners on the same day: a deterministic pick from the catalog.
create function public.daily_content(kind text) returns public.content_items
language sql stable security definer set search_path = '' as $$
  with me as (
    -- UTC day, so partners in different time zones still share the same pick
    select s.locale, (now() at time zone 'UTC')::date as today,
           coalesce(private.current_couple_id(), s.profile_id) as seed
    from public.profile_settings s where s.profile_id = auth.uid()),
  pool as (
    select c.*, row_number() over (order by c.position, c.slug) - 1 as n, count(*) over () as total
    from public.content_items c, me
    where c.kind = daily_content.kind and daily_content.kind in ('question', 'daily_idea', 'mission', 'touch_card')
      and c.published and not c.plus_only and c.locale = me.locale)
  select p.id, p.kind, p.slug, p.locale, p.title, p.body, p.parent_slug, p.position, p.tags, p.month, p.day, p.country,
         p.plus_only, p.sensitive, p.published
  from pool p, me
  where p.n = (((me.today - date '2026-01-01') + abs(hashtext(me.seed::text)) % 97) % p.total);
$$;
grant execute on function public.daily_content(text) to authenticated;

-- Timeline: one list for Memórias, each row already respecting who may see it ------------------------
create view public.timeline_items with (security_invoker = true) as
  select m.id, 'memory'::text as kind, m.title, m.happened_on as day, m.author_id, m.couple_id is not null as shared, m.photo_path
  from public.memories m
  union all
  select s.id, 'slip', s.body, (s.created_at)::date, s.author_id, false, s.photo_path
  from public.slips s where s.deleted_at is null and s.archived_at is null
  union all
  select c.id, case when c.author_id = auth.uid() then 'card_sent' else 'card_received' end, c.note, (c.sent_at)::date, c.author_id, true, null
  from public.cards c where c.status = 'sent'
  union all
  select e.id, 'story', coalesce(e.title, e.kind), e.happened_on, e.author_id, e.couple_id is not null, null
  from public.story_events e
  union all
  select d.id, 'first', d.title, make_date(d.year, d.month, least(d.day, 28)), d.author_id, d.couple_id is not null, null
  from public.important_dates d where d.kind = 'first' and d.year is not null and not d.hidden;
comment on view public.timeline_items is e'@graphql({"primary_key_columns": ["id"], "totalCount": {"enabled": true}})';
grant select on public.timeline_items to authenticated;

-- "Neste dia": my memories and slips from this calendar day in earlier years.
create function public.on_this_day() returns setof public.timeline_items
language sql stable set search_path = '' as $$
  select t.* from public.timeline_items t
  where t.author_id = auth.uid() and t.kind in ('memory', 'slip', 'story', 'first')
    and to_char(t.day, 'MM-DD') = to_char(now(), 'MM-DD') and t.day < (now())::date - 300
  order by t.day desc;
$$;
grant execute on function public.on_this_day() to authenticated;

-- Hoje v2 and the widget summary -----------------------------------------------------------------------
create or replace view public.today_state with (security_invoker = true) as
  select p.id as profile_id, false as is_paired, null::text as partner_name, null::date as local_date,
         null::uuid as card_id, null::text as card_status, 0 as unopened_cards, 0 as slips_this_week,
         0 as slips_total, false as has_pending_invite, null::text as suggestion_key,
         null::date as together_since, null::uuid as pause_id, false as pause_is_mine, null::timestamptz as pause_return_at,
         null::text as pause_message, null::text as temperature, null::uuid as next_date_id, null::text as next_date_title,
         null::date as next_date_on, 0 as unseen_signals, false as has_plus, false as deletion_pending,
         null::text as relationship_status
  from public.profiles p where false;

create or replace function public.today() returns public.today_state
language plpgsql stable security definer set search_path = '' as $$
declare
  v_uid uuid := private.require_user();
  v_s public.profile_settings; v_week date; v_partner uuid; v_pause public.pauses; r public.today_state;
begin
  select * into v_s from public.profile_settings where profile_id = v_uid;
  v_s.time_zone := coalesce(v_s.time_zone, 'America/Sao_Paulo');
  v_week := date_trunc('week', now() at time zone v_s.time_zone)::date;
  v_partner := private.partner_id();
  r.profile_id := v_uid;
  r.local_date := (now() at time zone v_s.time_zone)::date;
  r.is_paired := v_partner is not null;
  r.partner_name := coalesce((select display_name from public.profiles where id = v_partner), v_s.partner_name);
  r.together_since := v_s.together_since;
  r.relationship_status := v_s.relationship_status::text;
  select c.id, c.status::text into r.card_id, r.card_status
  from public.cards c where c.author_id = v_uid and c.week_start = v_week and c.kind = 'weekly' and c.deleted_at is null;
  r.unopened_cards := (select count(*) from public.cards c
                       where c.recipient_id = v_uid and c.status = 'sent' and c.deleted_at is null
                         and not exists (select 1 from public.card_opens o where o.card_id = c.id));
  select count(*) filter (where (s.created_at at time zone v_s.time_zone)::date >= v_week), count(*)
  into r.slips_this_week, r.slips_total
  from public.slips s where s.author_id = v_uid and s.deleted_at is null;
  r.has_pending_invite := exists (select 1 from public.invites i
    where i.created_by = v_uid and i.used_at is null and i.cancelled_at is null and i.expires_at > now());
  select * into v_pause from public.active_pause();
  r.pause_id := v_pause.id; r.pause_is_mine := coalesce(v_pause.started_by = v_uid, false);
  r.pause_return_at := v_pause.return_at; r.pause_message := v_pause.message;
  r.temperature := (select level from public.current_temperature());
  select d.id, d.title, private.next_occurrence(d.month, d.day, r.local_date)
  into r.next_date_id, r.next_date_title, r.next_date_on
  from public.important_dates d
  where not d.hidden and (d.author_id = v_uid or d.couple_id = private.current_couple_id())
  order by private.next_occurrence(d.month, d.day, r.local_date) limit 1;
  r.unseen_signals := (select count(*) from public.signals g where g.recipient_id = v_uid and g.seen_at is null);
  r.has_plus := private.has_plus(v_uid);
  r.deletion_pending := exists (select 1 from public.deletion_requests where profile_id = v_uid);
  r.suggestion_key := case
    when r.pause_id is not null then 'pause'
    when r.slips_total = 0 then 'first_slip'
    when r.unopened_cards > 0 then 'open_card'
    when r.temperature = 'fight' then 'repair'
    when r.card_status = 'draft' then 'review_card'
    when not r.is_paired and not r.has_pending_invite then 'invite_partner'
    else 'write_slip' end;
  return r;
end $$;

-- Widgets: counters and dates only. In discreet mode (unless the person opted in) nothing with names or text.
create view public.widget_state with (security_invoker = true) as
  select p.id as profile_id, false as discreet, false as is_paired, null::date as together_since, null::text as partner_name,
         null::text as next_date_title, null::date as next_date_on, 0 as unopened_cards, null::timestamptz as pause_return_at,
         null::text as partner_note, null::text as partner_note_media, null::timestamptz as partner_note_at, null::text as partner_mood
  from public.profiles p where false;
comment on view public.widget_state is e'@graphql({"primary_key_columns": ["profile_id"]})';
grant select on public.widget_state to authenticated;
create function public.widget() returns public.widget_state
language plpgsql stable security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); t public.today_state := public.today(); r public.widget_state; s public.profile_settings;
begin
  select * into s from public.profile_settings where profile_id = v_uid;
  r.profile_id := v_uid;
  r.discreet := coalesce((select discreet from public.notification_settings where profile_id = v_uid), false) and not s.widget_in_discreet;
  r.is_paired := t.is_paired;
  r.together_since := t.together_since;
  r.unopened_cards := t.unopened_cards;
  r.pause_return_at := case when t.pause_is_mine then t.pause_return_at end;
  r.next_date_on := t.next_date_on;
  if not r.discreet then
    r.next_date_title := t.next_date_title;
    r.partner_name := case when s.widget_show_names then t.partner_name end;
    if s.widget_allow_partner_notes then
      select m.body, m.media_path, m.created_at into r.partner_note, r.partner_note_media, r.partner_note_at
      from public.partner_messages m where m.recipient_id = v_uid and m.for_widget order by m.created_at desc limit 1;
    end if;
    r.partner_mood := (select mood from public.partner_mood_today());
  end if;
  return r;
end $$;
grant execute on function public.widget() to authenticated;

-- Year in review: counts only, never scores or comparisons.
create view public.year_recap with (security_invoker = true) as
  select p.id as profile_id, 0 as year, 0 as slips, 0 as cards_sent, 0 as cards_received, 0 as memories, 0 as firsts, 0 as rituals_done
  from public.profiles p where false;
comment on view public.year_recap is e'@graphql({"primary_key_columns": ["profile_id"]})';
grant select on public.year_recap to authenticated;
create function public.my_year(year integer) returns public.year_recap
language sql stable security definer set search_path = '' as $$
  select auth.uid(), my_year.year,
    (select count(*)::int from public.slips where author_id = auth.uid() and deleted_at is null and extract(year from created_at) = my_year.year),
    (select count(*)::int from public.cards where author_id = auth.uid() and status = 'sent' and deleted_at is null and extract(year from sent_at) = my_year.year),
    (select count(*)::int from public.cards where recipient_id = auth.uid() and status = 'sent' and deleted_at is null and extract(year from sent_at) = my_year.year),
    (select count(*)::int from public.memories where author_id = auth.uid() and extract(year from happened_on) = my_year.year),
    (select count(*)::int from public.memories where author_id = auth.uid() and origin = 'first' and extract(year from happened_on) = my_year.year),
    (select count(*)::int from public.ritual_logs where author_id = auth.uid() and not skipped and extract(year from done_on) = my_year.year)
  where auth.uid() is not null;
$$;
grant execute on function public.my_year(integer) to authenticated;
