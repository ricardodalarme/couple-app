begin;
set local search_path = tap, public, extensions;
select plan(5);
select tests.create_user('ana');
select tests.create_user('bruno');
select tests.create_user('carla');
select tests.pair('ana', 'bruno');

select tests.as('ana');
insert into public.lists (id, title, couple_id)
  values ('00000000-0000-4000-8000-000000000001', 'Juntos', (select id from public.my_couple()));
insert into public.list_items (id, list_id, title, position) values
  ('00000000-0000-4000-8000-0000000000a1', '00000000-0000-4000-8000-000000000001', 'a', 0),
  ('00000000-0000-4000-8000-0000000000b2', '00000000-0000-4000-8000-000000000001', 'b', 1),
  ('00000000-0000-4000-8000-0000000000c3', '00000000-0000-4000-8000-000000000001', 'c', 2);

select is(
  (select array_agg(title order by position) from public.reorder_list_items(
    '00000000-0000-4000-8000-000000000001',
    array['00000000-0000-4000-8000-0000000000c3', '00000000-0000-4000-8000-0000000000a1', '00000000-0000-4000-8000-0000000000b2']::uuid[])),
  array['c', 'a', 'b'],
  'the author reorders a list and gets it back in the new order'
);
select is(
  (select array_agg(position order by position) from public.list_items),
  array[0, 1, 2],
  'positions are renumbered from zero'
);
select is(
  jsonb_array_length(graphql.resolve('mutation { reorderListItems(listId: "00000000-0000-4000-8000-000000000001", itemIds: ["00000000-0000-4000-8000-0000000000b2", "00000000-0000-4000-8000-0000000000a1", "00000000-0000-4000-8000-0000000000c3"]) { edges { node { id } } } }') #> '{data,reorderListItems,edges}'),
  3,
  'the function is exposed as a GraphQL mutation'
);

select tests.as('bruno');
select is(
  (select title from public.reorder_list_items('00000000-0000-4000-8000-000000000001', array['00000000-0000-4000-8000-0000000000a1']::uuid[]) order by position limit 1),
  'a',
  'the partner can reorder a shared list'
);

select tests.as('carla');
select is(
  (select count(*) from public.reorder_list_items('00000000-0000-4000-8000-000000000001', array['00000000-0000-4000-8000-0000000000a1']::uuid[])),
  0::bigint,
  'someone outside the couple sees and changes nothing'
);

select * from finish();
rollback;
