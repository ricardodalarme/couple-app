package com.ricardodalarme.flutter_bloc_starter.widgets

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import com.ricardodalarme.flutter_bloc_starter.R

class ReparaOwnSmallWidgetProvider : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
    ) {
        val payload = ReparaWidgetPayload.load(context)
        for (appWidgetId in appWidgetIds) {
            if (payload.renderGuardState(context, appWidgetManager, appWidgetId, requirePaired = false)) {
                continue
            }
            val days = payload.daysUntilNextDate()
            when {
                days != null && !payload.nextDateTitle.isNullOrBlank() -> ReparaWidgetPayload.renderCard(
                    context = context,
                    appWidgetManager = appWidgetManager,
                    appWidgetId = appWidgetId,
                    label = context.getString(R.string.repara_widget_next_date_label),
                    title = context.getString(R.string.repara_widget_days_count, days.toInt()),
                    subtitle = payload.nextDateTitle,
                    deepLink = "repara://dates?homeWidget=1",
                )
                !payload.ritualTitle.isNullOrBlank() -> ReparaWidgetPayload.renderCard(
                    context = context,
                    appWidgetManager = appWidgetManager,
                    appWidgetId = appWidgetId,
                    label = context.getString(R.string.repara_widget_ritual_label),
                    title = payload.ritualTitle,
                    subtitle = payload.ritualSchedule
                        ?: context.getString(R.string.repara_widget_ritual_default_schedule),
                    deepLink = "repara://rituals?homeWidget=1",
                )
                !payload.myMood.isNullOrBlank() -> ReparaWidgetPayload.renderCard(
                    context = context,
                    appWidgetManager = appWidgetManager,
                    appWidgetId = appWidgetId,
                    label = context.getString(R.string.repara_widget_mood_label),
                    title = payload.myMood,
                    subtitle = context.getString(R.string.repara_widget_mood_subtitle),
                    deepLink = "repara://mood?homeWidget=1",
                )
                else -> ReparaWidgetPayload.renderCard(
                    context = context,
                    appWidgetManager = appWidgetManager,
                    appWidgetId = appWidgetId,
                    label = context.getString(R.string.repara_widget_slip_label),
                    title = context.getString(R.string.repara_widget_slip_title),
                    subtitle = context.getString(R.string.repara_widget_slip_subtitle),
                    deepLink = "repara://capture?homeWidget=1",
                )
            }
        }
    }
}
