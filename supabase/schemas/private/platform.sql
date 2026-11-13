-- Declarative source of truth. Mirrors migration 20261110000100_platform.sql; edit both together when Docker/pg-delta is unavailable.
-- Platform: extensions, schemas, default privileges, shared helpers. (BE-001, BE-003, BE-004)

-- `public` is the client API surface (GraphQL); `private` holds internals and is never exposed.
create schema if not exists private;
revoke all on schema private from public, anon;
grant usage on schema private to authenticated, service_role;


-- Default deny: nothing created in `public` is reachable until granted explicitly.
alter default privileges for role postgres in schema public revoke all on tables from anon, authenticated;
alter default privileges for role postgres in schema public revoke all on sequences from anon, authenticated;
alter default privileges for role postgres in schema public revoke all on functions from anon, authenticated;
alter default privileges for role postgres revoke execute on functions from public;
alter default privileges for role postgres in schema private revoke all on tables from anon, authenticated;
alter default privileges for role postgres in schema private revoke all on functions from anon, authenticated;

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

-- Fixed-window rate limiter. Returns true while the caller is within the limit.
create table private.rate_limits (
  key text not null,
  window_start timestamptz not null,
  hits integer not null default 1,
  primary key (key, window_start)
);
alter table private.rate_limits enable row level security;

create function private.hit_rate_limit(p_key text, p_max integer, p_window interval) returns boolean
language plpgsql set search_path = '' as $$
declare
  v_secs double precision := extract(epoch from p_window);
  v_start timestamptz := to_timestamp(floor(extract(epoch from now()) / v_secs) * v_secs);
  v_hits integer;
begin
  insert into private.rate_limits as r (key, window_start) values (p_key, v_start)
  on conflict (key, window_start) do update set hits = r.hits + 1
  returning r.hits into v_hits;
  return v_hits <= p_max;
end $$;
