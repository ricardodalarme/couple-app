package com.ricardodalarme.flutter_bloc_starter.widgets

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context

class ReparaOwnSmallWidgetProvider : AppWidgetProvider() {
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
                payload.daysUntilNextDate() != null && payload.nextDateTitle != null -> {
                    val days = payload.daysUntilNextDate() ?: 0L
                    ReparaWidgetPayload.renderCard(
                        context = context,
                        appWidgetManager = appWidgetManager,
                        appWidgetId = appWidgetId,
                        label = "PRÓXIMA DATA",
                        title = "$days dias",
                        subtitle = payload.nextDateTitle,
                        deepLink = "repara://dates?homeWidget=1",
                    )
                }
                else -> ReparaWidgetPayload.renderCard(
                    context = context,
                    appWidgetManager = appWidgetManager,
                    appWidgetId = appWidgetId,
                    label = "ANOTAR SLIP",
                    title = "+ Slip",
                    subtitle = "Toque para anotar",
                    deepLink = "repara://capture?homeWidget=1",
                )
            }
        }
    }
}
