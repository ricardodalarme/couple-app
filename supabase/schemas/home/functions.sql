-- Home: functions.

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
  r.slip_days := (select array_agg(distinct (s.created_at at time zone v_s.time_zone)::date)
                  from public.slips s
                  where s.author_id = v_uid and s.deleted_at is null
                    and (s.created_at at time zone v_s.time_zone)::date >= v_week);
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
      from public.partner_messages m
      where m.recipient_id = v_uid and m.for_widget and m.kind = 'note'
      order by m.created_at desc limit 1;
    end if;
    r.partner_mood := (select mood from public.partner_mood_today());
  end if;
  return r;
end $$;
grant execute on function public.widget() to authenticated;

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

-- "Neste dia": my memories and slips from this calendar day in earlier years.
create function public.on_this_day() returns setof public.timeline_items
language sql stable set search_path = '' as $$
  select t.* from public.timeline_items t
  where t.author_id = auth.uid() and t.kind in ('memory', 'slip', 'story', 'first')
    and to_char(t.day, 'MM-DD') = to_char(now(), 'MM-DD') and t.day < (now())::date - 300
  order by t.day desc;
$$;
grant execute on function public.on_this_day() to authenticated;
