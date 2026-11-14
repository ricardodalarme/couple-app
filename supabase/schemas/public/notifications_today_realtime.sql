-- Declarative source of truth. Mirrors migration 20261110000500_notifications_today_realtime.sql; edit both together when Docker/pg-delta is unavailable.
-- Push plumbing and preferences (BE-013, BE-014), Hoje aggregate (BE-008), realtime signals (BE-015).

-- Devices -------------------------------------------------------------------------------------------
create table public.devices (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid not null references public.profiles (id) on delete cascade,
  token text not null unique check (char_length(token) between 10 and 4096),
  platform public.device_platform not null,
  label text check (char_length(label) <= 80),
  failure_count integer not null default 0,
  created_at timestamptz not null default now(),
  last_seen_at timestamptz not null default now()
);
create index devices_profile_id_idx on public.devices (profile_id);
alter table public.devices enable row level security;
grant select (id, profile_id, platform, label, created_at, last_seen_at) on public.devices to authenticated;
create policy devices_select_own on public.devices for select to authenticated
  using (profile_id = (select auth.uid()));

-- A token belongs to the profile that registered it; only that profile may refresh it.
create function public.register_device(token text, platform text, label text default null) returns boolean
language plpgsql security definer set search_path = '' as $$
declare
  v_uid uuid := private.require_user();
  v_device uuid;
begin
  if platform not in ('ios', 'android') then
    raise exception 'INVALID_PLATFORM' using errcode = 'P0001';
  end if;
  if not private.hit_rate_limit('register_device:' || v_uid, 20, interval '1 hour') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  insert into public.devices as d (profile_id, token, platform, label)
  values (v_uid, register_device.token, register_device.platform::public.device_platform, register_device.label)
  on conflict on constraint devices_token_key do update
    set platform = excluded.platform, label = excluded.label, failure_count = 0, last_seen_at = now()
    where d.profile_id = v_uid
  returning d.id into v_device;
  return v_device is not null;
end $$;
create function public.unregister_device(token text) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user();
begin
  delete from public.devices d where d.token = unregister_device.token and d.profile_id = v_uid;
  return found;
end $$;
create function public.revoke_device(device_id uuid) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user();
begin
  delete from public.devices d where d.id = device_id and d.profile_id = v_uid;
  return found;
end $$;
grant execute on function public.register_device(text, text, text), public.unregister_device(text), public.revoke_device(uuid) to authenticated;

-- Preferences ---------------------------------------------------------------------------------------
create table public.notification_settings (
  profile_id uuid primary key references public.profiles (id) on delete cascade,
  enabled boolean not null default true,
  discreet boolean not null default false,
  card_day smallint not null default 0 check (card_day between 0 and 6),
  card_hour smallint not null default 9 check (card_hour between 0 and 23),
  muted_types text[] not null default '{}',
  updated_at timestamptz not null default now()
);
create trigger notification_settings_set_updated_at before update on public.notification_settings
  for each row execute function private.set_updated_at();
alter table public.notification_settings enable row level security;
grant select on public.notification_settings to authenticated;
grant update (enabled, discreet, card_day, card_hour, muted_types) on public.notification_settings to authenticated;
create policy notification_settings_select_own on public.notification_settings for select to authenticated
  using (profile_id = (select auth.uid()));
create policy notification_settings_update_own on public.notification_settings for update to authenticated
  using (profile_id = (select auth.uid())) with check (profile_id = (select auth.uid()));

create function private.bootstrap_profile(p_user_id uuid, p_name text) returns void
language plpgsql security definer set search_path = '' as $$
begin
  insert into public.profiles (id, display_name)
  values (p_user_id, nullif(left(btrim(coalesce(p_name, '')), 60), ''))
  on conflict (id) do nothing;
  insert into public.profile_settings (profile_id) values (p_user_id) on conflict (profile_id) do nothing;
  insert into public.notification_settings (profile_id) values (p_user_id) on conflict (profile_id) do nothing;
end $$;

create function public.my_notification_settings() returns public.notification_settings
language sql stable set search_path = '' as $$
  select * from public.notification_settings where profile_id = auth.uid();
$$;
grant execute on function public.my_notification_settings() to authenticated;

