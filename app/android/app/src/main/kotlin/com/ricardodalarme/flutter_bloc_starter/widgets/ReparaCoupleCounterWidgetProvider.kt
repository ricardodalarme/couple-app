package com.ricardodalarme.flutter_bloc_starter.widgets

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import com.ricardodalarme.flutter_bloc_starter.R

class ReparaCoupleCounterWidgetProvider : AppWidgetProvider() {
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
            val days = payload.daysTogether()
            val title = if (days != null) {
                context.getString(R.string.repara_widget_days_count, days.toInt())
            } else {
                context.getString(R.string.repara_widget_counter_unset)
            }
            val subtitle = (if (payload.showNames) payload.partnerName else null)
                ?: context.getString(R.string.repara_widget_counter_default_subtitle)
            ReparaWidgetPayload.renderCard(
                context = context,
                appWidgetManager = appWidgetManager,
                appWidgetId = appWidgetId,
                label = context.getString(R.string.repara_widget_counter_label),
                title = title,
                subtitle = subtitle,
                deepLink = "repara://together?homeWidget=1",
            )
        }
    }
}
