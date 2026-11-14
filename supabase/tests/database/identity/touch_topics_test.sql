begin;
set local search_path = tap, public, extensions;
select plan(5);
select tests.create_user('ana', 'Ana'); select tests.create_user('bia', 'Bia'); select tests.create_user('caio');

select tests.pair('ana', 'bia');

select tests.as('ana');
select is((select touch_topics_enabled from public.couples limit 1), true, 'touch topics start on');
select is(public.set_touch_topics(false), false, 'one person turns them off');

select tests.as('bia');
select is((select touch_topics_enabled from public.couples limit 1), false, 'the partner sees them off too');
select is(public.set_touch_topics(true), true, 'the partner can turn them back on');

select tests.as('caio');
select throws_ok($$select public.set_touch_topics(false)$$, 'NOT_PAIRED', 'someone on their own cannot change it');

select * from finish();
rollback;
