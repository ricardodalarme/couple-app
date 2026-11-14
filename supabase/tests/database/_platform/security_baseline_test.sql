begin;
set local search_path = tap, public, extensions;
select plan(9);

select is_empty($$
  select c.relname from pg_class c join pg_namespace n on n.oid = c.relnamespace
  where n.nspname in ('public', 'private') and c.relkind = 'r' and not c.relrowsecurity
$$, 'every table in public and private has RLS enabled');

select is_empty($$
  select table_name || ':' || privilege_type from information_schema.role_table_grants
  where table_schema in ('public', 'private') and grantee = 'anon'
    and not (privilege_type = 'SELECT' and table_name = 'app_config')
$$, 'anon can only read app_config');

select is_empty($$
  select p.proname from pg_proc p join pg_namespace n on n.oid = p.pronamespace
  where n.nspname in ('public', 'private')
    and (has_function_privilege('anon', p.oid, 'execute') or has_function_privilege('public', p.oid, 'execute'))
$$, 'no function is executable by anon or PUBLIC');

select is_empty($$
  select p.proname from pg_proc p join pg_namespace n on n.oid = p.pronamespace
  where n.nspname in ('public', 'private') and p.prokind = 'f'
    and not exists (select 1 from unnest(coalesce(p.proconfig, '{}')) cfg where cfg like 'search_path=%')
$$, 'every function pins search_path');

select is_empty($$
  select c.relname from pg_class c join pg_namespace n on n.oid = c.relnamespace
  where n.nspname = 'public' and c.relkind = 'v'
    and not coalesce((select option_value = 'true' from pg_options_to_table(c.reloptions) where option_name = 'security_invoker'), false)
$$, 'every view in public is security_invoker');

select is_empty($$
  select table_name || '.' || column_name from information_schema.columns
  where table_schema in ('public', 'private') and column_name ~* 'safe_?mode'
$$, 'safe mode is never stored anywhere (device-only by design)');

select is_empty($$
  select c.conrelid::regclass || '.' || c.conname from pg_constraint c
  join pg_namespace n on n.oid = c.connamespace
  where c.contype = 'f' and n.nspname in ('public', 'private')
    and not exists (select 1 from pg_index i where i.indrelid = c.conrelid and (i.indkey::smallint[])[0] = c.conkey[1])
$$, 'every foreign key has an index starting with its column');

select is_empty($$
  select c.conrelid::regclass || '.' || c.conname from pg_constraint c
  where c.contype = 'f' and c.confrelid in ('public.profiles'::regclass, 'auth.users'::regclass)
    and c.connamespace in ('public'::regnamespace, 'private'::regnamespace) and c.confdeltype not in ('c', 'n')
$$, 'every reference to a person cascades or nulls on deletion (account erasure is exhaustive)');

select is_empty($$
  select c.relname from pg_class c join pg_namespace n on n.oid = c.relnamespace
  where n.nspname = 'public' and c.relkind = 'r' and not exists (select 1 from pg_policies p where p.schemaname = 'public' and p.tablename = c.relname)
$$, 'every public table has at least one policy');

select * from finish();
rollback;
