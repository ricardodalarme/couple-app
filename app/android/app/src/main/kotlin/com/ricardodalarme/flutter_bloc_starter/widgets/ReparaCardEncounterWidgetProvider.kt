package com.ricardodalarme.flutter_bloc_starter.widgets

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import com.ricardodalarme.flutter_bloc_starter.R

class ReparaCardEncounterWidgetProvider : AppWidgetProvider() {
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
            if (payload.isPauseActive()) {
                ReparaWidgetPayload.renderCard(
                    context = context,
                    appWidgetManager = appWidgetManager,
                    appWidgetId = appWidgetId,
                    label = context.getString(R.string.repara_widget_card_pause_label),
                    title = context.getString(R.string.repara_widget_card_pause_title),
                    subtitle = context.getString(R.string.repara_widget_card_pause_subtitle),
                    deepLink = "repara://pause?homeWidget=1",
                )
            } else {
                val cardTitle = when (payload.cardState) {
                    "ready" -> context.getString(R.string.repara_widget_card_ready_title)
                    "sent" -> context.getString(R.string.repara_widget_card_sent_title)
                    else -> context.getString(R.string.repara_widget_card_default_title)
                }
                val days = payload.daysUntilNextDate()
                val subtitle = if (days != null) {
                    val dateTitle = payload.nextDateTitle
                        ?: context.getString(R.string.repara_widget_card_next_date_default)
                    context.getString(
                        R.string.repara_widget_card_encounter_subtitle,
                        days.toInt(),
                        dateTitle,
                    )
                } else if (payload.cardState == "ready") {
                    context.getString(R.string.repara_widget_card_ready_subtitle)
                } else {
                    context.getString(R.string.repara_widget_card_preparing_subtitle)
                }
                val deepLink = if (payload.cardState == "ready") {
                    "repara://card?homeWidget=1"
                } else if (days != null) {
                    "repara://dates?homeWidget=1"
                } else {
                    "repara://card?homeWidget=1"
                }
                ReparaWidgetPayload.renderCard(
                    context = context,
                    appWidgetManager = appWidgetManager,
                    appWidgetId = appWidgetId,
                    label = context.getString(R.string.repara_widget_card_weekly_label),
                    title = cardTitle,
                    subtitle = subtitle,
                    deepLink = deepLink,
                )
            }
        }
    }
}
