begin;
set local search_path = tap, public, extensions;
select plan(31);
select tests.create_user('ana', 'Ana'); select tests.create_user('bia', 'Bia'); select tests.create_user('caio');
select tests.pair('ana', 'bia');

-- free limit and Plus for both
update public.app_config set value = '2' where key = 'free_slips_per_month';
select tests.as('ana');
select is((select has_plus from public.my_plus()), false, 'free by default');
select public.save_slip('00000000-0000-4000-8000-0000000000f1', 'um'); select public.save_slip('00000000-0000-4000-8000-0000000000f2', 'dois');
select is((select slips_left_this_month from public.my_plus()), 0, 'free allowance is counted');
select throws_ok($$select public.save_slip('00000000-0000-4000-8000-0000000000f3', 'três')$$, 'P0001', 'FREE_LIMIT_REACHED', 'new slips stop at the free limit');
select is((select body from public.save_slip('00000000-0000-4000-8000-0000000000f1', 'um, editado')), 'um, editado', 'existing slips stay editable at the limit');
select isnt((select id from public.start_pause(now() + interval '1 hour')), null, 'pause is never blocked by the limit');
select public.end_pause();
select throws_ok($$insert into public.entitlements (profile_id, plan, status) values (tests.uid('ana'), 'plus_annual', 'active')$$, '42501', null, 'clients can never write entitlements');
select tests.as_admin();
select is(private.apply_purchase_event('evt-1', tests.uid('bia'), 'INITIAL_PURCHASE', now(), 'plus_annual', 'trialing', now() + interval '7 days', true, 'app_store'), true, 'webhook applies the purchase');
select is(private.apply_purchase_event('evt-1', tests.uid('bia'), 'INITIAL_PURCHASE', now(), 'plus_annual', 'trialing', now() + interval '7 days', true, 'app_store'), false, 'replayed webhook is a no-op');
select private.apply_purchase_event('evt-0', tests.uid('bia'), 'OLD', now() - interval '1 day', 'plus_monthly', 'expired', now() - interval '1 day', false, 'app_store');
select is((select status from public.entitlements where profile_id = tests.uid('bia')), 'trialing', 'an older event arriving late does not overwrite newer state');
select tests.as('ana');
select is((select has_plus from public.my_plus()), true, 'Plus bought by my partner covers me');
select is((select paid_by_partner from public.my_plus()), true, 'and I am told my partner pays');
select isnt((select id from public.save_slip('00000000-0000-4000-8000-0000000000f3', 'três')), null, 'with Plus the limit is gone');
select tests.as('caio');
select is((select has_plus from public.my_plus()), false, 'a stranger gets no Plus');
select is((select count(*)::int from public.entitlements), 0, 'and cannot see entitlements');
select tests.as('ana');
select public.unpair();
select is((select has_plus from public.my_plus()), false, 'after unpairing, the partner''s Plus no longer covers me');

-- content and spice mode
select tests.as_admin();
insert into public.content_items (kind, slug, locale, title) values ('question', 'q1', 'pt-BR', 'Qual é uma mania dele que você adora?'), ('spice_card', 's1', 'pt-BR', 'Sussurre uma coisa de que você gosta.');
insert into public.content_items (kind, slug, locale, title, published) values ('question', 'draft', 'pt-BR', 'rascunho', false);
select tests.pair('ana', 'bia');
select tests.as('ana');
select is((select count(*)::int from public.content_items where slug in ('q1', 's1', 'draft')), 1, 'published content is readable; drafts and spice are not');
update public.profile_settings set spice_enabled = true where profile_id = tests.uid('ana');
select is((select count(*)::int from public.content_items where kind = 'spice_card'), 0, 'spice stays hidden when only one of the two enabled it');
select tests.as('bia');
update public.profile_settings set spice_enabled = true where profile_id = tests.uid('bia');
select is((select count(*)::int from public.content_items where slug = 's1'), 1, 'spice appears only when both enabled it');
select throws_ok($$insert into public.content_items (kind, slug, locale, title) values ('question', 'x', 'en', 'x')$$, '42501', null, 'clients cannot write content');

-- anon: only config
select tests.as_anon();
select isnt((select value from public.app_config where key = 'min_app_version'), null, 'app config is readable without signing in');
select throws_ok('select * from public.content_items', '42501', null, 'anon cannot read content');

-- consents, support, chat allowance
select tests.as('ana');
insert into public.consents (kind, granted, version) values ('analytics', true, '1'), ('analytics', false, '1');
select is((select granted from public.consents where kind = 'analytics' order by created_at desc, id limit 1) is not null, true, 'consent history is kept');
select throws_ok($$update public.consents set granted = true$$, '42501', null, 'consent history cannot be rewritten');
select is(public.create_support_request('bug', 'O cartão não abriu'), true, 'support request is stored');
select throws_ok('select * from private.support_requests', '42501', null, 'support requests are not readable by clients');
select is(public.chat_messages_left(), 20, 'Plus (through my partner) gets the daily mascot allowance');

-- account deletion
select is((select purge_after > now() + interval '13 days' from public.request_account_deletion()), true, 'deletion is scheduled 14 days ahead');
select is((select deletion_pending from public.today()), true, 'Hoje knows deletion is pending');
select tests.as('bia');
select is((select is_paired from public.today()), false, 'partner sees a neutral unpaired state at once');
select tests.as('ana');
select is(public.cancel_account_deletion(), true, 'I can cancel within the window');
select public.request_account_deletion();
select tests.as_admin();
update public.deletion_requests set purge_after = now() - interval '1 minute';
select private.purge_deleted_accounts();
select is((select count(*)::int from auth.users where id = tests.uid('ana')) + (select count(*)::int from public.profiles where id = tests.uid('ana'))
  + (select count(*)::int from public.slips where author_id = tests.uid('ana')) + (select count(*)::int from public.consents where profile_id = tests.uid('ana')), 0, 'after the purge nothing of the person remains');

select * from finish();
rollback;
