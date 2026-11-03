SET local check_function_bodies = off;

CREATE TABLE "public"."device_tokens" (
  "id"             uuid                     NOT NULL DEFAULT gen_random_uuid(),
  "user_id"        uuid                     NOT NULL,
  "token"          text                     NOT NULL,
  "platform"       text                     NOT NULL,
  "app_version"    text,
  "last_seen_at"   timestamp with time zone NOT NULL DEFAULT now(),
  "invalidated_at" timestamp with time zone,
  "created_at"     timestamp with time zone NOT NULL DEFAULT now(),
  "updated_at"     timestamp with time zone NOT NULL DEFAULT now(),
  CONSTRAINT "device_tokens_app_version_check" CHECK (((app_version IS NULL) OR (char_length(app_version) <= 60))),
  CONSTRAINT "device_tokens_pkey" PRIMARY KEY (id),
  CONSTRAINT "device_tokens_platform_check" CHECK ((platform = ANY (ARRAY['android'::text, 'ios'::text, 'web'::text]))),
  CONSTRAINT "device_tokens_token_check" CHECK (((char_length(token) >= 8) AND (char_length(token) <= 512))),
  CONSTRAINT "device_tokens_token_key" UNIQUE (token)
);

ALTER TABLE "public"."device_tokens"
  ENABLE ROW LEVEL SECURITY;

REVOKE ALL ON TABLE "public"."device_tokens" FROM "anon", "authenticated";

CREATE OR REPLACE FUNCTION public.register_device_token (
  p_token       text,
  p_platform    text,
  p_app_version text DEFAULT NULL::text
)
  RETURNS public.device_tokens
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
declare
  v_uid uuid := auth.uid();
  v_platform text := lower(coalesce(p_platform, ''));
  v_row public.device_tokens;
begin
  if v_uid is null then
    raise exception 'not_authenticated' using errcode = 'P0001';
  end if;
  if p_token is null or char_length(p_token) < 8 or char_length(p_token) > 512 then
    raise exception 'invalid_token' using errcode = 'P0001';
  end if;
  if v_platform not in ('android', 'ios', 'web') then
    raise exception 'invalid_platform' using errcode = 'P0001';
  end if;

  insert into public.device_tokens (user_id, token, platform, app_version)
  values (v_uid, p_token, v_platform, p_app_version)
  on conflict (token) do update
    set user_id = excluded.user_id,
        platform = excluded.platform,
        app_version = excluded.app_version,
        last_seen_at = now(),
        invalidated_at = null,
        updated_at = now()
  returning * into v_row;

  return v_row;
end;
$function$;

REVOKE ALL ON FUNCTION "public"."register_device_token"(text, text, text) FROM PUBLIC, "anon";

CREATE OR REPLACE FUNCTION public.unregister_device_token (
  p_token text
)
  RETURNS public.device_tokens
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
declare
  v_uid uuid := auth.uid();
  v_row public.device_tokens;
begin
  if v_uid is null then
    raise exception 'not_authenticated' using errcode = 'P0001';
  end if;

  update public.device_tokens
  set invalidated_at = now(),
      updated_at = now()
  where user_id = v_uid
    and token = p_token
    and invalidated_at is null
  returning * into v_row;

  return v_row;
end;
$function$;

REVOKE ALL ON FUNCTION "public"."unregister_device_token"(text) FROM PUBLIC, "anon";

ALTER TABLE "public"."device_tokens"
  ADD CONSTRAINT "device_tokens_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;

CREATE INDEX device_tokens_seen_idx ON public.device_tokens USING btree (last_seen_at);

CREATE INDEX device_tokens_user_idx ON public.device_tokens USING btree (user_id)
  WHERE (invalidated_at IS NULL);

GRANT EXECUTE ON FUNCTION "public"."register_device_token"(text, text, text) TO "authenticated";

REVOKE ALL ON FUNCTION "public"."register_device_token"(text, text, text) FROM "postgres";

GRANT EXECUTE ON FUNCTION "public"."register_device_token"(text, text, text) TO "postgres";

GRANT EXECUTE ON FUNCTION "public"."register_device_token"(text, text, text) TO "service_role";

GRANT EXECUTE ON FUNCTION "public"."unregister_device_token"(text) TO "authenticated";

REVOKE ALL ON FUNCTION "public"."unregister_device_token"(text) FROM "postgres";

GRANT EXECUTE ON FUNCTION "public"."unregister_device_token"(text) TO "postgres";

GRANT EXECUTE ON FUNCTION "public"."unregister_device_token"(text) TO "service_role";

REVOKE ALL ON TABLE "public"."device_tokens" FROM "postgres";

GRANT DELETE, INSERT, MAINTAIN, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON TABLE "public"."device_tokens" TO "postgres";

GRANT DELETE, INSERT, MAINTAIN, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON TABLE "public"."device_tokens" TO "service_role";
