begin;
set local search_path = tap, public, extensions;
select plan(40);

select tests.create_user('ana', 'Ana Souza');
select tests.create_user('bia');
select tests.create_user('caio');
select tests.create_user('dani');

-- bootstrap
select is((select display_name from public.profiles where id = tests.uid('ana')), 'Ana Souza', 'trigger creates the profile with the provider name');
select is((select count(*)::int from public.profile_settings where profile_id = tests.uid('bia')), 1, 'trigger creates private settings');
select is((select theme::text || '/' || locale || '/' || time_zone from public.profile_settings where profile_id = tests.uid('bia')), 'neutro/pt-BR/America/Sao_Paulo', 'defaults: neutro, pt-BR, Sao Paulo');

-- anon sees nothing
select tests.as_anon();
select throws_ok('select * from public.profiles', '42501', null, 'anon cannot read profiles');
select throws_ok('select * from public.slips', '42501', null, 'anon cannot read slips');
select throws_ok('select public.create_invite()', '42501', null, 'anon cannot call create_invite');

-- solo person
select tests.as('ana');
select is((select count(*)::int from public.profiles), 1, 'alone: only my own profile is visible');
select is((select id from public.my_profile()), tests.uid('ana'), 'my_profile returns me');
select is((select id from public.my_couple()), null, 'my_couple is null when alone');
select is((select id from public.my_partner()), null, 'my_partner is null when alone');
select lives_ok($$update public.profiles set display_name = 'Ana' where id = tests.uid('ana')$$, 'I can rename myself');
select lives_ok($$update public.profile_settings set theme = 'rosa', time_zone = 'America/Manaus', goal = 'reconnect' where profile_id = tests.uid('ana')$$, 'I can change my settings');
select throws_ok($$update public.profile_settings set theme = 'verde' where profile_id = tests.uid('ana')$$, '22P02', null, 'theme outside the enum is rejected by the database');
select throws_ok($$update public.profile_settings set time_zone = 'Mars/Phobos' where profile_id = tests.uid('ana')$$, '23514', null, 'invalid time zone is rejected');
update public.profiles set display_name = 'Hacked' where id = tests.uid('bia');
select tests.as_admin();
select isnt((select display_name from public.profiles where id = tests.uid('bia')), 'Hacked', 'cannot update another profile');
select tests.as('ana');
select throws_ok($$delete from public.profiles where id = tests.uid('bia')$$, '42501', null, 'profiles cannot be deleted by clients');
select throws_ok($$insert into public.couples default values$$, '42501', null, 'couples cannot be created directly');

-- invites
create temp table t_codes (who text, code text) on commit drop;
grant all on t_codes to authenticated;
insert into t_codes select 'ana', code from public.create_invite();
select is((select count(*)::int from public.invites), 1, 'creator sees the invite');
select throws_ok('select code_hash from public.invites', '42501', null, 'code hash is not readable by clients');
select is((select id from public.accept_invite((select code from t_codes where who = 'ana'))), null, 'accepting my own invite returns null');
select tests.as('bia');
select is((select count(*)::int from public.invites), 0, 'others cannot list my invites');
select is((select id from public.accept_invite('ZZZZZZZZ')), null, 'unknown code returns null (generic)');
select isnt((select id from public.accept_invite((select lower(code) from t_codes where who = 'ana'))), null, 'partner accepts (case-insensitive) and gets the couple');
select is((select count(*)::int from public.profiles), 2, 'paired: I see myself and my partner');
select is((select id from public.my_partner()), tests.uid('ana'), 'my_partner returns the inviter');
select is((select count(*)::int from public.couple_members), 2, 'both memberships are visible');
select is((select count(*)::int from public.profile_settings), 1, 'partner settings stay private');
select isnt((select id from public.accept_invite((select code from t_codes where who = 'ana'))), null, 'retrying the same accept is a no-op success');
select throws_ok('select public.create_invite()', 'P0001', 'ALREADY_PAIRED', 'paired person cannot create an invite');

-- third person cannot join or see
select tests.as('caio');
select is((select id from public.accept_invite((select code from t_codes where who = 'ana'))), null, 'used invite returns null for a third person');
select is((select count(*)::int from public.couples), 0, 'stranger sees no couple');
select is((select count(*)::int from public.profiles), 1, 'stranger sees only self');
insert into t_codes select 'caio', code from public.create_invite();
select tests.as('bia');
select is((select id from public.accept_invite((select code from t_codes where who = 'caio'))), null, 'already paired acceptor gets the generic null');
select tests.as_admin();
select throws_ok(format($$insert into public.couple_members (couple_id, profile_id, role) values (%L, %L, 'invitee')$$, (select couple_id from public.couple_members where profile_id = tests.uid('ana')), tests.uid('dani')), '23514', 'COUPLE_FULL', 'a couple never has a third active member');

-- cancel and expiry
select tests.as('caio');
select is(public.cancel_invite((select id from public.invites limit 1)), true, 'creator cancels the invite');
select tests.as('dani');
select is((select id from public.accept_invite((select code from t_codes where who = 'caio'))), null, 'cancelled invite returns null');

-- unpair
select tests.as('ana');
select is(public.unpair(), true, 'unpair succeeds');
select is((select count(*)::int from public.profiles), 1, 'after unpair I only see myself');
select tests.as('bia');
select is((select id from public.my_couple()), null, 'partner lost the shared space immediately');
select is(public.unpair(), false, 'unpair again is a no-op');

select * from finish();
rollback;
