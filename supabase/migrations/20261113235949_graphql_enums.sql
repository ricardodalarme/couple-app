SET local check_function_bodies = off;

CREATE TYPE "public"."avatar_kind" AS ENUM (
  'photo',
  'illustration',
  'initials'
);

CREATE TYPE "public"."card_channel" AS ENUM (
  'link',
  'app'
);

CREATE TYPE "public"."card_kind" AS ENUM (
  'weekly',
  'single'
);

CREATE TYPE "public"."conversation_guide" AS ENUM (
  'free',
  'transition',
  'money',
  'apology',
  'difficult'
);

CREATE TYPE "public"."cycle_day_kind" AS ENUM (
  'heavy',
  'light',
  'note'
);

CREATE TYPE "public"."date_idea_status" AS ENUM (
  'saved',
  'planned',
  'done'
);

CREATE TYPE "public"."date_precision" AS ENUM (
  'day',
  'month',
  'year'
);

CREATE TYPE "public"."device_platform" AS ENUM (
  'ios',
  'android'
);

CREATE TYPE "public"."game_kind" AS ENUM (
  'me_or_you',
  'how_well',
  'twenty_questions',
  'never_have_we',
  'compliments',
  'mission'
);

CREATE TYPE "public"."game_outcome" AS ENUM (
  'great',
  'ok',
  'did_not_happen'
);

CREATE TYPE "public"."game_status" AS ENUM (
  'invited',
  'active',
  'finished',
  'cancelled'
);

CREATE TYPE "public"."gift_budget" AS ENUM (
  'free',
  'low',
  'medium',
  'high'
);

CREATE TYPE "public"."gift_idea_kind" AS ENUM (
  'idea',
  'wish'
);

CREATE TYPE "public"."gift_idea_status" AS ENUM (
  'idea',
  'planned',
  'given'
);

CREATE TYPE "public"."heavy_day_sharing" AS ENUM (
  'off',
  'ask',
  'always'
);

CREATE TYPE "public"."idea_response" AS ENUM (
  'will_do',
  'done',
  'skip',
  'saved'
);

CREATE TYPE "public"."important_date_kind" AS ENUM (
  'relationship',
  'birthday',
  'first',
  'holiday',
  'trip',
  'reunion',
  'custom'
);

CREATE TYPE "public"."important_date_origin" AS ENUM (
  'manual',
  'auto',
  'chat'
);

CREATE TYPE "public"."learned_item_status" AS ENUM (
  'pending',
  'confirmed',
  'rejected'
);

CREATE TYPE "public"."learned_item_target" AS ENUM (
  'partner_fact',
  'date',
  'memory',
  'commitment'
);

CREATE TYPE "public"."lesson_status" AS ENUM (
  'done',
  'saved'
);

CREATE TYPE "public"."list_item_status" AS ENUM (
  'dream',
  'planned',
  'done'
);

CREATE TYPE "public"."list_kind" AS ENUM (
  'travel',
  'restaurants',
  'movies',
  'custom'
);

CREATE TYPE "public"."memory_origin" AS ENUM (
  'manual',
  'slip',
  'card',
  'question',
  'game',
  'mission',
  'share',
  'chat',
  'first'
);

CREATE TYPE "public"."mood_need" AS ENUM (
  'listen',
  'opinion',
  'hug',
  'space'
);

CREATE TYPE "public"."mood_share" AS ENUM (
  'none',
  'mood',
  'mood_need'
);

CREATE TYPE "public"."mood" AS ENUM (
  'happy',
  'tired',
  'sad',
  'stressed',
  'loving',
  'playful'
);

CREATE TYPE "public"."partner_fact_category" AS ENUM (
  'likes',
  'dislikes',
  'sizes',
  'health',
  'comfort',
  'people',
  'other'
);

CREATE TYPE "public"."partner_fact_source" AS ENUM (
  'manual',
  'chat',
  'game',
  'learning'
);

CREATE TYPE "public"."partner_message_kind" AS ENUM (
  'note',
  'drawing',
  'voice',
  'pack'
);

CREATE TYPE "public"."quiz_key" AS ENUM (
  'loved',
  'conflict_style'
);

CREATE TYPE "public"."repair_feeling" AS ENUM (
  'calmer',
  'still_tense',
  'need_more_time'
);

CREATE TYPE "public"."repair_learning_kind" AS ENUM (
  'trigger',
  'need',
  'good_fix'
);

CREATE TYPE "public"."repair_path" AS ENUM (
  'pause',
  'quick',
  'soft_start',
  'guided',
  'apology'
);

CREATE TYPE "public"."ritual_cadence" AS ENUM (
  'daily',
  'weekly',
  'biweekly',
  'monthly'
);

CREATE TYPE "public"."signal_kind" AS ENUM (
  'need',
  'miss_us',
  'hug',
  'distance',
  'repair',
  'heavy_day',
  'good_news'
);

CREATE TYPE "public"."signal_response" AS ENUM (
  'here',
  'talk',
  'more_time',
  'will_do',
  'not_now',
  'plan',
  'later',
  'heart'
);

CREATE TYPE "public"."slip_category" AS ENUM (
  'said',
  'did',
  'noticed',
  'helped'
);

CREATE TYPE "public"."story_event_kind" AS ENUM (
  'met',
  'dating',
  'engaged',
  'married',
  'custom'
);

