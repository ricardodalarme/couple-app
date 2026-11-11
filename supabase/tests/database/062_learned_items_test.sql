begin;
set local search_path = tap, public, extensions;
select plan(6);
select tests.create_user('ana'); select tests.create_user('bia'); select tests.pair('ana', 'bia');

select tests.as('ana');
insert into public.learned_items (target, text, excerpt) values ('partner_fact', 'Gosta de café', 'Da conversa');
select is((select count(*)::int from public.learned_items), 1, 'the author can save a learning');
select is((select status from public.learned_items), 'pending', 'a new learning starts pending');
select is((select author_id from public.learned_items), tests.uid('ana'), 'the author is the caller');

select tests.as('bia');
select is((select count(*)::int from public.learned_items), 0, 'the partner cannot see a learning');

select tests.as_anon();
select throws_ok($$insert into public.learned_items (target, text) values ('date', 'Jantar')$$,
  '42501', null, 'a signed-out visitor cannot save a learning');

select tests.as('ana');
select throws_ok($$insert into public.learned_items (target, text, author_id) values ('date', 'Jantar', tests.uid('bia'))$$,
  '42501', null, 'cannot save a learning for someone else');

select * from finish();
rollback;
