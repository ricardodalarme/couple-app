begin;
set local search_path = tap, public, extensions;
select plan(24);

select tests.create_user('ana', 'Ana'); select tests.create_user('caio');
select tests.as('ana');
select public.save_slip('00000000-0000-4000-8000-0000000000d1', 'Fez o café', 'specific', 'cuidada');
create temp table t (card uuid, token text, link uuid) on commit drop; grant all on t to authenticated;
insert into t (card) select id from public.prepare_card();
select throws_ok(format('select public.create_guest_link(%L)', (select card from t)), 'P0001', 'CARD_NOT_FOUND', 'no link for an unsent card');
select is((select recipient_id from public.send_card((select card from t))), null, 'solo person sends: no in-app recipient');
update t set (link, token) = (select id, token from public.create_guest_link((select card from t)));
select is(length((select token from t)), 48, 'token is 48 hex chars');
select is((select count(*)::int from public.guest_links), 1, 'author lists the link');
select throws_ok('select token_hash from public.guest_links', '42501', null, 'token hash is not readable');
select throws_ok(format('select private.guest_card(%L)', (select token from t)), '42501', null, 'clients cannot call the guest functions');
select tests.as('caio');
select is((select count(*)::int from public.guest_links), 0, 'others cannot see my links');
select throws_ok(format('select public.create_guest_link(%L)', (select card from t)), 'P0001', 'CARD_NOT_FOUND', 'cannot link someone else''s card');
select is(public.revoke_guest_link((select link from t)), false, 'cannot revoke someone else''s link');

-- the Edge Function side (service role)
select tests.as_admin();
select is(private.guest_card('nope'), null, 'unknown token: null');
select is(private.guest_card((select token from t)) ->> 'senderName', 'Ana', 'page gets the sender name');
select is(private.guest_card((select token from t)) #>> '{items,0,body}', 'Fez o café', 'page gets the items');
select is((select array_agg(k order by k collate "C") from jsonb_object_keys(private.guest_card((select token from t))) k), array['items','note','opened','reaction','senderName','sentAt','theme'], 'page payload has exactly the allowed keys');
select is((select count(*)::int from public.card_opens), 0, 'fetching the card does not mark it opened');
select is(private.guest_open((select token from t)), true, 'guest taps Open');
select is((select count(*)::int from public.card_opens), 1, 'now it counts as opened');
select is(private.guest_react((select token from t), '❤️', 'Obrigado'), true, 'guest reacts');
select is((select from_guest from public.card_reactions), true, 'reaction is marked as from the guest');
select is(private.guest_report((select token from t), 'harassment', null, true), true, 'guest reports');
select is((select card_snapshot is not null and reported_profile_id = tests.uid('ana') from private.abuse_reports), true, 'report keeps the card only when the reporter attached it');
select is(private.guest_stop((select token from t)) and private.guest_stop((select token from t)), true, 'stop is idempotent');
select is(private.guest_card((select token from t)), null, 'after stop the link is dead');
select tests.as('ana');
update t set token = (select token from public.create_guest_link((select card from t)));
select isnt((select token from t), null, 'sender can still create links (is not told about the stop)');
select tests.as_admin();
select is(private.guest_card((select token from t)), null, 'but new links never resolve');

select * from finish();
rollback;