CREATE TYPE "public"."temperature_level" AS ENUM (
  'good',
  'so_so',
  'turbulent',
  'fight'
);

CREATE TYPE "public"."work_area" AS ENUM (
  'planning',
  'dates',
  'kitchen',
  'cleaning',
  'kids',
  'emotional',
  'finances',
  'other'
);

DROP POLICY "game_answers_select_own_or_finished" ON "public"."game_answers";

DROP INDEX "public"."cards_one_weekly_per_week";

DROP INDEX "public"."game_sessions_one_open";

ALTER TABLE "public"."cards"
  DROP CONSTRAINT "cards_kind_check";

ALTER TABLE "public"."conversation_preps"
  DROP CONSTRAINT "conversation_preps_guide_check";

ALTER TABLE "public"."cycle_days"
  DROP CONSTRAINT "cycle_days_kind_check";

ALTER TABLE "public"."devices"
  DROP CONSTRAINT "devices_platform_check";

ALTER TABLE "public"."game_sessions"
  DROP CONSTRAINT "game_sessions_game_check";

ALTER TABLE "public"."game_sessions"
  DROP CONSTRAINT "game_sessions_outcome_check";

ALTER TABLE "public"."game_sessions"
  DROP CONSTRAINT "game_sessions_status_check";

ALTER TABLE "public"."gift_ideas"
  DROP CONSTRAINT "gift_ideas_budget_check";

ALTER TABLE "public"."gift_ideas"
  DROP CONSTRAINT "gift_ideas_kind_check";

ALTER TABLE "public"."gift_ideas"
  DROP CONSTRAINT "gift_ideas_status_check";

ALTER TABLE "public"."idea_responses"
  DROP CONSTRAINT "idea_responses_response_check";

ALTER TABLE "public"."important_dates"
  DROP CONSTRAINT "important_dates_kind_check";

ALTER TABLE "public"."important_dates"
  DROP CONSTRAINT "important_dates_origin_check";

ALTER TABLE "public"."learned_items"
  DROP CONSTRAINT "learned_items_status_check";

ALTER TABLE "public"."learned_items"
  DROP CONSTRAINT "learned_items_target_check";

ALTER TABLE "public"."lesson_progress"
  DROP CONSTRAINT "lesson_progress_status_check";

ALTER TABLE "public"."list_items"
  DROP CONSTRAINT "list_items_status_check";

ALTER TABLE "public"."lists"
  DROP CONSTRAINT "lists_kind_check";

ALTER TABLE "public"."memories"
  DROP CONSTRAINT "memories_date_precision_check";

ALTER TABLE "public"."memories"
  DROP CONSTRAINT "memories_origin_check";

ALTER TABLE "public"."moods"
  DROP CONSTRAINT "moods_mood_check";

ALTER TABLE "public"."moods"
  DROP CONSTRAINT "moods_need_check";

ALTER TABLE "public"."moods"
  DROP CONSTRAINT "moods_share_check";

ALTER TABLE "public"."partner_facts"
  DROP CONSTRAINT "partner_facts_category_check";

ALTER TABLE "public"."partner_facts"
  DROP CONSTRAINT "partner_facts_source_check";

ALTER TABLE "public"."partner_messages"
  DROP CONSTRAINT "partner_messages_kind_check";

ALTER TABLE "public"."profile_settings"
  DROP CONSTRAINT "profile_settings_card_channel_check";

ALTER TABLE "public"."profile_settings"
  DROP CONSTRAINT "profile_settings_heavy_day_sharing_check";

ALTER TABLE "public"."profiles"
  DROP CONSTRAINT "profiles_avatar_kind_check";

ALTER TABLE "public"."quiz_results"
  DROP CONSTRAINT "quiz_results_quiz_key_check";

ALTER TABLE "public"."repair_learnings"
  DROP CONSTRAINT "repair_learnings_kind_check";

ALTER TABLE "public"."repair_sessions"
  DROP CONSTRAINT "repair_sessions_feeling_after_check";

ALTER TABLE "public"."repair_sessions"
  DROP CONSTRAINT "repair_sessions_path_check";

ALTER TABLE "public"."rituals"
  DROP CONSTRAINT "rituals_cadence_check";

ALTER TABLE "public"."saved_date_ideas"
  DROP CONSTRAINT "saved_date_ideas_status_check";

ALTER TABLE "public"."signals"
  DROP CONSTRAINT "signals_kind_check";

ALTER TABLE "public"."signals"
  DROP CONSTRAINT "signals_response_check";

ALTER TABLE "public"."slips"
  DROP CONSTRAINT "slips_category_check";

ALTER TABLE "public"."slips"
  DROP CONSTRAINT "slips_work_area_check";

ALTER TABLE "public"."story_events"
  DROP CONSTRAINT "story_events_date_precision_check";

ALTER TABLE "public"."story_events"
  DROP CONSTRAINT "story_events_kind_check";

ALTER TABLE "public"."temperature_checks"
  DROP CONSTRAINT "temperature_checks_level_check";

DROP FUNCTION "public"."on_this_day"();

DROP VIEW "public"."timeline_items";

DROP FUNCTION "public"."partner_mood_today"();

DROP VIEW "public"."partner_mood";

