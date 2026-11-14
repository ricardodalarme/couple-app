begin;
set local search_path = tap, public, extensions;
select plan(9);

select tests.as_admin();
select is(private.invoke_edge_function('push-sender'), null, 'nothing is sent while the Vault secrets are missing');

select vault.create_secret('https://ref.example.test/', 'project_url');
select is(private.invoke_edge_function('push-sender'), null, 'a missing secret key still sends nothing');

select vault.create_secret('sb_secret_test_value', 'secret_key');
select isnt(private.invoke_edge_function('push-sender'), null, 'with both secrets a request is queued');
select is((select count(*)::int from net.http_request_queue where url = 'https://ref.example.test/functions/v1/push-sender'), 1,
  'the request goes to /functions/v1/<name> without a double slash');
select is((select headers ->> 'apikey' from net.http_request_queue where url = 'https://ref.example.test/functions/v1/push-sender'),
  'sb_secret_test_value', 'the secret key travels in the apikey header');
select is((select timeout_milliseconds from net.http_request_queue where url = 'https://ref.example.test/functions/v1/push-sender'), 30000,
  'the request has a 30 second timeout');

select ok(not has_function_privilege('authenticated', 'private.invoke_edge_function(text, integer)', 'execute')
  and not has_function_privilege('anon', 'private.invoke_edge_function(text, integer)', 'execute'), 'clients cannot call the helper');
select is((select schedule from cron.job where jobname = 'push-sender' and command = 'select private.invoke_edge_function(''push-sender'')'), '* * * * *',
  'the push sender runs every minute');
select is((select schedule from cron.job where jobname = 'storage-cleanup' and command = 'select private.invoke_edge_function(''storage-cleanup'')'), '37 3 * * *',
  'the storage cleanup runs daily');

select * from finish();
rollback;
