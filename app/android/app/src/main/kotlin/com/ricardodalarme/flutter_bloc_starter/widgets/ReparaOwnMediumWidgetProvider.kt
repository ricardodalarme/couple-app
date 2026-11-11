package com.ricardodalarme.flutter_bloc_starter.widgets

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context

class ReparaOwnMediumWidgetProvider : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
    ) {
        val payload = ReparaWidgetPayload.load(context)
        for (appWidgetId in appWidgetIds) {
            when {
                !payload.isSignedIn -> ReparaWidgetPayload.renderCard(
                    context = context,
                    appWidgetManager = appWidgetManager,
                    appWidgetId = appWidgetId,
                    label = "REPARA",
                    title = "Toque para entrar",
                    subtitle = "Sua conta não está conectada",
                    deepLink = "repara://sign-in?homeWidget=1",
                )
                payload.discreet -> ReparaWidgetPayload.renderCard(
                    context = context,
                    appWidgetManager = appWidgetManager,
                    appWidgetId = appWidgetId,
                    label = "LEMBRETE",
                    title = "Texto neutro",
                    subtitle = "Toque para abrir",
                    deepLink = "repara://settings/discreet?homeWidget=1",
                )
                else -> ReparaWidgetPayload.renderCard(
                    context = context,
                    appWidgetManager = appWidgetManager,
                    appWidgetId = appWidgetId,
                    label = "IDEIA DO DIA",
                    title = payload.dailyIdeaTitle ?: "Deixe um bilhete hoje",
                    subtitle = "Toque para ver · Privado no seu aparelho",
                    deepLink = "repara://today?homeWidget=1",
                )
            }
        }
    }
}
