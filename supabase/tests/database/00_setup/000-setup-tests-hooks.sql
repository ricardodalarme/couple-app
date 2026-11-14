-- Runs once before the suite (not rolled back). Installs pgTAP in its own schema and the test helpers.
create schema if not exists tap;
do $$ begin
  if exists (select 1 from pg_available_extensions where name = 'pgtap') then
    create extension if not exists pgtap with schema tap;
  end if;
end $$;
grant usage on schema tap to anon, authenticated, service_role;
grant execute on all functions in schema tap to anon, authenticated, service_role;
-- pgTAP ships two helper views; keep them out of the GraphQL schema.
revoke all on all tables in schema tap from public, anon, authenticated;

create schema if not exists tests;
grant usage on schema tests to anon, authenticated, service_role;

create or replace function tests.uid(alias text) returns uuid language sql immutable set search_path = '' as $$
  select md5('repara-test:' || alias)::uuid;
$$;
-- Creates an auth user (which fires the profile bootstrap trigger) and returns its id.
create or replace function tests.create_user(alias text, full_name text default null) returns uuid
language plpgsql security definer set search_path = '' as $$
begin
  insert into auth.users (id, email, raw_user_meta_data)
  values (tests.uid(alias), alias || '@test.repara.invalid',
          case when full_name is null then '{}'::jsonb else jsonb_build_object('full_name', full_name) end);
  return tests.uid(alias);
end $$;
-- Act as a signed-in user for the rest of the transaction.
create or replace function tests.as(alias text) returns void language plpgsql set search_path = '' as $$
begin
  perform set_config('role', 'authenticated', true);
  perform set_config('request.jwt.claims', json_build_object('sub', tests.uid(alias), 'role', 'authenticated')::text, true);
end $$;
create or replace function tests.as_anon() returns void language plpgsql set search_path = '' as $$
begin
  perform set_config('role', 'anon', true);
  perform set_config('request.jwt.claims', '{"role":"anon"}', true);
end $$;
-- Back to the privileged test runner.
create or replace function tests.as_admin() returns void language plpgsql set search_path = '' as $$
begin
  perform set_config('role', 'none', true);
  perform set_config('request.jwt.claims', '', true);
end $$;
-- Pairs two existing users through the real invite flow and returns the couple id.
create or replace function tests.pair(inviter text, invitee text) returns uuid language plpgsql set search_path = '' as $$
declare v_code text; v_couple uuid;
begin
  perform tests.as(inviter);
  select code into v_code from public.create_invite();
  perform tests.as(invitee);
  select id into v_couple from public.accept_invite(v_code);
  perform tests.as_admin();
  return v_couple;
end $$;
grant execute on all functions in schema tests to anon, authenticated, service_role;

-- The runner expects every file to report a TAP plan; this one just proves the helpers are installed.
set search_path = tap, public, extensions;
select plan(1);
select has_function('tests', 'create_user', array['text', 'text'], 'test helpers are installed');
select * from finish();
