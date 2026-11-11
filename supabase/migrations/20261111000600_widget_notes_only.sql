-- A drawing has no text, so letting it win the newest-row lookup would blank the widget note.
-- Only text notes are eligible until the widget can render media.

create or replace function public.widget() returns public.widget_state
language plpgsql stable security definer set search_path = '' as $$
declare v_uid uuid := private.require_user(); t public.today_state := public.today(); r public.widget_state; s public.profile_settings;
begin
  select * into s from public.profile_settings where profile_id = v_uid;
  r.profile_id := v_uid;
  r.discreet := coalesce((select discreet from public.notification_settings where profile_id = v_uid), false) and not s.widget_in_discreet;
  r.is_paired := t.is_paired;
  r.together_since := t.together_since;
  r.unopened_cards := t.unopened_cards;
  r.pause_return_at := case when t.pause_is_mine then t.pause_return_at end;
  r.next_date_on := t.next_date_on;
  if not r.discreet then
    r.next_date_title := t.next_date_title;
    r.partner_name := case when s.widget_show_names then t.partner_name end;
    if s.widget_allow_partner_notes then
      select m.body, m.media_path, m.created_at into r.partner_note, r.partner_note_media, r.partner_note_at
      from public.partner_messages m
      where m.recipient_id = v_uid and m.for_widget and m.kind = 'note'
      order by m.created_at desc limit 1;
    end if;
    r.partner_mood := (select mood from public.partner_mood_today());
  end if;
  return r;
end $$;
grant execute on function public.widget() to authenticated;
