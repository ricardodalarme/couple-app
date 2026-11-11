package com.ricardodalarme.flutter_bloc_starter.widgets

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import com.ricardodalarme.flutter_bloc_starter.R

class ReparaOwnMediumWidgetProvider : AppWidgetProvider() {
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
            if (payload.dailyIdeaTitle.isNullOrBlank() && payload.slipsCount > 0) {
                ReparaWidgetPayload.renderCard(
                    context = context,
                    appWidgetManager = appWidgetManager,
                    appWidgetId = appWidgetId,
                    label = context.getString(R.string.repara_widget_jar_label),
                    title = context.getString(R.string.repara_widget_jar_saved_count, payload.slipsCount),
                    subtitle = context.getString(R.string.repara_widget_jar_subtitle),
                    deepLink = "repara://jar?homeWidget=1",
                )
            } else {
                ReparaWidgetPayload.renderCard(
                    context = context,
                    appWidgetManager = appWidgetManager,
                    appWidgetId = appWidgetId,
                    label = context.getString(R.string.repara_widget_idea_label),
                    title = payload.dailyIdeaTitle
                        ?: context.getString(R.string.repara_widget_idea_default),
                    subtitle = context.getString(R.string.repara_widget_idea_subtitle),
                    deepLink = "repara://today?homeWidget=1",
                )
            }
        }
    }
}
