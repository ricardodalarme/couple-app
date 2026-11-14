-- Notifications: daily reminder job.

-- Daily job: date reminders (N days before), ritual reminders, and one gentle idea for people who want it.
create function private.next_occurrence(p_month smallint, p_day smallint, p_from date) returns date
language sql immutable set search_path = '' as $$
  select min(d) from (
    select (make_date(y, p_month, 1) + (least(p_day, extract(day from (make_date(y, p_month, 1) + interval '1 month - 1 day'))::int) - 1))::date as d
    from generate_series(extract(year from p_from)::int, extract(year from p_from)::int + 1) y) c
  where d >= p_from;
$$;
-- Hourly job, everything evaluated in each person's local time. Caps are applied at send time.
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
