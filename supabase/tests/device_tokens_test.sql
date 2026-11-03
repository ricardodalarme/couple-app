begin;

create extension if not exists pgtap with schema extensions;

select plan(4);

select has_table('public', 'device_tokens', 'device_tokens table exists');
select is(
  (
    select count(*)::int
    from pg_indexes
    where schemaname = 'public'
      and tablename = 'device_tokens'
      and indexname in ('device_tokens_user_idx', 'device_tokens_seen_idx')
  ),
  2,
  'device_tokens has both indexes'
);
select has_function('public', 'register_device_token', array['text', 'text', 'text']);
select has_function('public', 'unregister_device_token', array['text']);

select * from finish();

rollback;
