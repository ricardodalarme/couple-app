-- Platform: shared trigger and guard helpers.

create function private.set_updated_at() returns trigger
language plpgsql set search_path = '' as $$
begin
  new.updated_at := now();
  return new;
end $$;

create function private.is_valid_time_zone(tz text) returns boolean
language sql stable set search_path = '' as $$
  select exists (select 1 from pg_catalog.pg_timezone_names where name = tz);
$$;

-- Raises the stable error code UNAUTHENTICATED when there is no signed-in user.
create function private.require_user() returns uuid
language plpgsql stable set search_path = '' as $$
declare v_uid uuid := auth.uid();
begin
  if v_uid is null then
    raise exception 'UNAUTHENTICATED' using errcode = '28000';
  end if;
  return v_uid;
end $$;
grant execute on function private.require_user(), private.is_valid_time_zone(text) to authenticated;

-- "Today" for daily rows is the author's local date, not the database's UTC date: a mood saved at 23:00 in Sao Paulo
-- must not land on tomorrow. The column has no default; this trigger fills it from the author's time zone when the client sends none.
create function private.set_local_date() returns trigger
language plpgsql security definer set search_path = '' as $$
declare v_tz text; v_day date;
begin
  if to_jsonb(new) ->> tg_argv[0] is null then
    select s.time_zone into v_tz from public.profile_settings s where s.profile_id = new.author_id;
    v_day := (now() at time zone coalesce(v_tz, 'America/Sao_Paulo'))::date;
    new := jsonb_populate_record(new, jsonb_build_object(tg_argv[0], v_day));
  end if;
  return new;
end $$;
