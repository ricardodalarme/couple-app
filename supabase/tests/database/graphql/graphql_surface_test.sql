begin;
set local search_path = tap, public, extensions;
select plan(6);
select tests.create_user('ana');

select tests.as('ana');
insert into public.lists (id, title) values ('00000000-0000-4000-8000-000000000001', 'Viagens');
insert into public.list_items (list_id, title, position)
  select '00000000-0000-4000-8000-000000000001', 'Item ' || g, g from generate_series(1, 120) g;
insert into public.gift_ideas (title) select 'Ideia ' || g from generate_series(1, 120) g;

select is(
  jsonb_array_length(graphql.resolve('{ listItemsCollection(first: 500) { edges { node { id } } } }') #> '{data,listItemsCollection,edges}'),
  120,
  'list items are not capped at the schema page size'
);
select is(
  jsonb_array_length(graphql.resolve('{ giftIdeasCollection(first: 200) { edges { node { id } } } }') #> '{data,giftIdeasCollection,edges}'),
  120,
  'a table limit above the schema default is honoured'
);
select is(
  jsonb_array_length(graphql.resolve('{ giftIdeasCollection(first: 500) { edges { node { id } } } }') #> '{data,giftIdeasCollection,edges}'),
  120,
  'first above the table limit does not fail'
);
select ok(
  coalesce(jsonb_array_length(graphql.resolve('{ listItemsCollection { aggregate { count } } }') -> 'errors'), 0) > 0,
  'aggregates are not exposed until a screen needs one'
);
select ok(
  coalesce(jsonb_array_length(graphql.resolve('{ listItemsCollection(first: 1) { totalCount } }') -> 'errors'), 0) > 0,
  'totalCount is not exposed until a screen needs one'
);
select is(
  jsonb_array_length(graphql.resolve('{ listsCollection { edges { node { id } } } }') #> '{data,listsCollection,edges}'),
  1,
  'a collection read without first uses the schema page size'
);

select * from finish();
rollback;
