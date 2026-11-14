SET local check_function_bodies = off;

COMMENT ON FUNCTION "public"."accept_invite"(text) IS '@graphql({"description": "Pairs the caller with whoever created the invite. Returns null when the code is invalid, expired, cancelled or either side is already paired."})';

COMMENT ON FUNCTION "public"."active_pause"() IS '@graphql({"description": "The pause that matters to the caller right now: their own, or their partner''s."})';

COMMENT ON FUNCTION "public"."agree"(uuid, boolean) IS '@graphql({"description": "Adds or removes the caller''s own agreement to an agreement. Nobody can agree for the other."})';

COMMENT ON FUNCTION "public"."answer_game"(uuid, integer, text) IS '@graphql({"description": "Saves the caller''s answer to one item of an active game."})';

COMMENT ON FUNCTION "public"."archive_slip"(uuid, boolean) IS '@graphql({"description": "Archives a slip, or restores it when archived is false."})';

COMMENT ON FUNCTION "public"."cancel_account_deletion"() IS '@graphql({"description": "Cancels a pending account deletion."})';

COMMENT ON FUNCTION "public"."cancel_invite"(uuid) IS '@graphql({"description": "Cancels an unused invite the caller created."})';

COMMENT ON FUNCTION "public"."chat_messages_left"() IS '@graphql({"description": "How many mascot messages the caller can still send this period."})';

COMMENT ON FUNCTION "public"."create_guest_link"(uuid) IS '@graphql({"description": "Creates a link that lets someone without an account read one card. The token is returned once and never stored."})';

COMMENT ON FUNCTION "public"."create_invite"() IS '@graphql({"description": "Creates an invite. The plain code is returned once and never stored."})';

COMMENT ON FUNCTION "public"."create_support_request"(text, text, text, text) IS '@graphql({"description": "Sends a message to support. Returns true when it was received."})';

COMMENT ON FUNCTION "public"."current_temperature"() IS '@graphql({"description": "How the relationship feels right now, per the caller''s latest check. A fight level counts for 24 hours."})';

COMMENT ON FUNCTION "public"."daily_content"(text) IS '@graphql({"description": "The editorial item of this kind picked for today. The same pick for both partners."})';

COMMENT ON FUNCTION "public"."decision_result"(uuid) IS '@graphql({"description": "The options of a decision in combined order, available only once both partners have ranked every option."})';

COMMENT ON FUNCTION "public"."delete_card"(uuid) IS '@graphql({"description": "Removes a card the caller wrote, for both sides."})';

COMMENT ON FUNCTION "public"."delete_partner_message"(uuid) IS '@graphql({"description": "Takes back a message the caller sent."})';

COMMENT ON FUNCTION "public"."delete_slip"(uuid) IS '@graphql({"description": "Deletes a slip. Unsent cards drop it; sent cards keep their frozen copy."})';

COMMENT ON FUNCTION "public"."draw_from_jar"() IS '@graphql({"description": "One random slip the caller put in the jar, or null when it is empty."})';

COMMENT ON FUNCTION "public"."end_pause"() IS '@graphql({"description": "Ends the caller''s own pause. Returns false when there was none."})';

COMMENT ON FUNCTION "public"."ensure_profile"() IS '@graphql({"description": "Creates the caller''s profile and settings if they are missing, and returns the profile."})';

COMMENT ON FUNCTION "public"."hold_card"(uuid) IS '@graphql({"description": "Holds a draft card back instead of sending it."})';

COMMENT ON FUNCTION "public"."invite_to_game"(text, text[]) IS '@graphql({"description": "Invites the partner to a game. Only one session per game can be open at a time."})';

COMMENT ON FUNCTION "public"."mark_card_read"(uuid) IS '@graphql({"description": "Records that the recipient opened a card."})';

COMMENT ON FUNCTION "public"."mark_partner_message"(uuid, boolean) IS '@graphql({"description": "Marks a received message as seen, and optionally hearted."})';

COMMENT ON FUNCTION "public"."my_couple"() IS '@graphql({"description": "The couple the caller is in now, or null when they are on their own."})';

COMMENT ON FUNCTION "public"."my_notification_settings"() IS '@graphql({"description": "The caller''s notification settings."})';

COMMENT ON FUNCTION "public"."my_partner"() IS '@graphql({"description": "The caller''s current partner, or null when they are on their own."})';

COMMENT ON FUNCTION "public"."my_plus"() IS '@graphql({"description": "Whether the caller has Plus and how much of the free plan they used this month."})';

COMMENT ON FUNCTION "public"."my_profile"() IS '@graphql({"description": "The caller''s profile."})';

COMMENT ON FUNCTION "public"."my_settings"() IS '@graphql({"description": "The caller''s private settings."})';

