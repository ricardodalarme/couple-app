begin;
set local search_path = tap, public, extensions;
select plan(2);
select tests.create_user('ana');

select tests.as('ana');
insert into public.lists (title) values ('Viagens');
insert into public.list_items (list_id, title)
  select id, 'Passagens' from public.lists limit 1;

select isnt(
  (select updated_at from public.list_items limit 1),
  null,
  'a new item has an updated_at'
);

update public.list_items set updated_at = now() - interval '1 day';
update public.list_items set title = 'Passagens aéreas';

select is(
  (select updated_at > now() - interval '1 minute' from public.list_items limit 1),
  true,
  'editing an item refreshes updated_at'
);

select * from finish();
rollback;
