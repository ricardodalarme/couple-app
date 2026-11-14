begin;
set local search_path = tap, public, extensions;
select plan(36);

select tests.create_user('ana'); select tests.create_user('bia'); select tests.create_user('caio');
select tests.pair('ana', 'bia');

select tests.as('ana');
select is((select id from public.prepare_card()), null, 'a week without slips creates no card');
select is((select id from public.sunday_card()), null, 'sunday_card is null for an empty week');
select public.save_slip('00000000-0000-4000-8000-0000000000a1', 'Fez o café');
select public.save_slip('00000000-0000-4000-8000-0000000000a2', 'Buscou minha mãe', 'specific', 'amada');
select public.save_slip('00000000-0000-4000-8000-0000000000a3', 'Lavou a louça', 'invisible');
select public.save_slip('00000000-0000-4000-8000-0000000000a4', 'Só para mim', 'quick', null, null, '{}', false);
create temp table t (card uuid) on commit drop; grant all on t to authenticated;
insert into t select id from public.prepare_card();
select isnt((select card from t), null, 'prepare_card builds the draft');
select is((select status::text from public.sunday_card()), 'draft', 'sunday_card returns the draft');
select is((select count(*)::int from public.card_items), 2, 'draft holds only for-card, non-invisible slips');
select is((select id from public.prepare_card()), (select card from t), 'prepare_card is idempotent');
select tests.as_admin();
select is(private.generate_weekly_cards() >= 0, true, 'weekly job runs');
select is((select count(*)::int from public.cards where author_id = tests.uid('ana')), 1, 'job never duplicates a week (unique author/week)');
select is((select count(*)::int from cron.job where jobname = 'weekly-card-drafts'), 1, 'cron job is registered');
select tests.as('ana');

-- partner cannot see or touch a draft
select tests.as('bia');
select is((select count(*)::int from public.cards), 0, 'partner cannot see a draft');
select is((select count(*)::int from public.card_items), 0, 'partner cannot see draft items');
select throws_ok(format('select public.send_card(%L)', (select card from t)), 'P0001', 'CARD_NOT_FOUND', 'partner cannot send my card');
select throws_ok(format('select public.mark_card_read(%L)', (select card from t)), 'P0001', 'CARD_NOT_FOUND', 'an unsent card cannot be opened');

-- edit, hold, send
select tests.as('ana');
select throws_ok(format($$select public.update_card_draft(%L, array['00000000-0000-4000-8000-0000000000a3']::uuid[])$$, (select card from t)), 'P0001', 'SLIP_NOT_ELIGIBLE', 'invisible slip can never enter a card');
select lives_ok(format($$select public.update_card_draft(%L, array['00000000-0000-4000-8000-0000000000a2', '00000000-0000-4000-8000-0000000000a1']::uuid[], 'Obrigada pela semana')$$, (select card from t)), 'author reorders items and adds a note');
select is((select body from public.card_items where position = 1), 'Buscou minha mãe', 'order follows the given list');
select is((select status::text from public.hold_card((select card from t))), 'held', 'author holds the card');
select tests.as('bia');
select is((select count(*)::int from public.cards), 0, 'held card never reaches the partner');
select tests.as('ana');
select public.delete_slip('00000000-0000-4000-8000-0000000000a1');
select is((select count(*)::int from public.card_items), 1, 'deleting a slip removes it from the unsent card');
select is((select recipient_id from public.send_card((select card from t))), tests.uid('bia'), 'send delivers to the current partner');
select throws_ok(format('select public.hold_card(%L)', (select card from t)), 'P0001', 'CARD_ALREADY_SENT', 'sent cards are immutable');
select public.save_slip('00000000-0000-4000-8000-0000000000a2', 'Texto editado depois');
select is((select body from public.card_items limit 1), 'Buscou minha mãe', 'editing a slip later does not change the sent card');
select throws_ok($$update public.cards set note = 'x'$$, '42501', null, 'no direct writes on cards');

-- receiving
select tests.as('caio');
select is((select count(*)::int from public.cards), 0, 'stranger sees no cards');
select tests.as('bia');
select is((select count(*)::int from public.cards), 1, 'recipient sees the sent card');
select is((select count(*)::int from public.card_items), 1, 'recipient reads the items');
select is((select count(*)::int from public.slips), 0, 'recipient still cannot read the slips themselves');
select is(public.mark_card_read((select card from t)), true, 'recipient opens the card');
select is(public.mark_card_read((select card from t)), true, 'opening twice is a no-op');
select is((select reaction from public.react_to_card((select card from t), '❤️')), '❤️', 'recipient reacts');
select is((select reply from public.react_to_card((select card from t), '🥹', 'Amei')), 'Amei', 'reaction is replaceable');
select tests.as('ana');
select is((select count(*)::int from public.card_reactions), 1, 'author sees the reaction');
select is((select count(*)::int from public.card_opens), 0, 'author does not see read state by default');
select tests.as('bia');
update public.profile_settings set share_read_receipts = true where profile_id = tests.uid('bia');
select tests.as('ana');
select is((select count(*)::int from public.card_opens), 1, 'author sees read state once the recipient shares it');
select is(public.delete_card((select card from t)), true, 'author deletes the card');
select tests.as('bia');
select is((select count(*)::int from public.cards), 0, 'deleted card disappears for the recipient too');

select * from finish();
rollback;