COMMENT ON FUNCTION "public"."my_year"(integer) IS '@graphql({"description": "A year in review for the caller."})';

COMMENT ON FUNCTION "public"."on_this_day"() IS '@graphql({"description": "The caller''s memories and slips from this calendar day in earlier years."})';

COMMENT ON FUNCTION "public"."partner_answered"(text) IS '@graphql({"description": "Whether the partner answered the couple question. A yes or no only, never the answer."})';

COMMENT ON FUNCTION "public"."partner_mood_today"() IS '@graphql({"description": "The mood the partner shared today, or null."})';

COMMENT ON FUNCTION "public"."partner_time_zone"() IS '@graphql({"description": "The partner''s time zone, or null when unpaired."})';

COMMENT ON FUNCTION "public"."prepare_card"() IS '@graphql({"description": "Builds this week''s draft card on demand. Null when the week has no eligible slips."})';

COMMENT ON FUNCTION "public"."react_to_card"(uuid, text, text) IS '@graphql({"description": "Sets the recipient''s reaction and reply to a card."})';

COMMENT ON FUNCTION "public"."register_device"(text, text, text) IS '@graphql({"description": "Registers or refreshes a device for push notifications. platform is ios or android."})';

COMMENT ON FUNCTION "public"."request_account_deletion"() IS '@graphql({"description": "Starts account deletion with a grace period, and ends the pairing right away."})';

COMMENT ON FUNCTION "public"."resolve_shared_items"(boolean) IS '@graphql({"description": "After unpairing: keep what the caller created in the shared space as private (keep = true) or delete it."})';

COMMENT ON FUNCTION "public"."respond_to_signal"(uuid, text) IS '@graphql({"description": "Marks a received signal as seen and optionally answers it. Answers are never counted or scored."})';

COMMENT ON FUNCTION "public"."revoke_device"(uuid) IS '@graphql({"description": "Removes one of the caller''s devices."})';

COMMENT ON FUNCTION "public"."revoke_guest_link"(uuid) IS '@graphql({"description": "Revokes a guest link the caller created."})';

COMMENT ON FUNCTION "public"."save_slip"(uuid, text, text, text, text, text[], boolean, date, text, timestamp with time zone) IS '@graphql({"description": "Creates or edits a slip. Editing an existing slip keeps working at the free-plan limit."})';

COMMENT ON FUNCTION "public"."send_card"(uuid) IS '@graphql({"description": "Sends a card to the current partner. With no partner the card travels only by guest link."})';

COMMENT ON FUNCTION "public"."send_partner_message"(text, text, text, boolean) IS '@graphql({"description": "Sends a note, drawing, voice message or pack to the partner. Limited per day."})';

COMMENT ON FUNCTION "public"."send_signal"(text, text, text) IS '@graphql({"description": "Sends a one-tap signal to the partner. Limited per day."})';

COMMENT ON FUNCTION "public"."send_slip_now"(uuid, text) IS '@graphql({"description": "Sends one slip right away as a single card."})';

COMMENT ON FUNCTION "public"."set_slip_details"(uuid, text, text, boolean) IS '@graphql({"description": "Sets the category, work area or jar flag of a slip. Arguments left out keep their value."})';

COMMENT ON FUNCTION "public"."set_touch_topics"(boolean) IS '@graphql({"description": "Switches touch topics on or off for both partners."})';

COMMENT ON FUNCTION "public"."start_pause"(timestamp with time zone, text) IS '@graphql({"description": "Starts a pause with a promise to return within 24 hours. The partner sees only the message and the return time."})';

COMMENT ON FUNCTION "public"."sunday_card"() IS '@graphql({"description": "This week''s card for the caller in any status, or null."})';

COMMENT ON FUNCTION "public"."today"() IS '@graphql({"description": "Everything the Today screen needs in one call."})';

COMMENT ON FUNCTION "public"."unpair"() IS '@graphql({"description": "Ends the couple for both people. Each person keeps what is private to them; shared rows stop being reachable."})';

COMMENT ON FUNCTION "public"."unregister_device"(text) IS '@graphql({"description": "Removes a device by its push token."})';

COMMENT ON FUNCTION "public"."update_card_draft"(uuid, uuid[], text) IS '@graphql({"description": "Replaces the items of a draft card with exactly these slips, in this order, and optionally sets the note."})';

COMMENT ON FUNCTION "public"."update_game"(uuid, text, text) IS '@graphql({"description": "Moves a game session along: action is join, cancel or finish. Finishing needs both people to have answered every item."})';

COMMENT ON FUNCTION "public"."widget"() IS '@graphql({"description": "Everything the home-screen widget shows."})';