ALTER TABLE "public"."cards"
  ALTER COLUMN "kind" DROP DEFAULT;

ALTER TABLE "public"."cards"
  ALTER COLUMN "kind" SET DEFAULT 'weekly'::public.card_kind;

ALTER TABLE "public"."conversation_preps"
  ALTER COLUMN "guide" DROP DEFAULT;

ALTER TABLE "public"."conversation_preps"
  ALTER COLUMN "guide" SET DEFAULT 'free'::public.conversation_guide;

ALTER TABLE "public"."cycle_days"
  ALTER COLUMN "kind" DROP DEFAULT;

ALTER TABLE "public"."cycle_days"
  ALTER COLUMN "kind" SET DEFAULT 'heavy'::public.cycle_day_kind;

ALTER TABLE "public"."devices"
  ALTER COLUMN "platform" DROP DEFAULT;

ALTER TABLE "public"."game_sessions"
  ALTER COLUMN "game" DROP DEFAULT;

ALTER TABLE "public"."game_sessions"
  ALTER COLUMN "outcome" DROP DEFAULT;

ALTER TABLE "public"."game_sessions"
  ALTER COLUMN "status" DROP DEFAULT;

ALTER TABLE "public"."game_sessions"
  ALTER COLUMN "status" SET DEFAULT 'invited'::public.game_status;

ALTER TABLE "public"."gift_ideas"
  ALTER COLUMN "budget" DROP DEFAULT;

ALTER TABLE "public"."gift_ideas"
  ALTER COLUMN "kind" DROP DEFAULT;

ALTER TABLE "public"."gift_ideas"
  ALTER COLUMN "kind" SET DEFAULT 'idea'::public.gift_idea_kind;

ALTER TABLE "public"."gift_ideas"
  ALTER COLUMN "status" DROP DEFAULT;

ALTER TABLE "public"."gift_ideas"
  ALTER COLUMN "status" SET DEFAULT 'idea'::public.gift_idea_status;

ALTER TABLE "public"."idea_responses"
  ALTER COLUMN "response" DROP DEFAULT;

ALTER TABLE "public"."important_dates"
  ALTER COLUMN "kind" DROP DEFAULT;

ALTER TABLE "public"."important_dates"
  ALTER COLUMN "kind" SET DEFAULT 'custom'::public.important_date_kind;

ALTER TABLE "public"."important_dates"
  ALTER COLUMN "origin" DROP DEFAULT;

ALTER TABLE "public"."important_dates"
  ALTER COLUMN "origin" SET DEFAULT 'manual'::public.important_date_origin;

ALTER TABLE "public"."learned_items"
  ALTER COLUMN "status" DROP DEFAULT;

ALTER TABLE "public"."learned_items"
  ALTER COLUMN "status" SET DEFAULT 'pending'::public.learned_item_status;

ALTER TABLE "public"."learned_items"
  ALTER COLUMN "target" DROP DEFAULT;

ALTER TABLE "public"."lesson_progress"
  ALTER COLUMN "status" DROP DEFAULT;

ALTER TABLE "public"."lesson_progress"
  ALTER COLUMN "status" SET DEFAULT 'done'::public.lesson_status;

ALTER TABLE "public"."list_items"
  ALTER COLUMN "status" DROP DEFAULT;

ALTER TABLE "public"."list_items"
  ALTER COLUMN "status" SET DEFAULT 'dream'::public.list_item_status;

ALTER TABLE "public"."lists"
  ALTER COLUMN "kind" DROP DEFAULT;

ALTER TABLE "public"."lists"
  ALTER COLUMN "kind" SET DEFAULT 'custom'::public.list_kind;

ALTER TABLE "public"."memories"
  ALTER COLUMN "date_precision" DROP DEFAULT;

ALTER TABLE "public"."memories"
  ALTER COLUMN "date_precision" SET DEFAULT 'day'::public.date_precision;

ALTER TABLE "public"."memories"
  ALTER COLUMN "origin" DROP DEFAULT;

ALTER TABLE "public"."memories"
  ALTER COLUMN "origin" SET DEFAULT 'manual'::public.memory_origin;

ALTER TABLE "public"."moods"
  ALTER COLUMN "mood" DROP DEFAULT;

ALTER TABLE "public"."moods"
  ALTER COLUMN "need" DROP DEFAULT;

ALTER TABLE "public"."moods"
  ALTER COLUMN "share" DROP DEFAULT;

ALTER TABLE "public"."moods"
  ALTER COLUMN "share" SET DEFAULT 'none'::public.mood_share;

ALTER TABLE "public"."partner_facts"
  ALTER COLUMN "category" DROP DEFAULT;

ALTER TABLE "public"."partner_facts"
  ALTER COLUMN "source" DROP DEFAULT;

ALTER TABLE "public"."partner_facts"
  ALTER COLUMN "source" SET DEFAULT 'manual'::public.partner_fact_source;

ALTER TABLE "public"."partner_messages"
  ALTER COLUMN "kind" DROP DEFAULT;

ALTER TABLE "public"."profile_settings"
  ALTER COLUMN "card_channel" DROP DEFAULT;

ALTER TABLE "public"."profile_settings"
  ALTER COLUMN "card_channel" SET DEFAULT 'link'::public.card_channel;

