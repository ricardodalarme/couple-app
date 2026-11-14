begin;
set local search_path = tap, public, extensions;
select plan(6);
select tests.create_user('ana');
select tests.as_admin();
select private.apply_purchase_event('evt-chat-quota', tests.uid('ana'), 'INITIAL_PURCHASE', now(), 'plus_annual', 'active', now() + interval '30 days', true, 'app_store');

select tests.as('ana');
select is(public.chat_messages_left(), 20, 'Plus starts with the daily allowance');

select tests.as_admin();
select isnt(private.take_chat_message(tests.uid('ana')), null, 'taking a message reserves one row');

select tests.as('ana');
select is(public.chat_messages_left(), 19, 'the app sees the same remaining count');
select throws_ok('delete from public.chat_messages', '42501', null, 'the app cannot delete a message to reset the limit');
select is(public.chat_messages_left(), 19, 'deleting today''s rows cannot increase the limit');

select tests.as_admin();
delete from public.app_config where key = 'chat_messages_per_day_plus';
select is(private.take_chat_message(tests.uid('ana')), null, 'a missing config row does not bypass the limit');

select * from finish();
rollback;
