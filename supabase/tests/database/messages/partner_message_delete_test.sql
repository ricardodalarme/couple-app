begin;
set local search_path = tap, public, extensions;
select plan(5);
select tests.create_user('ana', 'Ana'); select tests.create_user('bia', 'Bia');
create temp table ids (k text primary key, id uuid) on commit drop; grant all on ids to authenticated;
select tests.pair('ana', 'bia');

select tests.as('ana');
with x as (select id from public.send_partner_message('note', 'Boa sorte!', null, false)) insert into ids select 'msg', id from x;

select tests.as('bia');
select is(public.delete_partner_message((select id from ids where k = 'msg')), false, 'the recipient cannot delete a note');
select is((select count(*)::int from public.partner_messages), 1, 'the note is still there after the recipient tried');

select tests.as('ana');
select is(public.delete_partner_message((select id from ids where k = 'msg')), true, 'the sender takes the note back');
select is((select count(*)::int from public.partner_messages), 0, 'the note is gone');
select is(public.delete_partner_message((select id from ids where k = 'msg')), false, 'deleting again is a harmless false');

select * from finish();
rollback;
