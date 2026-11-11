begin;
set local search_path = tap, public, extensions;
select plan(13);
select tests.create_user('ana', 'Ana'); select tests.create_user('bia', 'Bia'); select tests.create_user('caio');
select tests.pair('ana', 'bia');

select tests.as('ana');
insert into public.gift_ideas (title) values ('Private wish');
insert into public.gift_ideas (title, couple_id, kind) values ('Shared wish', private.current_couple_id(), 'wish');
select is((select count(*)::int from public.gift_ideas), 2, 'the author sees private and shared wishes');
select is((select kind from public.gift_ideas where title = 'Private wish'), 'idea', 'a gift idea defaults to the dates kind');
select throws_ok($$insert into public.gift_ideas (title, couple_id) values ('Foreign wish', gen_random_uuid())$$,
  '42501', null, 'cannot attach a wish to a couple I am not in');
select throws_ok($$update public.gift_ideas set couple_id = gen_random_uuid() where title = 'Private wish'$$,
  '42501', null, 'cannot move a wish to a couple I am not in');

select tests.as('bia');
select is((select count(*)::int from public.gift_ideas), 1, 'the partner sees only the shared wish');
select is((select title from public.gift_ideas), 'Shared wish', 'the partner sees the shared title');
update public.gift_ideas set title = 'Changed' where title = 'Shared wish';
select is((select title from public.gift_ideas), 'Shared wish', 'the partner cannot edit a shared wish');
delete from public.gift_ideas where title = 'Shared wish';
select is((select count(*)::int from public.gift_ideas), 1, 'the partner cannot delete a shared wish');

select tests.as('caio');
select is((select count(*)::int from public.gift_ideas), 0, 'a stranger sees no wishes');

select tests.as('ana');
select public.unpair();
select tests.as('bia');
select is((select count(*)::int from public.gift_ideas), 0, 'after unpair the partner loses shared wishes');
select tests.as('ana');
select is((select count(*)::int from public.gift_ideas), 2, 'the author keeps both wishes');
select is(public.resolve_shared_items(true), true, 'the author can keep what they shared');
select is((select count(*)::int from public.gift_ideas where couple_id is not null), 0, 'kept wishes become private again');

select * from finish();
rollback;
