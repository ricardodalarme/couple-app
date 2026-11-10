-- Declarative mirror of migration 20261110000650_review_adjustments_core.sql (DDL only; seed rows and cron jobs live in the migration).
-- NOTE: this file alters or redefines objects first declared in earlier files; when running pg-delta, fold each object into one definition.
-- Review pass over the core objects (decisions D-023..D-027): slip length, card hour, single-slip cards,
-- unpair notice, partner city and clock, invite preview and guest self-service for the web pages.

-- Slips: the UI allows 140 characters; the database keeps headroom at 280.
alter table public.slips drop constraint slips_body_check;
alter table public.slips add constraint slips_body_check check (char_length(btrim(body)) between 1 and 280);

-- The designs show the weekly card leaving on Sunday at 18:00.
alter table public.notification_settings alter column card_hour set default 18;

-- "Enviar agora" (X-62): a single slip can be sent on its own, without touching the weekly card.
alter table public.cards add column kind text not null default 'weekly' check (kind in ('weekly', 'single'));
alter table public.cards drop constraint cards_one_per_week;
create unique index cards_one_weekly_per_week on public.cards (author_id, week_start) where kind = 'weekly';

create or replace function private.build_card_draft(p_profile_id uuid) returns uuid
language plpgsql security definer set search_path = '' as $$
declare
  v_week date := private.local_week_start(p_profile_id);
  v_tz text;
  v_card uuid;
begin
  select id into v_card from public.cards where author_id = p_profile_id and week_start = v_week and kind = 'weekly';
  if v_card is not null then
    return v_card;
  end if;
  select time_zone into v_tz from public.profile_settings where profile_id = p_profile_id;
  if not exists (
    select 1 from public.slips s
    where s.author_id = p_profile_id and s.for_card and s.kind <> 'invisible'
      and s.deleted_at is null and s.archived_at is null
      and (s.created_at at time zone v_tz)::date >= v_week) then
    return null;
  end if;
  insert into public.cards (author_id, week_start) values (p_profile_id, v_week)
  on conflict (author_id, week_start) where kind = 'weekly' do nothing returning id into v_card;
  if v_card is null then
    select id into v_card from public.cards where author_id = p_profile_id and week_start = v_week and kind = 'weekly';
    return v_card;
  end if;
  insert into public.card_items (card_id, slip_id, body, feeling, position)
  select v_card, s.id, s.body, s.feeling, row_number() over (order by s.created_at)
  from public.slips s
  where s.author_id = p_profile_id and s.for_card and s.kind <> 'invisible'
    and s.deleted_at is null and s.archived_at is null
    and (s.created_at at time zone v_tz)::date >= v_week;
  return v_card;
end $$;

create or replace function public.sunday_card() returns public.cards
language sql stable set search_path = '' as $$
  select c.* from public.cards c
  where c.author_id = auth.uid() and c.week_start = private.local_week_start(auth.uid())
    and c.kind = 'weekly' and c.deleted_at is null;
$$;

create or replace function private.generate_weekly_cards() returns integer
language plpgsql security definer set search_path = '' as $$
declare v_profile uuid; v_card uuid; v_count integer := 0;
begin
  for v_profile in
    select s.profile_id
    from public.profile_settings s join public.notification_settings n on n.profile_id = s.profile_id
    where extract(dow from now() at time zone s.time_zone) = n.card_day
      and extract(hour from now() at time zone s.time_zone) >= n.card_hour
      and not exists (select 1 from public.cards c
                      where c.author_id = s.profile_id and c.kind = 'weekly'
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

create function public.send_slip_now(slip_id uuid, note text default null) returns public.cards
language plpgsql security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); v_slip public.slips; v_card public.cards;
begin
  select * into v_slip from public.slips s
  where s.id = slip_id and s.author_id = v_uid and s.deleted_at is null and s.kind <> 'invisible';
  if not found then raise exception 'SLIP_NOT_ELIGIBLE' using errcode = 'P0001'; end if;
  insert into public.cards (author_id, week_start, kind, note)
  values (v_uid, private.local_week_start(v_uid), 'single', nullif(btrim(send_slip_now.note), '')) returning * into v_card;
  insert into public.card_items (card_id, slip_id, body, feeling, position) values (v_card.id, v_slip.id, v_slip.body, v_slip.feeling, 1);
  return public.send_card(v_card.id);
end $$;
grant execute on function public.send_slip_now(uuid, text) to authenticated;

-- The person who was unpaired gets a neutral notice (X-164), not only a realtime signal.
create or replace function private.on_membership_change() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
  if tg_op = 'INSERT' then
    if new.role = 'inviter' then
      perform private.enqueue_notification(new.profile_id, 'partner_joined', new.couple_id, 'partner_joined:' || new.couple_id);
    end if;
    perform private.signal('user:' || new.profile_id, 'paired');
  elsif new.left_at is not null and old.left_at is null then
    if new.profile_id is distinct from auth.uid() then
      perform private.enqueue_notification(new.profile_id, 'unpaired', new.couple_id, 'unpaired:' || new.couple_id || ':' || new.profile_id);
    end if;
    perform private.signal('user:' || new.profile_id, 'unpaired');
  end if;
  return new;
end $$;

-- Long distance (X-87): an optional city, and the partner's time zone for the two clocks. No location, ever.
alter table public.profiles add column city text check (char_length(city) <= 80);
grant update (city) on public.profiles to authenticated;
create function public.partner_time_zone() returns text
language sql stable security definer set search_path = '' as $$
  select s.time_zone from public.profile_settings s where s.profile_id = private.partner_id();
$$;
grant execute on function public.partner_time_zone() to authenticated;

-- Invite landing page (X-104): shows who invited, only for a code that is still valid.
create function private.invite_preview(p_code text) returns jsonb
language sql stable security definer set search_path = '' as $$
  select jsonb_build_object('inviterName', p.display_name, 'expiresAt', i.expires_at)
  from public.invites i join public.profiles p on p.id = i.created_by
  where i.code_hash = private.hash_invite_code(p_code) and i.used_at is null and i.cancelled_at is null and i.expires_at > now();
$$;

-- Guest page self-service (X-73): undo "stop receiving", and "delete my data".
create function private.guest_resume(p_token text) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_sender uuid;
begin
  select c.author_id into v_sender from public.guest_links l join public.cards c on c.id = l.card_id
  where l.token_hash = private.hash_token(p_token);
  if v_sender is null then return false; end if;
  delete from private.guest_stops where sender_id = v_sender;
  update public.guest_links l set revoked_at = null
  where l.token_hash = private.hash_token(p_token) and l.expires_at > now();
  return true;
end $$;
create function private.guest_forget(p_token text) returns boolean
language plpgsql security definer set search_path = '' as $$
declare v_sender uuid;
begin
  select c.author_id into v_sender from public.guest_links l join public.cards c on c.id = l.card_id
  where l.token_hash = private.hash_token(p_token);
  if v_sender is null then return false; end if;
  delete from public.card_reactions r using public.cards c where c.id = r.card_id and c.author_id = v_sender and r.from_guest;
  delete from public.card_opens o using public.cards c, public.guest_links l
    where c.id = o.card_id and l.card_id = c.id and c.author_id = v_sender and c.recipient_id is null;
  update public.guest_links l set opened_at = null from public.cards c where c.id = l.card_id and c.author_id = v_sender;
  return true;
end $$;
grant execute on function private.invite_preview(text), private.guest_resume(text), private.guest_forget(text) to service_role;
