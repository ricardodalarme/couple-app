begin;

create extension if not exists pgtap with schema extensions;

select plan(5);

select has_table('public', 'posts', 'posts table exists');
select has_column('public', 'posts', 'title', 'posts has a title');
select policies_are('public', 'posts', array['posts_select_all'], 'posts has the expected policy');
select table_privs_are('public', 'posts', 'anon', array['SELECT'], 'anon can only select posts');
select table_privs_are('public', 'posts', 'authenticated', array['SELECT'], 'authenticated can only select posts');

select * from finish();

rollback;
