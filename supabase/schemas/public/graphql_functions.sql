-- Descriptions for the public functions, shown in the GraphQL schema. Functions that only read are queries; the rest are mutations.

-- Pairing and profile
comment on function public.ensure_profile() is e'@graphql({"description": "Creates the caller''s profile and settings if they are missing, and returns the profile."})';
comment on function public.my_profile() is e'@graphql({"description": "The caller''s profile."})';
comment on function public.my_settings() is e'@graphql({"description": "The caller''s private settings."})';
comment on function public.my_couple() is e'@graphql({"description": "The couple the caller is in now, or null when they are on their own."})';
comment on function public.my_partner() is e'@graphql({"description": "The caller''s current partner, or null when they are on their own."})';
comment on function public.partner_time_zone() is e'@graphql({"description": "The partner''s time zone, or null when unpaired."})';
comment on function public.create_invite() is e'@graphql({"description": "Creates an invite. The plain code is returned once and never stored."})';
comment on function public.accept_invite(text) is e'@graphql({"description": "Pairs the caller with whoever created the invite. Returns null when the code is invalid, expired, cancelled or either side is already paired."})';
comment on function public.cancel_invite(uuid) is e'@graphql({"description": "Cancels an unused invite the caller created."})';
comment on function public.unpair() is e'@graphql({"description": "Ends the couple for both people. Each person keeps what is private to them; shared rows stop being reachable."})';
comment on function public.resolve_shared_items(boolean) is e'@graphql({"description": "After unpairing: keep what the caller created in the shared space as private (keep = true) or delete it."})';
comment on function public.my_notification_settings() is e'@graphql({"description": "The caller''s notification settings."})';

-- Home and content
comment on function public.today() is e'@graphql({"description": "Everything the Today screen needs in one call."})';
comment on function public.widget() is e'@graphql({"description": "Everything the home-screen widget shows."})';
comment on function public.daily_content(text) is e'@graphql({"description": "The editorial item of this kind picked for today. The same pick for both partners."})';
comment on function public.on_this_day() is e'@graphql({"description": "The caller''s memories and slips from this calendar day in earlier years."})';
comment on function public.my_plus() is e'@graphql({"description": "Whether the caller has Plus and how much of the free plan they used this month."})';
comment on function public.my_year(integer) is e'@graphql({"description": "A year in review for the caller."})';
comment on function public.chat_messages_left() is e'@graphql({"description": "How many mascot messages the caller can still send this period."})';

-- Slips and cards
comment on function public.save_slip(uuid, text, text, text, text, text[], boolean, date, text, timestamptz) is e'@graphql({"description": "Creates or edits a slip. Editing an existing slip keeps working at the free-plan limit."})';
comment on function public.set_slip_details(uuid, text, text, boolean) is e'@graphql({"description": "Sets the category, work area or jar flag of a slip. Arguments left out keep their value."})';
comment on function public.archive_slip(uuid, boolean) is e'@graphql({"description": "Archives a slip, or restores it when archived is false."})';
comment on function public.delete_slip(uuid) is e'@graphql({"description": "Deletes a slip. Unsent cards drop it; sent cards keep their frozen copy."})';
comment on function public.draw_from_jar() is e'@graphql({"description": "One random slip the caller put in the jar, or null when it is empty."})';
comment on function public.sunday_card() is e'@graphql({"description": "This week''s card for the caller in any status, or null."})';
comment on function public.prepare_card() is e'@graphql({"description": "Builds this week''s draft card on demand. Null when the week has no eligible slips."})';
comment on function public.update_card_draft(uuid, uuid[], text) is e'@graphql({"description": "Replaces the items of a draft card with exactly these slips, in this order, and optionally sets the note."})';
comment on function public.hold_card(uuid) is e'@graphql({"description": "Holds a draft card back instead of sending it."})';
comment on function public.send_card(uuid) is e'@graphql({"description": "Sends a card to the current partner. With no partner the card travels only by guest link."})';
comment on function public.send_slip_now(uuid, text) is e'@graphql({"description": "Sends one slip right away as a single card."})';
comment on function public.delete_card(uuid) is e'@graphql({"description": "Removes a card the caller wrote, for both sides."})';
comment on function public.mark_card_read(uuid) is e'@graphql({"description": "Records that the recipient opened a card."})';
comment on function public.react_to_card(uuid, text, text) is e'@graphql({"description": "Sets the recipient''s reaction and reply to a card."})';
comment on function public.create_guest_link(uuid) is e'@graphql({"description": "Creates a link that lets someone without an account read one card. The token is returned once and never stored."})';
comment on function public.revoke_guest_link(uuid) is e'@graphql({"description": "Revokes a guest link the caller created."})';

