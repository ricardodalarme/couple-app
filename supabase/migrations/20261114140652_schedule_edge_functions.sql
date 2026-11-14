SET local check_function_bodies = off;

CREATE OR REPLACE FUNCTION private.invoke_edge_function (
  p_name       text,
  p_timeout_ms integer DEFAULT 30000
)
  RETURNS bigint
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
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
end $function$;

SELECT cron.schedule_in_database('push-sender', '* * * * *', 'select private.invoke_edge_function(''push-sender'')', 'postgres', NULL, true);

SELECT cron.schedule_in_database('storage-cleanup', '37 3 * * *', 'select private.invoke_edge_function(''storage-cleanup'')', 'postgres', NULL, true);