ALTER TABLE "public"."profile_settings"
  ALTER COLUMN "heavy_day_sharing" DROP DEFAULT;

ALTER TABLE "public"."profile_settings"
  ALTER COLUMN "heavy_day_sharing" SET DEFAULT 'off'::public.heavy_day_sharing;

ALTER TABLE "public"."profiles"
  ALTER COLUMN "avatar_kind" DROP DEFAULT;

ALTER TABLE "public"."profiles"
  ALTER COLUMN "avatar_kind" SET DEFAULT 'initials'::public.avatar_kind;

ALTER TABLE "public"."quiz_results"
  ALTER COLUMN "quiz_key" DROP DEFAULT;

ALTER TABLE "public"."repair_learnings"
  ALTER COLUMN "kind" DROP DEFAULT;

ALTER TABLE "public"."repair_sessions"
  ALTER COLUMN "feeling_after" DROP DEFAULT;

ALTER TABLE "public"."repair_sessions"
  ALTER COLUMN "path" DROP DEFAULT;

ALTER TABLE "public"."rituals"
  ALTER COLUMN "cadence" DROP DEFAULT;

ALTER TABLE "public"."rituals"
  ALTER COLUMN "cadence" SET DEFAULT 'weekly'::public.ritual_cadence;

ALTER TABLE "public"."saved_date_ideas"
  ALTER COLUMN "status" DROP DEFAULT;

ALTER TABLE "public"."saved_date_ideas"
  ALTER COLUMN "status" SET DEFAULT 'saved'::public.date_idea_status;

ALTER TABLE "public"."signals"
  ALTER COLUMN "kind" DROP DEFAULT;

ALTER TABLE "public"."signals"
  ALTER COLUMN "response" DROP DEFAULT;

ALTER TABLE "public"."slips"
  ALTER COLUMN "category" DROP DEFAULT;

ALTER TABLE "public"."slips"
  ALTER COLUMN "work_area" DROP DEFAULT;

ALTER TABLE "public"."story_events"
  ALTER COLUMN "date_precision" DROP DEFAULT;

ALTER TABLE "public"."story_events"
  ALTER COLUMN "date_precision" SET DEFAULT 'day'::public.date_precision;

ALTER TABLE "public"."story_events"
  ALTER COLUMN "kind" DROP DEFAULT;

ALTER TABLE "public"."temperature_checks"
  ALTER COLUMN "level" DROP DEFAULT;

ALTER TABLE "public"."profiles"
  ALTER COLUMN "avatar_kind" TYPE public.avatar_kind USING "avatar_kind"::public.avatar_kind;

ALTER TABLE "public"."profiles"
  ALTER COLUMN "avatar_kind" SET DEFAULT 'initials'::public.avatar_kind;

ALTER TABLE "public"."profile_settings"
  ALTER COLUMN "card_channel" TYPE public.card_channel USING "card_channel"::public.card_channel;

ALTER TABLE "public"."profile_settings"
  ALTER COLUMN "card_channel" SET DEFAULT 'link'::public.card_channel;

ALTER TABLE "public"."cards"
  ALTER COLUMN "kind" TYPE public.card_kind USING "kind"::public.card_kind;

ALTER TABLE "public"."cards"
  ALTER COLUMN "kind" SET DEFAULT 'weekly'::public.card_kind;

ALTER TABLE "public"."conversation_preps"
  ALTER COLUMN "guide" TYPE public.conversation_guide USING "guide"::public.conversation_guide;

ALTER TABLE "public"."conversation_preps"
  ALTER COLUMN "guide" SET DEFAULT 'free'::public.conversation_guide;

ALTER TABLE "public"."cycle_days"
  ALTER COLUMN "kind" TYPE public.cycle_day_kind USING "kind"::public.cycle_day_kind;

ALTER TABLE "public"."cycle_days"
  ALTER COLUMN "kind" SET DEFAULT 'heavy'::public.cycle_day_kind;

ALTER TABLE "public"."saved_date_ideas"
  ALTER COLUMN "status" TYPE public.date_idea_status USING "status"::public.date_idea_status;

ALTER TABLE "public"."saved_date_ideas"
  ALTER COLUMN "status" SET DEFAULT 'saved'::public.date_idea_status;

ALTER TABLE "public"."memories"
  ALTER COLUMN "date_precision" TYPE public.date_precision USING "date_precision"::public.date_precision;

ALTER TABLE "public"."story_events"
  ALTER COLUMN "date_precision" TYPE public.date_precision USING "date_precision"::public.date_precision;

ALTER TABLE "public"."memories"
  ALTER COLUMN "date_precision" SET DEFAULT 'day'::public.date_precision;

ALTER TABLE "public"."story_events"
  ALTER COLUMN "date_precision" SET DEFAULT 'day'::public.date_precision;

ALTER TABLE "public"."devices"
  ALTER COLUMN "platform" TYPE public.device_platform USING "platform"::public.device_platform;

ALTER TABLE "public"."game_sessions"
  ALTER COLUMN "game" TYPE public.game_kind USING "game"::public.game_kind;

ALTER TABLE "public"."game_sessions"
  ALTER COLUMN "outcome" TYPE public.game_outcome USING "outcome"::public.game_outcome;

ALTER TABLE "public"."game_sessions"
  ALTER COLUMN "status" TYPE public.game_status USING "status"::public.game_status;

