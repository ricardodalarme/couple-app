begin;
set local search_path = tap, public, extensions;
select plan(8);

select tests.create_user('ana', 'Ana');
select tests.as_admin();
delete from public.app_config where key in ('free_slips_per_month', 'free_cards_per_month');

select is(private.free_limit('slips'), 15, 'a missing slips setting falls back to the launch limit');
select is(private.free_limit('cards'), 1, 'a missing cards setting falls back to the launch limit');

select tests.as('ana');
select public.save_slip('00000000-0000-4000-8000-000000000b01', 'primeiro');
select public.save_slip(gen_random_uuid(), 'slip ' || i) from generate_series(1, 14) i;
select is((select count(*)::int from public.slips where author_id = tests.uid('ana')), 15, 'the free plan allows 15 slips without any setting');
select throws_ok($$select public.save_slip(gen_random_uuid(), 'um a mais')$$, 'P0001', 'FREE_LIMIT_REACHED', 'the next new slip is refused even though the setting row is gone');
select lives_ok($$select public.save_slip('00000000-0000-4000-8000-000000000b01', 'editado')$$, 'editing an existing slip still works at the limit');
select is((select slips_left_this_month from public.my_plus()), 0, 'my_plus reports nothing left');

select tests.as_admin();
insert into public.app_config (key, value) values ('free_slips_per_month', '16');
select is(private.free_limit('slips'), 16, 'a stored setting overrides the fallback');
select tests.as('ana');
select lives_ok($$select public.save_slip(gen_random_uuid(), 'agora cabe')$$, 'the raised limit lets one more slip in');

select * from finish();
rollback;
