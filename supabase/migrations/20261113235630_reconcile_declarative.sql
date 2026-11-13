SET local check_function_bodies = off;

CREATE OR REPLACE FUNCTION private.enforce_free_slip_limit()
  RETURNS TRIGGER
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
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
end $function$;

CREATE OR REPLACE FUNCTION private.enqueue_daily_reminders()
  RETURNS integer
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
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
end $function$;

CREATE OR REPLACE FUNCTION public.accept_invite (
  code text
)
  RETURNS public.couples
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
declare
  v_uid uuid := private.require_user();
  v_invite public.invites;
  v_couple public.couples;
begin
  if not private.hit_rate_limit('accept_invite:' || v_uid, 10, interval '1 hour') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  select * into v_invite from public.invites where code_hash = private.hash_invite_code(code) for update;
  if not found or v_invite.cancelled_at is not null or v_invite.created_by = v_uid then
    return null;
  end if;
  if v_invite.used_at is not null then
    -- Retry after a dropped response: same person, still paired with the inviter.
    if v_invite.used_by = v_uid then
      select c.* into v_couple from public.couples c
      where c.id = private.current_couple_id()
        and exists (select 1 from public.couple_members m
                    where m.couple_id = c.id and m.profile_id = v_invite.created_by and m.left_at is null);
      return v_couple;
    end if;
    return null;
  end if;
  if v_invite.expires_at <= now()
     or private.current_couple_id() is not null
     or exists (select 1 from public.couple_members where profile_id = v_invite.created_by and left_at is null) then
    return null;
  end if;
  insert into public.couples default values returning * into v_couple;
  insert into public.couple_members (couple_id, profile_id, role)
  values (v_couple.id, v_invite.created_by, 'inviter'), (v_couple.id, v_uid, 'invitee');
  update public.question_answers set couple_id = v_couple.id
  where author_id in (v_invite.created_by, v_uid) and couple_id is null;
  update public.invites set used_at = now(), used_by = v_uid where id = v_invite.id;
  return v_couple;
end $function$;

CREATE OR REPLACE FUNCTION public.daily_content (
  kind text
)
  RETURNS public.content_items
  LANGUAGE sql
  STABLE
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
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
$function$;

CREATE OR REPLACE FUNCTION public.request_account_deletion()
  RETURNS public.deletion_requests
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
declare v_uid uuid := private.require_user(); v_row public.deletion_requests;
begin
  insert into public.deletion_requests as d (profile_id, purge_after) values (v_uid, now() + interval '14 days')
  on conflict (profile_id) do update set profile_id = excluded.profile_id returning d.* into v_row;
  -- Deleting the account also ends the pairing right away; the partner sees a neutral "unpaired" state.
  perform public.unpair();
  return v_row;
end $function$;

CREATE OR REPLACE FUNCTION public.resolve_shared_items (
  keep boolean
)
  RETURNS boolean
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
declare v_uid uuid := private.require_user(); t text;
begin
  if private.current_couple_id() is not null then raise exception 'STILL_PAIRED' using errcode = 'P0001'; end if;
  foreach t in array array['rituals', 'logistic_items', 'logistics_meetings', 'planning_areas', 'saved_date_ideas', 'important_dates',
    'memories', 'story_events', 'lists', 'agreements', 'capsules', 'decisions', 'gift_ideas'] loop
    if keep then
      execute format('update public.%I set couple_id = null where author_id = $1 and couple_id is not null', t) using v_uid;
    else
      execute format('delete from public.%I where author_id = $1 and couple_id is not null', t) using v_uid;
    end if;
  end loop;
  return true;
end $function$;

CREATE OR REPLACE FUNCTION public.send_partner_message (
  kind       text,
  body       text    DEFAULT NULL::text,
  media_path text    DEFAULT NULL::text,
  for_widget boolean DEFAULT false
)
  RETURNS public.partner_messages
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
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
end $function$;