ALTER TABLE "public"."game_sessions"
  ALTER COLUMN "status" SET DEFAULT 'invited'::public.game_status;

ALTER TABLE "public"."gift_ideas"
  ALTER COLUMN "budget" TYPE public.gift_budget USING "budget"::public.gift_budget;

ALTER TABLE "public"."gift_ideas"
  ALTER COLUMN "kind" TYPE public.gift_idea_kind USING "kind"::public.gift_idea_kind;

ALTER TABLE "public"."gift_ideas"
  ALTER COLUMN "kind" SET DEFAULT 'idea'::public.gift_idea_kind;

ALTER TABLE "public"."gift_ideas"
  ALTER COLUMN "status" TYPE public.gift_idea_status USING "status"::public.gift_idea_status;

ALTER TABLE "public"."gift_ideas"
  ALTER COLUMN "status" SET DEFAULT 'idea'::public.gift_idea_status;

ALTER TABLE "public"."profile_settings"
  ALTER COLUMN "heavy_day_sharing" TYPE public.heavy_day_sharing USING "heavy_day_sharing"::public.heavy_day_sharing;

ALTER TABLE "public"."profile_settings"
  ALTER COLUMN "heavy_day_sharing" SET DEFAULT 'off'::public.heavy_day_sharing;

ALTER TABLE "public"."idea_responses"
  ALTER COLUMN "response" TYPE public.idea_response USING "response"::public.idea_response;

ALTER TABLE "public"."important_dates"
  ALTER COLUMN "kind" TYPE public.important_date_kind USING "kind"::public.important_date_kind;

ALTER TABLE "public"."important_dates"
  ALTER COLUMN "kind" SET DEFAULT 'custom'::public.important_date_kind;

ALTER TABLE "public"."important_dates"
  ALTER COLUMN "origin" TYPE public.important_date_origin USING "origin"::public.important_date_origin;

ALTER TABLE "public"."important_dates"
  ALTER COLUMN "origin" SET DEFAULT 'manual'::public.important_date_origin;

ALTER TABLE "public"."learned_items"
  ALTER COLUMN "status" TYPE public.learned_item_status USING "status"::public.learned_item_status;

ALTER TABLE "public"."learned_items"
  ALTER COLUMN "status" SET DEFAULT 'pending'::public.learned_item_status;

ALTER TABLE "public"."learned_items"
  ALTER COLUMN "target" TYPE public.learned_item_target USING "target"::public.learned_item_target;

ALTER TABLE "public"."lesson_progress"
  ALTER COLUMN "status" TYPE public.lesson_status USING "status"::public.lesson_status;

ALTER TABLE "public"."lesson_progress"
  ALTER COLUMN "status" SET DEFAULT 'done'::public.lesson_status;

ALTER TABLE "public"."list_items"
  ALTER COLUMN "status" TYPE public.list_item_status USING "status"::public.list_item_status;

ALTER TABLE "public"."list_items"
  ALTER COLUMN "status" SET DEFAULT 'dream'::public.list_item_status;

ALTER TABLE "public"."lists"
  ALTER COLUMN "kind" TYPE public.list_kind USING "kind"::public.list_kind;

ALTER TABLE "public"."lists"
  ALTER COLUMN "kind" SET DEFAULT 'custom'::public.list_kind;

ALTER TABLE "public"."memories"
  ALTER COLUMN "origin" TYPE public.memory_origin USING "origin"::public.memory_origin;

ALTER TABLE "public"."memories"
  ALTER COLUMN "origin" SET DEFAULT 'manual'::public.memory_origin;

ALTER TABLE "public"."moods"
  ALTER COLUMN "need" TYPE public.mood_need USING "need"::public.mood_need;

ALTER TABLE "public"."moods"
  ALTER COLUMN "share" TYPE public.mood_share USING "share"::public.mood_share;

ALTER TABLE "public"."moods"
  ALTER COLUMN "share" SET DEFAULT 'none'::public.mood_share;

ALTER TABLE "public"."moods"
  ALTER COLUMN "mood" TYPE public.mood USING "mood"::public.mood;

ALTER TABLE "public"."partner_facts"
  ALTER COLUMN "category" TYPE public.partner_fact_category USING "category"::public.partner_fact_category;

ALTER TABLE "public"."partner_facts"
  ALTER COLUMN "source" TYPE public.partner_fact_source USING "source"::public.partner_fact_source;

ALTER TABLE "public"."partner_facts"
  ALTER COLUMN "source" SET DEFAULT 'manual'::public.partner_fact_source;

ALTER TABLE "public"."partner_messages"
  ALTER COLUMN "kind" TYPE public.partner_message_kind USING "kind"::public.partner_message_kind;

ALTER TABLE "public"."quiz_results"
  ALTER COLUMN "quiz_key" TYPE public.quiz_key USING "quiz_key"::public.quiz_key;

ALTER TABLE "public"."repair_sessions"
  ALTER COLUMN "feeling_after" TYPE public.repair_feeling USING "feeling_after"::public.repair_feeling;

ALTER TABLE "public"."repair_learnings"
  ALTER COLUMN "kind" TYPE public.repair_learning_kind USING "kind"::public.repair_learning_kind;

