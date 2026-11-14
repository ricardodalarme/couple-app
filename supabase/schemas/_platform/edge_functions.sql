-- Platform: invoking Edge Functions from pg_cron.

-- Calls /functions/v1/<name> with the project secret key in the apikey header. The URL and the key come from Vault
-- (secrets `project_url` and `secret_key`); until both exist this does nothing, so the jobs are safe before setup.
-- Returns the pg_net request id, or null when nothing was sent.
create function private.invoke_edge_function(p_name text, p_timeout_ms integer default 30000) returns bigint
language plpgsql security definer set search_path = '' as $$
declare v_url text; v_key text;
begin
  select decrypted_secret into v_url from vault.decrypted_secrets where name = 'project_url';
  select decrypted_secret into v_key from vault.decrypted_secrets where name = 'secret_key';
  if v_url is null or v_key is null then
    return null;
  end if;
  return net.http_post(
    url := rtrim(v_url, '/') || '/functions/v1/' || p_name,
    headers := jsonb_build_object('Content-Type', 'application/json', 'apikey', v_key),
    body := '{}'::jsonb,
    timeout_milliseconds := p_timeout_ms);
end $$;