-- Outbox --------------------------------------------------------------------------------------------
-- type keys: card_ready, card_received, card_reaction, partner_joined, daily_reminder (more per slice).
create table private.notification_outbox (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid not null references public.profiles (id) on delete cascade,
  type text not null,
  ref_id uuid,
  dedupe_key text unique,
  send_after timestamptz not null default now(),
  sent_at timestamptz,
  outcome text,
  attempts integer not null default 0,
  created_at timestamptz not null default now()
);
create index notification_outbox_due_idx on private.notification_outbox (send_after) where sent_at is null;
create index notification_outbox_profile_idx on private.notification_outbox (profile_id);
create index notification_outbox_sent_idx on private.notification_outbox (profile_id, sent_at) where outcome = 'sent';
alter table private.notification_outbox enable row level security;

create function private.enqueue_notification(p_profile_id uuid, p_type text, p_ref_id uuid default null, p_dedupe_key text default null)
returns void language sql security definer set search_path = '' as $$
  insert into private.notification_outbox (profile_id, type, ref_id, dedupe_key)
  select p_profile_id, p_type, p_ref_id, p_dedupe_key where p_profile_id is not null
  on conflict (dedupe_key) do nothing;
$$;

-- Decision for one notification at a moment: 'send' or 'drop'.
create function private.should_send(p_profile_id uuid, p_type text, p_at timestamptz) returns text
language plpgsql stable security definer set search_path = '' as $$
declare v_s public.notification_settings;
begin
  select * into v_s from public.notification_settings where profile_id = p_profile_id;
  if not found or not v_s.enabled or p_type = any (v_s.muted_types) then
    return 'drop';
  end if;
  return 'send';
end $$;

-- Shape handed to the sender. Payloads are generic: never names or content, only type and ref id.
create view private.push_job with (security_invoker = true) as
  select o.id as outbox_id, o.profile_id, o.type, o.ref_id, false as discreet, null::text[] as tokens
  from private.notification_outbox o where false;

-- Called by the push-sender Edge Function (service role). Applies preferences, returns what to send now.
create function private.claim_notifications(p_limit integer default 50) returns setof private.push_job
language plpgsql security definer set search_path = '' as $$
declare r private.notification_outbox; v_decision text; v_job private.push_job;
begin
  for r in
    select * from private.notification_outbox
    where sent_at is null and send_after <= now() and attempts < 5
    order by send_after limit p_limit for update skip locked
  loop
    v_decision := private.should_send(r.profile_id, r.type, now());
    if v_decision = 'drop' then
      update private.notification_outbox set sent_at = now(), outcome = 'dropped' where id = r.id;
    else
      update private.notification_outbox set attempts = attempts + 1, send_after = now() + interval '5 minutes' where id = r.id;
      select r.id, r.profile_id, r.type, r.ref_id, ns.discreet,
             (select array_agg(d.token) from public.devices d where d.profile_id = r.profile_id)
      into v_job from public.notification_settings ns where ns.profile_id = r.profile_id;
      if v_job.tokens is null then
        update private.notification_outbox set sent_at = now(), outcome = 'no_device' where id = r.id;
      else
        return next v_job;
      end if;
    end if;
  end loop;
end $$;

create function private.complete_notification(p_outbox_id uuid, p_failed_tokens text[] default '{}') returns void
language plpgsql security definer set search_path = '' as $$
begin
  update private.notification_outbox set sent_at = now(), outcome = 'sent' where id = p_outbox_id and sent_at is null;
  update public.devices set failure_count = failure_count + 1 where token = any (p_failed_tokens);
  delete from public.devices where failure_count >= 3;
end $$;
grant execute on function private.claim_notifications(integer), private.complete_notification(uuid, text[]) to service_role;
grant select on private.push_job to service_role;

-- Weekly card job now honours each person's chosen day and hour, and announces the draft.
create function private.generate_weekly_cards() returns integer
language plpgsql security definer set search_path = '' as $$
declare v_profile uuid; v_card uuid; v_count integer := 0;
begin
  for v_profile in
    select s.profile_id
    from public.profile_settings s join public.notification_settings n on n.profile_id = s.profile_id
    where extract(dow from now() at time zone s.time_zone) = n.card_day
      and extract(hour from now() at time zone s.time_zone) >= n.card_hour
      and not exists (select 1 from public.cards c
                      where c.author_id = s.profile_id
                        and c.week_start = date_trunc('week', now() at time zone s.time_zone)::date)
  loop
    v_card := private.build_card_draft(v_profile);
    if v_card is not null then
      v_count := v_count + 1;
      perform private.enqueue_notification(v_profile, 'card_ready', v_card, 'card_ready:' || v_card);
    end if;
  end loop;
  return v_count;
end $$;

-- Realtime ------------------------------------------------------------------------------------------
-- Private channels `couple:<couple_id>` and `user:<profile_id>` carry event names only, never content.
create policy realtime_read_own_topics on realtime.messages for select to authenticated
  using (realtime.topic() = 'user:' || (select auth.uid())::text
      or realtime.topic() = 'couple:' || (select private.current_couple_id())::text);

