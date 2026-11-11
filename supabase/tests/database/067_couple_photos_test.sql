begin;
set local search_path = tap, public, extensions;
select plan(11);

select tests.create_user('ana', 'Ana'); select tests.create_user('bia', 'Bia');
select tests.create_user('caio', 'Caio'); select tests.create_user('duda', 'Duda');

select tests.pair('ana', 'bia');
select tests.pair('caio', 'duda');

select tests.as_admin();
select set_config(
  'tests.ana_couple',
  (select couple_id::text from public.couple_members
   where profile_id = tests.uid('ana') and left_at is null),
  false
);

select tests.as('ana');
select lives_ok(
  $$insert into public.couple_photos (couple_id, storage_path, uploaded_by)
    values ((select private.current_couple_id()), 'photo-a', tests.uid('ana'))$$,
  'a member writes the couple photo');
select is((select count(*) from public.couple_photos), 1::bigint, 'a member reads the couple photo');

select tests.as('bia');
select is((select count(*) from public.couple_photos), 1::bigint, 'the partner reads the couple photo');
select lives_ok(
  $$update public.couple_photos set storage_path = 'photo-b', uploaded_by = tests.uid('bia')$$,
  'the partner replaces the couple photo');

select tests.as('caio');
select is((select count(*) from public.couple_photos), 0::bigint, 'a foreign couple cannot read the photo');
select throws_ok(
  $$insert into public.couple_photos (couple_id, storage_path, uploaded_by)
    values (current_setting('tests.ana_couple')::uuid, 'hijacked', tests.uid('caio'))$$,
  '42501', null, 'a foreign couple cannot write a photo for another couple');
select lives_ok($$update public.couple_photos set storage_path = 'hijacked'$$, 'a foreign couple updates nothing');
select lives_ok($$delete from public.couple_photos$$, 'a foreign couple deletes nothing');

select tests.as_admin();
select is((select count(*) from public.couple_photos), 1::bigint, 'the row survives the foreign write');
select is((select storage_path from public.couple_photos), 'photo-b', 'the foreign update changed nothing');

select tests.as('ana');
select public.unpair();
select is((select count(*) from public.couple_photos), 0::bigint, 'an unpaired person loses access to the photo');

select * from finish();
rollback;