ALTER TABLE "public"."repair_sessions"
  ALTER COLUMN "path" TYPE public.repair_path USING "path"::public.repair_path;

ALTER TABLE "public"."rituals"
  ALTER COLUMN "cadence" TYPE public.ritual_cadence USING "cadence"::public.ritual_cadence;

ALTER TABLE "public"."rituals"
  ALTER COLUMN "cadence" SET DEFAULT 'weekly'::public.ritual_cadence;

ALTER TABLE "public"."signals"
  ALTER COLUMN "kind" TYPE public.signal_kind USING "kind"::public.signal_kind;

ALTER TABLE "public"."signals"
  ALTER COLUMN "response" TYPE public.signal_response USING "response"::public.signal_response;

ALTER TABLE "public"."slips"
  ALTER COLUMN "category" TYPE public.slip_category USING "category"::public.slip_category;

ALTER TABLE "public"."story_events"
  ALTER COLUMN "kind" TYPE public.story_event_kind USING "kind"::public.story_event_kind;

ALTER TABLE "public"."temperature_checks"
  ALTER COLUMN "level" TYPE public.temperature_level USING "level"::public.temperature_level;

ALTER TABLE "public"."slips"
  ALTER COLUMN "work_area" TYPE public.work_area USING "work_area"::public.work_area;

CREATE OR REPLACE FUNCTION public.invite_to_game (
  game       text,
  item_slugs text[] DEFAULT '{}'::text[]
)
  RETURNS public.game_sessions
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
declare v_uid uuid := private.require_user(); v_couple uuid := private.current_couple_id(); v_row public.game_sessions;
begin
  if v_couple is null then raise exception 'NOT_PAIRED' using errcode = 'P0001'; end if;
  if exists (select 1 from public.game_sessions g
             where g.couple_id = v_couple and g.game = invite_to_game.game::public.game_kind
               and g.status in ('invited', 'active')) then
    raise exception 'GAME_ALREADY_OPEN' using errcode = 'P0001';
  end if;
  insert into public.game_sessions (couple_id, game, invited_by, item_slugs)
  values (v_couple, invite_to_game.game::public.game_kind, v_uid, coalesce(invite_to_game.item_slugs, '{}')) returning * into v_row;
  perform private.enqueue_notification(private.partner_id(), 'game_invite', v_row.id, 'game_invite:' || v_row.id);
  perform private.signal('couple:' || v_couple, 'game_changed');
  return v_row;
end $function$;

CREATE OR REPLACE FUNCTION public.register_device (
  token    text,
  platform text,
  label    text DEFAULT NULL::text
)
  RETURNS boolean
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
declare
  v_uid uuid := private.require_user();
  v_device uuid;
begin
  if platform not in ('ios', 'android') then
    raise exception 'INVALID_PLATFORM' using errcode = 'P0001';
  end if;
  if not private.hit_rate_limit('register_device:' || v_uid, 20, interval '1 hour') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  insert into public.devices as d (profile_id, token, platform, label)
  values (v_uid, register_device.token, register_device.platform::public.device_platform, register_device.label)
  on conflict on constraint devices_token_key do update
    set platform = excluded.platform, label = excluded.label, failure_count = 0, last_seen_at = now()
    where d.profile_id = v_uid
  returning d.id into v_device;
  return v_device is not null;
end $function$;

CREATE OR REPLACE FUNCTION public.respond_to_signal (
  signal_id uuid,
  response  text DEFAULT NULL::text
)
  RETURNS public.signals
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
declare v_uid uuid := private.require_user(); v_row public.signals;
begin
  update public.signals s
  set seen_at = coalesce(s.seen_at, now()),
      response = coalesce(respond_to_signal.response::public.signal_response, s.response),
      responded_at = case when respond_to_signal.response is null then s.responded_at else now() end
  where s.id = signal_id and s.recipient_id = v_uid returning s.* into v_row;
  if v_row.id is null then raise exception 'NOT_FOUND' using errcode = 'P0001'; end if;
  if response is not null then perform private.signal('user:' || v_row.sender_id, 'signal_response'); end if;
  return v_row;
end $function$;

CREATE OR REPLACE FUNCTION public.send_partner_message (
  kind       text,
  body       text    DEFAULT NULL::text,
  media_path text    DEFAULT NULL::text,
  for_widget boolean DEFAULT false
)
  RETURNS public.partner_messages
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
declare v_uid uuid := private.require_user(); v_partner uuid := private.partner_id(); v_row public.partner_messages;
begin
  if v_partner is null then raise exception 'NOT_PAIRED' using errcode = 'P0001'; end if;
  if not private.hit_rate_limit('partner_message:' || v_uid, 30, interval '1 day') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  -- The widget shows a note only if the receiver allowed it; otherwise it is delivered in the app only.
  insert into public.partner_messages (sender_id, recipient_id, kind, body, media_path, for_widget)
  values (v_uid, v_partner, send_partner_message.kind::public.partner_message_kind, nullif(btrim(send_partner_message.body), ''), send_partner_message.media_path,
          coalesce(send_partner_message.for_widget, false)
            and coalesce((select widget_allow_partner_notes from public.profile_settings where profile_id = v_partner), false))
  returning * into v_row;
  perform private.enqueue_notification(v_partner, 'partner_message', v_row.id, 'partner_message:' || v_row.id);
  perform private.signal('user:' || v_partner, 'partner_message');
  return v_row;
