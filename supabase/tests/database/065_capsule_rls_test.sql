begin;
set local search_path = tap, public, extensions;
select plan(8);
select tests.create_user('ana'); select tests.create_user('bia');
create temp table ids (k text primary key, id uuid) on commit drop; grant all on ids to authenticated;
select tests.pair('ana', 'bia');

select tests.as('ana');
with x as (insert into public.capsules (body, opens_on, couple_id)
  values ('Para nós, daqui a um mês', current_date + 30, private.current_couple_id()) returning id)
  insert into ids select 'capsule', id from x;
select throws_ok($$update public.capsules set body = 'mudado' where id = (select id from ids where k = 'capsule')$$,
  '42501', null, 'the author cannot edit a sealed capsule');
select throws_ok($$insert into public.capsules (body, opens_on) values ('Cedo demais', current_date + 3)$$,
  '23514', null, 'a capsule cannot open in less than seven days');
select throws_ok($$insert into public.capsules (body, opens_on) values ('Passado', current_date - 1)$$,
  '23514', null, 'a capsule cannot open in the past');

select tests.as('bia');
select is((select count(*)::int from public.capsules), 0, 'the partner cannot read a sealed capsule');
select throws_ok($$update public.capsules set body = 'mudado' where id = (select id from ids where k = 'capsule')$$,
  '42501', null, 'the partner cannot edit a sealed capsule');
with d as (delete from public.capsules where id = (select id from ids where k = 'capsule') returning 1)
select is((select count(*)::int from d), 0, 'the partner cannot delete a sealed capsule');

select tests.as_admin();
update public.capsules set opens_on = current_date where id = (select id from ids where k = 'capsule');
select tests.as('bia');
select is((select count(*)::int from public.capsules), 1, 'the partner reads the capsule once its day comes');

select tests.as('ana');
with d as (delete from public.capsules where id = (select id from ids where k = 'capsule') returning 1)
select is((select count(*)::int from d), 1, 'the author deletes their capsule');

select * from finish();
rollback;
