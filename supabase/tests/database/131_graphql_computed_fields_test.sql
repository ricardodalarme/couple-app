begin;
set local search_path = tap, public, extensions;
select plan(7);
select tests.create_user('ana');
select tests.create_user('bruno');
select tests.pair('ana', 'bruno');

select tests.as('ana');
insert into public.lists (id, title, couple_id)
  values ('00000000-0000-4000-8000-000000000001', 'Juntos', (select id from public.my_couple()));
insert into public.lists (id, title)
  values ('00000000-0000-4000-8000-000000000002', 'So meu');
insert into public.list_items (list_id, title) values ('00000000-0000-4000-8000-000000000001', 'Praia');

select is(
  graphql.resolve('{ listsByPk(id: "00000000-0000-4000-8000-000000000001") { isMine isShared } }') #>> '{data,listsByPk,isMine}',
  'true', 'the author is mine');
select is(
  graphql.resolve('{ listsByPk(id: "00000000-0000-4000-8000-000000000001") { isMine isShared } }') #>> '{data,listsByPk,isShared}',
  'true', 'a list with the current couple is shared');
select is(
  graphql.resolve('{ listsByPk(id: "00000000-0000-4000-8000-000000000002") { isMine isShared } }') #>> '{data,listsByPk,isShared}',
  'false', 'a private list is not shared');
select is(
  graphql.resolve('{ listItemsCollection { edges { node { isMine } } } }') #>> '{data,listItemsCollection,edges,0,node,isMine}',
  'true', 'children expose isMine');

select tests.as('bruno');
select is(
  graphql.resolve('{ listsByPk(id: "00000000-0000-4000-8000-000000000001") { isMine isShared } }') #>> '{data,listsByPk,isMine}',
  'false', 'the partner is not the author');
select is(
  graphql.resolve('{ listsByPk(id: "00000000-0000-4000-8000-000000000001") { isMine isShared } }') #>> '{data,listsByPk,isShared}',
  'true', 'the partner sees it as shared');

select tests.as('ana');
select public.unpair();
select is(
  graphql.resolve('{ listsByPk(id: "00000000-0000-4000-8000-000000000001") { isShared } }') #>> '{data,listsByPk,isShared}',
  'false', 'after unpairing a row from the past couple is not shared');

select * from finish();
rollback;