end $function$;

CREATE OR REPLACE FUNCTION public.send_signal (
  kind  text,
  value text DEFAULT NULL::text,
  body  text DEFAULT NULL::text
)
  RETURNS public.signals
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
declare v_uid uuid := private.require_user(); v_partner uuid := private.partner_id(); v_row public.signals;
begin
  if v_partner is null then raise exception 'NOT_PAIRED' using errcode = 'P0001'; end if;
  if not private.hit_rate_limit('signal:' || v_uid, 30, interval '1 day') then
    raise exception 'RATE_LIMITED' using errcode = 'P0001';
  end if;
  insert into public.signals (sender_id, recipient_id, kind, value, body)
  values (v_uid, v_partner, send_signal.kind::public.signal_kind, send_signal.value, nullif(btrim(send_signal.body), '')) returning * into v_row;
  perform private.enqueue_notification(v_partner, 'signal_' || v_row.kind, v_row.id, 'signal:' || v_row.id);
  perform private.signal('user:' || v_partner, 'signal');
  return v_row;
end $function$;

CREATE OR REPLACE FUNCTION public.set_slip_details (
  id        uuid,
  category  text    DEFAULT NULL::text,
  work_area text    DEFAULT NULL::text,
  in_jar    boolean DEFAULT NULL::boolean
)
  RETURNS public.slips
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
declare v_uid uuid := private.require_user(); v_row public.slips;
begin
  update public.slips s
  set category = coalesce(set_slip_details.category::public.slip_category, s.category),
      work_area = coalesce(set_slip_details.work_area::public.work_area, s.work_area),
      in_jar = coalesce(set_slip_details.in_jar, s.in_jar)
  where s.id = set_slip_details.id and s.author_id = v_uid and s.deleted_at is null
  returning s.* into v_row;
  if v_row.id is null then raise exception 'SLIP_NOT_FOUND' using errcode = 'P0001'; end if;
  return v_row;
end $function$;

CREATE OR REPLACE FUNCTION public.update_game (
  session_id uuid,
  action     text,
  outcome    text DEFAULT NULL::text
)
  RETURNS public.game_sessions
  LANGUAGE plpgsql
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
declare v_uid uuid := private.require_user(); v_row public.game_sessions; v_n integer;
begin
  select * into v_row from public.game_sessions g
  where g.id = session_id and g.couple_id = private.current_couple_id() for update;
  if not found then raise exception 'NOT_FOUND' using errcode = 'P0001'; end if;
  if action = 'join' and v_row.status = 'invited' and v_row.invited_by <> v_uid then
    update public.game_sessions g set status = 'active' where g.id = v_row.id returning g.* into v_row;
  elsif action = 'cancel' and v_row.status in ('invited', 'active') then
    update public.game_sessions g set status = 'cancelled' where g.id = v_row.id returning g.* into v_row;
  elsif action = 'finish' and v_row.status = 'active' then
    v_n := coalesce(array_length(v_row.item_slugs, 1), 0);
    if v_n > 0 then
      if (select count(*) from public.couple_members m
          where m.couple_id = v_row.couple_id and m.left_at is null) <> 2
         or exists (
           select 1
           from generate_series(0, v_n - 1) as gs(i)
           cross join (select m.profile_id from public.couple_members m
                       where m.couple_id = v_row.couple_id and m.left_at is null) as member(profile_id)
           where not exists (
             select 1 from public.game_answers a
             where a.session_id = v_row.id and a.author_id = member.profile_id and a.idx = gs.i
           )
         )
      then
        raise exception 'GAME_NOT_COMPLETE' using errcode = 'P0001';
      end if;
    end if;
    update public.game_sessions g set status = 'finished', finished_at = now(), outcome = update_game.outcome::public.game_outcome
    where g.id = v_row.id returning g.* into v_row;
  else
    raise exception 'INVALID_GAME_ACTION' using errcode = 'P0001';
  end if;
  perform private.signal('couple:' || v_row.couple_id, 'game_changed');
  return v_row;
end $function$;

CREATE VIEW "public"."partner_mood" WITH (security_invoker=true) AS  SELECT id,
    day,
    mood,
    need
   FROM public.moods m
  WHERE false;

CREATE OR REPLACE FUNCTION public.partner_mood_today()
  RETURNS public.partner_mood
  LANGUAGE sql
  STABLE
  SECURITY DEFINER
  SET search_path TO ''
  AS $function$
  select m.id, m.day, m.mood, case when m.share = 'mood_need' then m.need end
  from public.moods m join public.profile_settings s on s.profile_id = m.author_id
  where m.author_id = private.partner_id() and m.share <> 'none' and m.day = (now() at time zone s.time_zone)::date;
$function$;

REVOKE ALL ON FUNCTION "public"."partner_mood_today"() FROM PUBLIC, "anon";

REVOKE ALL ON TABLE "public"."partner_mood" FROM "anon";

CREATE VIEW "public"."timeline_items" WITH (security_invoker=true) AS  SELECT m.id,
    'memory'::text AS kind,
    m.title,
    m.happened_on AS day,
    m.author_id,
    (m.couple_id IS NOT NULL) AS shared,
    m.photo_path
   FROM public.memories m