create function private.signal(p_topic text, p_event text) returns void
language plpgsql security definer set search_path = '' as $$
begin
  perform realtime.send('{}'::jsonb, p_event, p_topic, true);
exception when others then
  null; -- a realtime hiccup must never break the write that caused it
end $$;

create function private.on_card_sent() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if new.recipient_id is not null then
    perform private.enqueue_notification(new.recipient_id, 'card_received', new.id, 'card_received:' || new.id);
    perform private.signal('user:' || new.recipient_id, 'card_received');
  end if;
  return new;
end $$;
create trigger cards_after_sent after update of status on public.cards
  for each row when (new.status = 'sent' and old.status <> 'sent') execute function private.on_card_sent();

create function private.on_card_reaction() returns trigger
language plpgsql security definer set search_path = '' as $$
declare v_author uuid;
begin
  select author_id into v_author from public.cards where id = new.card_id;
  perform private.enqueue_notification(v_author, 'card_reaction', new.card_id, 'card_reaction:' || new.card_id);
  perform private.signal('user:' || v_author, 'card_reaction');
  return new;
end $$;
create trigger card_reactions_after_write after insert or update on public.card_reactions
  for each row execute function private.on_card_reaction();

create function private.on_membership_change() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if tg_op = 'INSERT' then
    if new.role = 'inviter' then
      perform private.enqueue_notification(new.profile_id, 'partner_joined', new.couple_id, 'partner_joined:' || new.couple_id);
    end if;
    perform private.signal('user:' || new.profile_id, 'paired');
  elsif new.left_at is not null and old.left_at is null then
    perform private.signal('user:' || new.profile_id, 'unpaired');
  end if;
  return new;
end $$;
create trigger couple_members_after_change after insert or update of left_at on public.couple_members
  for each row execute function private.on_membership_change();

-- Hoje ----------------------------------------------------------------------------------------------
create view public.today_state with (security_invoker = true) as
  select p.id as profile_id, false as is_paired, null::text as partner_name, null::date as local_date,
         null::uuid as card_id, null::text as card_status, 0 as unopened_cards, 0 as slips_this_week,
         0 as slips_total, false as has_pending_invite, null::text as suggestion_key
  from public.profiles p where false;
comment on view public.today_state is e'@graphql({"primary_key_columns": ["profile_id"], "description": "Everything Hoje needs in one call. suggestion_key: first_slip, open_card, review_card, invite_partner, write_slip."})';
grant select on public.today_state to authenticated;

create function public.today() returns public.today_state
language plpgsql stable security definer set search_path = '' as $$
declare
  v_uid uuid := private.require_user();
  v_tz text; v_week date; v_partner uuid; r public.today_state;
begin
  select time_zone into v_tz from public.profile_settings where profile_id = v_uid;
  v_tz := coalesce(v_tz, 'America/Sao_Paulo');
  v_week := date_trunc('week', now() at time zone v_tz)::date;
  v_partner := private.partner_id();
  r.profile_id := v_uid;
  r.local_date := (now() at time zone v_tz)::date;
  r.is_paired := v_partner is not null;
  r.partner_name := coalesce(
    (select display_name from public.profiles where id = v_partner),
    (select partner_name from public.profile_settings where profile_id = v_uid));
  select c.id, c.status::text into r.card_id, r.card_status
  from public.cards c where c.author_id = v_uid and c.week_start = v_week and c.deleted_at is null;
  r.unopened_cards := (select count(*) from public.cards c
                       where c.recipient_id = v_uid and c.status = 'sent' and c.deleted_at is null
                         and not exists (select 1 from public.card_opens o where o.card_id = c.id));
  select count(*) filter (where (s.created_at at time zone v_tz)::date >= v_week), count(*)
  into r.slips_this_week, r.slips_total
  from public.slips s where s.author_id = v_uid and s.deleted_at is null;
  r.has_pending_invite := exists (select 1 from public.invites i
    where i.created_by = v_uid and i.used_at is null and i.cancelled_at is null and i.expires_at > now());
  r.suggestion_key := case
    when r.slips_total = 0 then 'first_slip'
    when r.unopened_cards > 0 then 'open_card'
    when r.card_status = 'draft' then 'review_card'
    when not r.is_paired and not r.has_pending_invite then 'invite_partner'
    else 'write_slip' end;
  return r;
end $$;
grant execute on function public.today() to authenticated;
