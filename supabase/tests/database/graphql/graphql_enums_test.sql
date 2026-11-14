begin;
set local search_path = tap, public, extensions;
select plan(12);
select tests.create_user('ana');
select tests.create_user('bruno');
select tests.pair('ana', 'bruno');

select tests.as('ana');

-- Functions take text and cast inside.
select public.save_slip(id => '00000000-0000-4000-8000-0000000000a1', body => 'cuidou de mim');
select is(
  (select category::text from public.set_slip_details('00000000-0000-4000-8000-0000000000a1', 'said', 'kitchen')),
  'said', 'set_slip_details casts the category');
select is(
  (select work_area::text from public.slips where id = '00000000-0000-4000-8000-0000000000a1'),
  'kitchen', 'set_slip_details casts the work area');
select throws_ok(
  $$ select public.set_slip_details('00000000-0000-4000-8000-0000000000a1', 'nope') $$,
  '22P02', null, 'an unknown category is rejected');

select is(public.register_device(repeat('a', 64), 'ios'), true, 'register_device casts the platform');
select throws_ok($$ select public.register_device(repeat('b', 64), 'windows') $$, null, null, 'an unknown platform is rejected');

select is((select kind::text from public.send_signal('hug')), 'hug', 'send_signal casts the kind');
select throws_ok($$ select public.send_signal('shout') $$, '22P02', null, 'an unknown signal kind is rejected');
select is((select kind::text from public.send_partner_message('note', 'oi')), 'note', 'send_partner_message casts the kind');
select is((select game::text from public.invite_to_game('me_or_you')), 'me_or_you', 'invite_to_game casts the game');

select tests.as('bruno');
select is(
  (select response::text from public.respond_to_signal((select id from public.signals limit 1), 'heart')),
  'heart', 'respond_to_signal casts the response');

-- GraphQL sees real enums.
select tests.as('ana');
select is(
  jsonb_array_length(graphql.resolve('{ __type(name: "ListKind") { enumValues { name } } }') #> '{data,__type,enumValues}'),
  4, 'a closed value set is a GraphQL enum');
select is(
  graphql.resolve('mutation { insertIntoListsCollection(objects: [{title: "Viagens", kind: travel}]) { records { kind } } }') #>> '{data,insertIntoListsCollection,records,0,kind}',
  'travel', 'mutations take enum literals');

select * from finish();
rollback;