UNION ALL
 SELECT s.id,
    'slip'::text AS kind,
    s.body AS title,
    (s.created_at)::date AS day,
    s.author_id,
    false AS shared,
    s.photo_path
   FROM public.slips s
  WHERE ((s.deleted_at IS NULL) AND (s.archived_at IS NULL))
UNION ALL
 SELECT c.id,
        CASE
            WHEN (c.author_id = auth.uid()) THEN 'card_sent'::text
            ELSE 'card_received'::text
        END AS kind,
    c.note AS title,
    (c.sent_at)::date AS day,
    c.author_id,
    true AS shared,
    NULL::text AS photo_path
   FROM public.cards c
  WHERE (c.status = 'sent'::public.card_status)
UNION ALL
 SELECT e.id,
    'story'::text AS kind,
    COALESCE(e.title, (e.kind)::text) AS title,
    e.happened_on AS day,
    e.author_id,
    (e.couple_id IS NOT NULL) AS shared,
    NULL::text AS photo_path
   FROM public.story_events e
UNION ALL
 SELECT d.id,
    'first'::text AS kind,
    d.title,
    make_date((d.year)::integer, (d.month)::integer, LEAST((d.day)::integer, 28)) AS day,
    d.author_id,
    (d.couple_id IS NOT NULL) AS shared,
    NULL::text AS photo_path
   FROM public.important_dates d
  WHERE ((d.kind = 'first'::public.important_date_kind) AND (d.year IS NOT NULL) AND (NOT d.hidden));

CREATE OR REPLACE FUNCTION public.on_this_day()
  RETURNS SETOF public.timeline_items
  LANGUAGE sql
  STABLE
  SET search_path TO ''
  AS $function$
  select t.* from public.timeline_items t
  where t.author_id = auth.uid() and t.kind in ('memory', 'slip', 'story', 'first')
    and to_char(t.day, 'MM-DD') = to_char(now(), 'MM-DD') and t.day < (now())::date - 300
  order by t.day desc;
$function$;

REVOKE ALL ON FUNCTION "public"."on_this_day"() FROM PUBLIC, "anon";

REVOKE ALL ON TABLE "public"."timeline_items" FROM "anon";

CREATE UNIQUE INDEX cards_one_weekly_per_week ON public.cards USING btree (author_id, week_start)
  WHERE (kind = 'weekly'::public.card_kind);

CREATE UNIQUE INDEX game_sessions_one_open ON public.game_sessions USING btree (couple_id, game)
  WHERE (status = ANY (ARRAY['invited'::public.game_status, 'active'::public.game_status]));

CREATE POLICY "game_answers_select_own_or_finished" ON "public"."game_answers"
  FOR SELECT
  TO "authenticated"
  USING (((author_id = ( SELECT auth.uid() AS uid)) OR (EXISTS ( SELECT 1
   FROM public.game_sessions g
  WHERE ((g.id = game_answers.session_id) AND (g.status = 'finished'::public.game_status) AND (g.couple_id = ( SELECT private.current_couple_id() AS current_couple_id)))))));

COMMENT ON VIEW "public"."partner_mood" IS '@graphql({"primary_key_columns": ["id"], "description": "The mood the partner chose to share today. need is present only when they shared it."})';

COMMENT ON VIEW "public"."timeline_items" IS '@graphql({"primary_key_columns": ["id"], "totalCount": {"enabled": true}, "description": "Memories, story events and important dates in one chronological feed."})';

GRANT EXECUTE ON FUNCTION "public"."on_this_day"() TO "authenticated";

REVOKE ALL ON FUNCTION "public"."on_this_day"() FROM "postgres";

GRANT EXECUTE ON FUNCTION "public"."on_this_day"() TO "postgres";

GRANT EXECUTE ON FUNCTION "public"."on_this_day"() TO "service_role";

GRANT EXECUTE ON FUNCTION "public"."partner_mood_today"() TO "authenticated";

REVOKE ALL ON FUNCTION "public"."partner_mood_today"() FROM "postgres";

GRANT EXECUTE ON FUNCTION "public"."partner_mood_today"() TO "postgres";

GRANT EXECUTE ON FUNCTION "public"."partner_mood_today"() TO "service_role";

REVOKE ALL ON TABLE "public"."partner_mood" FROM "authenticated";

GRANT SELECT ON TABLE "public"."partner_mood" TO "authenticated";

REVOKE ALL ON TABLE "public"."partner_mood" FROM "postgres";

GRANT DELETE, INSERT, MAINTAIN, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON TABLE "public"."partner_mood" TO "postgres";

GRANT DELETE, INSERT, MAINTAIN, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON TABLE "public"."partner_mood" TO "service_role";

REVOKE ALL ON TABLE "public"."timeline_items" FROM "authenticated";

GRANT SELECT ON TABLE "public"."timeline_items" TO "authenticated";

REVOKE ALL ON TABLE "public"."timeline_items" FROM "postgres";

GRANT DELETE, INSERT, MAINTAIN, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON TABLE "public"."timeline_items" TO "postgres";

GRANT DELETE, INSERT, MAINTAIN, REFERENCES, SELECT, TRIGGER, TRUNCATE, UPDATE ON TABLE "public"."timeline_items" TO "service_role";
