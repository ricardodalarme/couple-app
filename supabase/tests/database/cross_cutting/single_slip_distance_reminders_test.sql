begin;
set local search_path = tap, public, extensions;
select plan(20);
select tests.create_user('ana', 'Ana'); select tests.create_user('bia', 'Bia');
select tests.pair('ana', 'bia');
create temp table ids (k text primary key, id uuid, t text) on commit drop; grant all on ids to authenticated;

select tests.as('ana');
select throws_ok(format($$select public.save_slip('00000000-0000-4000-8000-000000000a01', %L)$$, repeat('a', 281)), '23514', null, 'slip body is limited to 280 characters');
select public.save_slip('00000000-0000-4000-8000-000000000a01', 'Fez o café');
select public.save_slip('00000000-0000-4000-8000-000000000a02', 'Lavou a louça', 'invisible');
select is((select card_hour::int from public.my_notification_settings()), 18, 'weekly card defaults to 18:00');

-- single-slip card does not consume or block the weekly card
with x as (select id, kind from public.send_slip_now('00000000-0000-4000-8000-000000000a01', 'Obrigada')) insert into ids select 'single', id, kind from x;
select is((select t from ids where k = 'single'), 'single', 'send_slip_now sends a single card');
select throws_ok($$select public.send_slip_now('00000000-0000-4000-8000-000000000a02')$$, 'P0001', 'SLIP_NOT_ELIGIBLE', 'invisible slips cannot be sent');
select throws_ok($$select public.send_slip_now('00000000-0000-4000-8000-000000000a03')$$, 'P0001', 'SLIP_NOT_ELIGIBLE', 'unknown slip cannot be sent');
select is((select kind from public.prepare_card()), 'weekly', 'the weekly draft still gets built in the same week');
select is((select count(*)::int from public.cards), 2, 'one single card and one weekly draft');
select is((select card_status from public.today()), 'draft', 'Hoje tracks the weekly card, not the single one');
select tests.as('bia');
select is((select unopened_cards from public.today()), 1, 'partner receives the single card');

-- long distance helpers
select tests.as('ana');
update public.profile_settings set time_zone = 'Europe/Lisbon' where profile_id = tests.uid('ana');
update public.profiles set city = 'Lisboa' where id = tests.uid('ana');
insert into public.important_dates (title, kind, month, day, year, yearly, couple_id) values ('Vamos nos ver', 'reunion', 12, 20, 2026, false, private.current_couple_id());
select tests.as('bia');
select is(public.partner_time_zone(), 'Europe/Lisbon', 'partner time zone is available for the two clocks');
select is((select city from public.my_partner()), 'Lisboa', 'partner city is visible');
select is((select next_date_title from public.today()), 'Vamos nos ver', 'the next reunion shows up as the next date');

-- daily content is the same for both partners
select tests.as_admin();
insert into public.content_items (kind, slug, locale, title, position) select 'question', 'tq' || g, 'pt-BR', 'Pergunta ' || g, 100 + g from generate_series(1, 5) g;
select tests.as('ana');
insert into ids select 'q_ana', id, slug from public.daily_content('question');
select tests.as('bia');
select is((select slug from public.daily_content('question')), (select t from ids where k = 'q_ana'), 'both partners get the same question of the day');
select is((select id from public.daily_content('spice_card')), null, 'daily_content only serves safe kinds');

-- reminders job and unpair notice
select tests.as_admin();
select ok(private.enqueue_daily_reminders() >= 0, 'reminder job runs');
select is(private.invite_preview('ZZZZZZZZ'), null, 'unknown invite code previews nothing');
select tests.as('ana');
select public.unpair();
select tests.as_admin();
select is((select count(*)::int from private.notification_outbox where type = 'unpaired' and profile_id = tests.uid('bia')), 1, 'the other person gets a neutral unpaired notice');
select is((select count(*)::int from private.notification_outbox where type = 'unpaired' and profile_id = tests.uid('ana')), 0, 'the person who unpaired does not notify themselves');
select is(private.should_send(tests.uid('bia'), 'unpaired', '2026-11-10 15:00:00-03'), 'send', 'the unpaired notice is not subject to the reminder cap');
select is(private.guest_resume('nope') or private.guest_forget('nope'), false, 'guest self-service ignores unknown tokens');

select * from finish();
rollback;
