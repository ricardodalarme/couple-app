begin;
set local search_path = tap, public, extensions;
select plan(11);

select tests.create_user('ana', 'Ana');
select tests.as_admin();

select is(private.is_partner_initiated('card_received'), true, 'a card from the partner is partner-initiated');
select is(private.is_partner_initiated('signal_hug'), true, 'signals are partner-initiated by prefix');
select is(private.is_partner_initiated('daily_idea'), false, 'a reminder is not partner-initiated');
select is(private.is_partner_initiated('pause_over'), false, 'pause_over is not partner-initiated');
select is(private.is_partner_initiated(null), null, 'an unknown type stays unknown');

update public.profile_settings set relationship_status = 'on_break' where profile_id = tests.uid('ana');
select is(private.should_send(tests.uid('ana'), 'card_received', now()), 'send', 'partner-initiated types are delivered during time away');
select is(private.should_send(tests.uid('ana'), 'pause_over', now()), 'send', 'pause_over is delivered during time away');
select is(private.should_send(tests.uid('ana'), 'daily_idea', now()), 'drop', 'reminders are silenced during time away');

update public.profile_settings set relationship_status = 'together' where profile_id = tests.uid('ana');
update public.notification_settings set daily_max = 1 where profile_id = tests.uid('ana');
insert into private.notification_outbox (profile_id, type, dedupe_key, sent_at, outcome) values
  (tests.uid('ana'), 'card_received', 'cap:1', now(), 'sent'),
  (tests.uid('ana'), 'signal_hug', 'cap:2', now(), 'sent'),
  (tests.uid('ana'), 'pause_over', 'cap:3', now(), 'sent');
select is(private.should_send(tests.uid('ana'), 'daily_idea', now()), 'send', 'partner-initiated and pause_over sends do not use the daily cap');
insert into private.notification_outbox (profile_id, type, dedupe_key, sent_at, outcome)
  values (tests.uid('ana'), 'ritual', 'cap:4', now(), 'sent');
select is(private.should_send(tests.uid('ana'), 'daily_idea', now()), 'drop', 'a sent reminder uses the daily cap');
select is(private.should_send(tests.uid('ana'), 'card_received', now()), 'send', 'partner-initiated types ignore the daily cap');

select * from finish();
rollback;
