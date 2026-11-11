package com.ricardodalarme.flutter_bloc_starter.widgets

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import com.ricardodalarme.flutter_bloc_starter.R

class ReparaPartnerNoteWidgetProvider : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
    ) {
        val payload = ReparaWidgetPayload.load(context)
        for (appWidgetId in appWidgetIds) {
            if (payload.renderGuardState(context, appWidgetManager, appWidgetId, requirePaired = true)) {
                continue
            }
            val label = if (payload.showNames && !payload.partnerName.isNullOrBlank()) {
                context.getString(R.string.repara_widget_note_from_named, payload.partnerName.uppercase())
            } else {
                context.getString(R.string.repara_widget_note_from_default)
            }
            if (payload.allowPartnerNotes && !payload.partnerNote.isNullOrBlank()) {
                ReparaWidgetPayload.renderCard(
                    context = context,
                    appWidgetManager = appWidgetManager,
                    appWidgetId = appWidgetId,
                    label = label,
                    title = payload.partnerNote,
                    subtitle = context.getString(R.string.repara_widget_note_reply_hint),
                    deepLink = "repara://today?homeWidget=1",
                )
            } else {
                ReparaWidgetPayload.renderCard(
                    context = context,
                    appWidgetManager = appWidgetManager,
                    appWidgetId = appWidgetId,
                    label = label,
                    title = context.getString(R.string.repara_widget_note_empty),
                    subtitle = "",
                    deepLink = "repara://today?homeWidget=1",
                )
            }
        }
    }
}
