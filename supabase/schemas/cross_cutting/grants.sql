-- Cross-cutting: execute grants that cover functions of several domains.

grant execute on function public.current_temperature(), public.partner_mood_today(), public.agree(uuid, boolean),
  public.decision_result(uuid) to authenticated;

grant execute on function public.start_pause(timestamptz, text), public.end_pause(), public.active_pause(),
  public.send_signal(text, text, text), public.respond_to_signal(uuid, text),
  public.send_partner_message(text, text, text, boolean), public.mark_partner_message(uuid, boolean),
  public.partner_answered(text), public.invite_to_game(text, text[]), public.update_game(uuid, text, text),
  public.answer_game(uuid, integer, text) to authenticated;
