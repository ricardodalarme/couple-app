begin;

create extension if not exists pgtap with schema extensions;

select plan(3);

select has_table('public', 'notifications', 'notifications table exists');
select policies_are(
  'public',
  'notifications',
  array['notifications_select_own', 'notifications_update_own'],
  'notifications has the expected policies'
);
select is(
  (
    select count(*)::int
    from pg_indexes
    where schemaname = 'public'
      and tablename = 'notifications'
      and indexname in ('notifications_recipient_created_idx', 'notifications_unread_idx')
  ),
  2,
  'notifications has both inbox indexes'
);

select * from finish();

rollback;