-- Couple flows
comment on function public.start_pause(timestamptz, text) is e'@graphql({"description": "Starts a pause with a promise to return within 24 hours. The partner sees only the message and the return time."})';
comment on function public.end_pause() is e'@graphql({"description": "Ends the caller''s own pause. Returns false when there was none."})';
comment on function public.active_pause() is e'@graphql({"description": "The pause that matters to the caller right now: their own, or their partner''s."})';
comment on function public.send_signal(text, text, text) is e'@graphql({"description": "Sends a one-tap signal to the partner. Limited per day."})';
comment on function public.respond_to_signal(uuid, text) is e'@graphql({"description": "Marks a received signal as seen and optionally answers it. Answers are never counted or scored."})';
comment on function public.send_partner_message(text, text, text, boolean) is e'@graphql({"description": "Sends a note, drawing, voice message or pack to the partner. Limited per day."})';
comment on function public.mark_partner_message(uuid, boolean) is e'@graphql({"description": "Marks a received message as seen, and optionally hearted."})';
comment on function public.delete_partner_message(uuid) is e'@graphql({"description": "Takes back a message the caller sent."})';
comment on function public.partner_answered(text) is e'@graphql({"description": "Whether the partner answered the couple question. A yes or no only, never the answer."})';
comment on function public.invite_to_game(text, text[]) is e'@graphql({"description": "Invites the partner to a game. Only one session per game can be open at a time."})';
comment on function public.update_game(uuid, text, text) is e'@graphql({"description": "Moves a game session along: action is join, cancel or finish. Finishing needs both people to have answered every item."})';
comment on function public.answer_game(uuid, integer, text) is e'@graphql({"description": "Saves the caller''s answer to one item of an active game."})';
comment on function public.set_touch_topics(boolean) is e'@graphql({"description": "Switches touch topics on or off for both partners."})';
comment on function public.current_temperature() is e'@graphql({"description": "How the relationship feels right now, per the caller''s latest check. A fight level counts for 24 hours."})';
comment on function public.partner_mood_today() is e'@graphql({"description": "The mood the partner shared today, or null."})';
comment on function public.agree(uuid, boolean) is e'@graphql({"description": "Adds or removes the caller''s own agreement to an agreement. Nobody can agree for the other."})';
comment on function public.decision_result(uuid) is e'@graphql({"description": "The options of a decision in combined order, available only once both partners have ranked every option."})';

-- Devices, account, support
comment on function public.register_device(text, text, text) is e'@graphql({"description": "Registers or refreshes a device for push notifications. platform is ios or android."})';
comment on function public.unregister_device(text) is e'@graphql({"description": "Removes a device by its push token."})';
comment on function public.revoke_device(uuid) is e'@graphql({"description": "Removes one of the caller''s devices."})';
comment on function public.request_account_deletion() is e'@graphql({"description": "Starts account deletion with a grace period, and ends the pairing right away."})';
comment on function public.cancel_account_deletion() is e'@graphql({"description": "Cancels a pending account deletion."})';
comment on function public.create_support_request(text, text, text, text) is e'@graphql({"description": "Sends a message to support. Returns true when it was received."})';
