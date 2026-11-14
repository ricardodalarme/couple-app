begin;
set local search_path = tap, public, extensions;
select plan(7);
select tests.create_user('ana', 'Ana');

select is(
  private.apply_purchase_event('evt-1', tests.uid('ana'), 'INITIAL_PURCHASE', now(), 'plus_monthly', 'active', now() + interval '30 days', true, 'play_store'),
  true, 'the webhook casts plan, status and store');
select throws_ok(
  $$ select private.apply_purchase_event('evt-2', tests.uid('ana'), 'X', now() + interval '1 day', 'plus_weekly', 'active', null, true, 'app_store') $$,
  '22P02', null, 'an unknown plan is rejected');
select throws_ok(
  $$ select private.apply_purchase_event('evt-3', tests.uid('ana'), 'X', now() + interval '1 day', 'plus_annual', 'paused', null, true, 'app_store') $$,
  '22P02', null, 'an unknown status is rejected');

select tests.as('ana');
select is(
  (select plan::text from public.my_plus()), 'plus_monthly', 'my_plus returns the plan as an enum');
select is(
  graphql.resolve('{ myPlus { plan status } }') #>> '{data,myPlus,status}',
  'active', 'GraphQL exposes the status as an enum value');

select ok(
  coalesce(jsonb_array_length(graphql.resolve('{ contentItemsCollection(filter: {kind: {eq: program}}) { edges { node { kind } } } }') -> 'errors'), 0) = 0,
  'content kind is filterable as an enum literal');
select is(
  graphql.resolve('{ dailyContent(kind: "not_a_kind") { slug } }') #> '{data,dailyContent}',
  'null'::jsonb, 'daily_content for an unsupported kind returns nothing instead of failing');

select * from finish();
rollback;
