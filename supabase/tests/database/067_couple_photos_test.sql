begin;
set local search_path = tap, public, extensions;
select plan(20);

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
select set_config(
  'tests.caio_couple',
  (select couple_id::text from public.couple_members
   where profile_id = tests.uid('caio') and left_at is null),
  false
);

select tests.as('ana');
select lives_ok(
  $$insert into public.couple_photos (couple_id, storage_path, uploaded_by)
    values ((select private.current_couple_id()),
            (select private.current_couple_id())::text || '/photo-a',
            tests.uid('ana'))$$,
  'a member writes the couple photo');
select is((select count(*) from public.couple_photos), 1::bigint, 'a member reads the couple photo');
select throws_ok(
  $$insert into public.couple_photos (couple_id, storage_path, uploaded_by)
    values ((select private.current_couple_id()), 'loose.jpg', tests.uid('ana'))$$,
  '23514', null, 'the storage path must stay inside the couple folder');

select tests.as('bia');
select is((select count(*) from public.couple_photos), 1::bigint, 'the partner reads the couple photo');
select lives_ok(
  $$update public.couple_photos
    set storage_path = (select private.current_couple_id())::text || '/photo-b',
        uploaded_by = tests.uid('bia')$$,
  'the partner replaces the couple photo');

select tests.as('caio');
select is((select count(*) from public.couple_photos), 0::bigint, 'a foreign couple cannot read the photo');
select throws_ok(
  $$insert into public.couple_photos (couple_id, storage_path, uploaded_by)
    values (current_setting('tests.ana_couple')::uuid,
            current_setting('tests.ana_couple') || '/hijacked',
            tests.uid('caio'))$$,
  '42501', null, 'a foreign couple cannot write a photo for another couple');
select lives_ok($$update public.couple_photos set storage_path = 'hijacked'$$, 'a foreign couple updates nothing');
select lives_ok($$delete from public.couple_photos$$, 'a foreign couple deletes nothing');

select tests.as_admin();
select is((select count(*) from public.couple_photos), 1::bigint, 'the row survives the foreign write');
select is(
  (select storage_path from public.couple_photos),
  (select current_setting('tests.ana_couple')) || '/photo-b',
  'the foreign update changed nothing');

insert into storage.objects (id, bucket_id, name) values
  (gen_random_uuid(), 'couple_photos', (select current_setting('tests.ana_couple')) || '/stored.jpg'),
  (gen_random_uuid(), 'couple_photos', (select current_setting('tests.caio_couple')) || '/foreign.jpg');

select tests.as('ana');
select is(
  (select count(*) from storage.objects where bucket_id = 'couple_photos'),
  1::bigint,
  'a member reads only the files inside the couple folder');
select lives_ok(
  $$insert into storage.objects (id, bucket_id, name)
    values (gen_random_uuid(), 'couple_photos',
            (select private.current_couple_id())::text || '/new.jpg')$$,
  'a member writes a file inside the couple folder');
select throws_ok(
  $$insert into storage.objects (id, bucket_id, name)
    values (gen_random_uuid(), 'couple_photos',
            current_setting('tests.caio_couple') || '/hijacked.jpg')$$,
  '42501', null, 'a member cannot write a file in another couple folder');

select tests.as('caio');
select is(
  (select count(*) from storage.objects where bucket_id = 'couple_photos'),
  1::bigint,
  'a foreign couple reads only its own file');

select tests.as_anon();
select is(
  (select count(*) from storage.objects where bucket_id = 'couple_photos'),
  0::bigint,
  'anon reads no couple photo files');

select tests.as('ana');
select public.unpair();
select is((select count(*) from public.couple_photos), 0::bigint, 'an unpaired person loses access to the photo');
select tests.as_admin();
select is(
  (select count(*) from private.storage_deletions
   where bucket = 'couple_photos'
     and path = (select current_setting('tests.ana_couple')) || '/photo-b'),
  1::bigint,
  'unpair queues the stored photo for deletion');

insert into public.couple_photos (couple_id, storage_path, uploaded_by)
values (
  (select current_setting('tests.caio_couple')::uuid),
  (select current_setting('tests.caio_couple')) || '/erase.jpg',
  tests.uid('caio')
);
select private.erase_profile(tests.uid('caio'));
select is(
  (select count(*) from public.couple_photos
   where couple_id = (select current_setting('tests.caio_couple')::uuid)),
  0::bigint,
  'erasing a profile deletes the couple photo');
select is(
  (select count(*) from private.storage_deletions
   where bucket = 'couple_photos'
     and path = (select current_setting('tests.caio_couple')) || '/erase.jpg'),
  1::bigint,
  'erasing a profile queues the stored photo for deletion');

select * from finish();
rollback;
