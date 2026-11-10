begin;
set local search_path = tap, public, extensions;
select plan(22);

select tests.create_user('ana'); select tests.create_user('bia'); select tests.create_user('caio');
select tests.pair('ana', 'bia');

select tests.as('ana');
select is((select body from public.save_slip('00000000-0000-4000-8000-000000000001', '  Fez o café antes de eu acordar  ', 'specific', 'cuidada')), 'Fez o café antes de eu acordar', 'save_slip creates and trims');
select is((select count(*)::int from public.slips), 1, 'author sees the slip');
select is((select body from public.save_slip('00000000-0000-4000-8000-000000000001', 'Fez o café', 'quick')), 'Fez o café', 'same id again updates (idempotent upsert)');
select is((select count(*)::int from public.slips), 1, 'no duplicate row for the same client id');
select is((select for_card from public.save_slip('00000000-0000-4000-8000-000000000002', 'Lavou a louça sem ninguém ver', 'invisible', null, null, '{}', true)), false, 'invisible slips are never for the card');
select throws_ok($$select public.save_slip('00000000-0000-4000-8000-000000000003', '   ')$$, '23514', null, 'empty body is rejected');
select throws_ok(format($$select public.save_slip('00000000-0000-4000-8000-000000000003', %L)$$, repeat('a', 501)), '23514', null, 'body over 500 characters is rejected');
select throws_ok($$select public.save_slip('00000000-0000-4000-8000-000000000003', 'x', 'nope')$$, 'P0001', 'INVALID_SLIP_KIND', 'unknown kind is rejected with a stable code');
select ok((select created_at <= now() from public.save_slip('00000000-0000-4000-8000-000000000004', 'do futuro', 'quick', null, null, '{}', true, null, null, now() + interval '3 days')), 'client timestamps in the future are clamped');
select ok((select created_at < now() - interval '1 day' from public.save_slip('00000000-0000-4000-8000-000000000005', 'offline de ontem', 'quick', null, null, '{}', true, null, null, now() - interval '2 days')), 'offline slips keep their original time');
select throws_ok($$insert into public.slips (author_id, body) values (tests.uid('ana'), 'direct')$$, '42501', null, 'direct inserts are not allowed');
select throws_ok($$update public.slips set body = 'x'$$, '42501', null, 'direct updates are not allowed');

-- partner and stranger
select tests.as('bia');
select is((select count(*)::int from public.slips), 0, 'partner cannot read my slips');
select throws_ok($$select public.save_slip('00000000-0000-4000-8000-000000000001', 'hijack')$$, 'P0001', 'SLIP_NOT_FOUND', 'partner cannot overwrite my slip by reusing its id');
select throws_ok($$select public.archive_slip('00000000-0000-4000-8000-000000000001')$$, 'P0001', 'SLIP_NOT_FOUND', 'partner cannot archive my slip');
select is(public.delete_slip('00000000-0000-4000-8000-000000000001'), false, 'partner cannot delete my slip');
select tests.as('caio');
select is((select count(*)::int from public.slips), 0, 'stranger cannot read slips');

-- archive, delete, unpair
select tests.as('ana');
select isnt((select archived_at from public.archive_slip('00000000-0000-4000-8000-000000000001')), null, 'author archives');
select is((select archived_at from public.archive_slip('00000000-0000-4000-8000-000000000001', false)), null, 'author unarchives');
select is(public.delete_slip('00000000-0000-4000-8000-000000000002'), true, 'author deletes (tombstone)');
select is((select body from public.slips where id = '00000000-0000-4000-8000-000000000002'), '[deleted]', 'deleted slip keeps no content');
select public.unpair();
select is((select count(*)::int from public.slips where deleted_at is null), 3, 'after unpair the author still reads their slips');

select * from finish();
rollback;
