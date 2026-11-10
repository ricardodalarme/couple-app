begin;
set local search_path = tap, public, extensions;
select plan(31);

select tests.create_user('ana', 'Ana'); select tests.create_user('bia', 'Bia'); select tests.create_user('caio');

-- today: alone, first day
select tests.as('ana');
select is((select suggestion_key from public.today()), 'first_slip', 'first day suggests the first slip');
select is((select is_paired from public.today()), false, 'alone: not paired');
select is((select partner_name from public.today()), null, 'alone: no partner name');
update public.profile_settings set partner_name = 'Bi' where profile_id = tests.uid('ana');
select is((select partner_name from public.today()), 'Bi', 'solo mode uses the name I typed');
select public.save_slip('00000000-0000-4000-8000-0000000000b1', 'Fez o café');
select is((select suggestion_key from public.today()), 'invite_partner', 'with slips and no partner: suggest inviting');
select is((select slips_this_week from public.today()), 1, 'counts this week''s slips');

-- devices
select is(public.register_device('token-ana-phone-0001', 'ios', 'iPhone'), true, 'device registers');
select is(public.register_device('token-ana-phone-0001', 'ios'), true, 'registering again is idempotent');
select is((select count(*)::int from public.devices), 1, 'one device row');
select throws_ok('select token from public.devices', '42501', null, 'push tokens are not readable by clients');
select throws_ok($$select public.register_device('token-ana-phone-0002', 'windows')$$, 'P0001', 'INVALID_PLATFORM', 'unknown platform rejected');
select tests.as('bia');
select is((select count(*)::int from public.devices), 0, 'others cannot see my devices');
select public.register_device('token-ana-phone-0001', 'ios');
select tests.as('ana');
select is((select count(*)::int from public.devices), 0, 'a handed-over phone belongs to the newest sign-in');
select is((select count(*)::int from public.notification_settings), 1, 'I only see my notification settings');

-- pairing and card notifications
select tests.pair('ana', 'bia');
select tests.as_admin();
select is((select count(*)::int from private.notification_outbox where profile_id = tests.uid('ana') and type = 'partner_joined'), 1, 'inviter is told the partner joined');
select tests.as('ana');
select is((select partner_name from public.today()), 'Bia', 'paired: partner display name wins');
create temp table t (card uuid) on commit drop; grant all on t to authenticated;
insert into t select id from public.prepare_card();
select is((select suggestion_key from public.today()), 'review_card', 'draft waiting: suggest reviewing the card');
select public.send_card((select card from t));
select tests.as('bia');
select is((select unopened_cards from public.today()), 1, 'recipient sees one unopened card');
select is((select suggestion_key from public.today()), 'first_slip', 'recipient without slips still starts with the first slip');
select public.mark_card_read((select card from t));
select is((select unopened_cards from public.today()), 0, 'opened card no longer counts');
select public.react_to_card((select card from t), '❤️');
select tests.as_admin();
select is((select count(*)::int from private.notification_outbox where profile_id = tests.uid('bia') and type = 'card_received'), 1, 'recipient gets one card_received');
select is((select count(*)::int from private.notification_outbox where profile_id = tests.uid('ana') and type = 'card_reaction'), 1, 'author gets one card_reaction (deduplicated)');
select ok((select count(*) from realtime.messages where topic = 'user:' || tests.uid('bia') and event = 'card_received') >= 1, 'realtime signal sent to the recipient');
-- real realtime.send adds only a generated "id" key; anything else would be content
select is((select count(*)::int from realtime.messages where payload - 'id' <> '{}'::jsonb), 0, 'realtime payloads never carry content');

-- preference rules
update public.profile_settings set time_zone = 'America/Sao_Paulo' where profile_id = tests.uid('bia');
select is(private.should_send(tests.uid('bia'), 'card_received', '2026-11-10 15:00:00-03'), 'send', 'daytime: send');
select is(private.should_send(tests.uid('bia'), 'card_received', '2026-11-10 23:30:00-03'), 'delay', 'quiet hours crossing midnight: delay');
select is(private.should_send(tests.uid('bia'), 'card_received', '2026-11-11 07:59:00-03'), 'delay', 'still quiet before 08:00');
select is(private.quiet_end_at(tests.uid('bia'), '2026-11-10 23:30:00-03'), '2026-11-11 08:00:00-03'::timestamptz, 'delayed until the end of quiet hours');
update public.notification_settings set muted_types = '{card_received}' where profile_id = tests.uid('bia');
select is(private.should_send(tests.uid('bia'), 'card_received', '2026-11-10 15:00:00-03'), 'drop', 'muted type: drop');
update public.notification_settings set muted_types = '{}', enabled = false where profile_id = tests.uid('bia');
select is(private.should_send(tests.uid('bia'), 'card_received', '2026-11-10 15:00:00-03'), 'drop', 'notifications off: drop');

-- sender queue
select is((select count(*)::int from private.claim_notifications(50)), 0, 'nothing is handed to the sender without a device or when dropped');

select * from finish();
rollback;
