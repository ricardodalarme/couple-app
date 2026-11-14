begin;
set local search_path = tap, public, extensions;
select plan(6);
select tests.create_user('ana');
select tests.create_user('bruno');
select tests.pair('ana', 'bruno');

create temp table couple_topic as select 'couple:' || (select couple_id from public.couple_members where profile_id = tests.uid('ana') and left_at is null) as topic;
grant select on couple_topic to authenticated;

select tests.as('ana');
insert into public.lists (id, title, couple_id)
  values ('00000000-0000-4000-8000-000000000001', 'Juntos', (select id from public.my_couple()));
insert into public.lists (id, title) values ('00000000-0000-4000-8000-000000000002', 'So meu');
insert into public.list_items (list_id, title) values ('00000000-0000-4000-8000-000000000001', 'Praia');
insert into public.list_items (list_id, title) values ('00000000-0000-4000-8000-000000000002', 'Segredo');
insert into public.moods (mood, share) values ('happy', 'mood');
select tests.as_admin();

select is(
  (select count(*) from realtime.messages m where m.topic = (select topic from couple_topic) and m.event = 'shared_changed' and m.payload ->> 'table' = 'lists'),
  1::bigint, 'creating a shared list tells the couple');
select is(
  (select count(*) from realtime.messages m where m.topic = (select topic from couple_topic) and m.event = 'shared_changed' and m.payload ->> 'table' = 'list_items'),
  1::bigint, 'an item of a shared list tells the couple, and one of a private list does not');
select is(
  (select count(*) from realtime.messages m where m.event = 'shared_changed' and m.payload ->> 'table' = 'lists' and m.topic <> (select topic from couple_topic)),
  0::bigint, 'a private list tells nobody');
select is(
  (select count(*) from realtime.messages m where m.topic = (select topic from couple_topic) and m.event = 'partner_mood_changed'),
  1::bigint, 'a shared mood tells the couple');

select tests.as('ana');
insert into public.moods (day, mood, share) values (current_date - 5, 'sad', 'none');
select tests.as_admin();
select is(
  (select count(*) from realtime.messages m where m.topic = (select topic from couple_topic) and m.event = 'partner_mood_changed'),
  1::bigint, 'a mood kept private tells nobody');

select tests.as('ana');
delete from public.lists where id = '00000000-0000-4000-8000-000000000001';
select tests.as_admin();
select is(
  (select count(*) from realtime.messages m where m.topic = (select topic from couple_topic) and m.event = 'shared_changed' and m.payload ->> 'table' = 'lists'),
  2::bigint, 'deleting a shared list tells the couple');

select * from finish();
rollback;
