package com.ricardodalarme.flutter_bloc_starter.widgets

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import com.ricardodalarme.flutter_bloc_starter.R

class ReparaCouplePhotosWidgetProvider : AppWidgetProvider() {
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
            if (!payload.hasPlus) {
                ReparaWidgetPayload.renderCard(
                    context = context,
                    appWidgetManager = appWidgetManager,
                    appWidgetId = appWidgetId,
                    label = context.getString(R.string.repara_widget_photo_label),
                    title = context.getString(R.string.repara_widget_photo_plus_only),
                    subtitle = "",
                    deepLink = "repara://memories?homeWidget=1",
                )
            } else {
                val days = payload.daysTogether()
                val fallbackTitle = if (days != null) {
                    context.getString(R.string.repara_widget_photo_days_together, days.toInt())
                } else {
                    context.getString(R.string.repara_widget_photo_fallback_title)
                }
                val hasCachedPhoto = !payload.cachedPhotoPath.isNullOrBlank()
                ReparaWidgetPayload.renderCard(
                    context = context,
                    appWidgetManager = appWidgetManager,
                    appWidgetId = appWidgetId,
                    label = context.getString(R.string.repara_widget_photo_label),
                    title = if (hasCachedPhoto) {
                        context.getString(R.string.repara_widget_photo_cached_title)
                    } else {
                        fallbackTitle
                    },
                    subtitle = if (hasCachedPhoto) {
                        ""
                    } else {
                        context.getString(R.string.repara_widget_photo_no_photo)
                    },
                    deepLink = "repara://memories?homeWidget=1",
                    imagePath = payload.cachedPhotoPath,
                )
            }
        }
    }
}
