package com.ricardodalarme.flutter_bloc_starter.widgets

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context

class ReparaCoupleCounterWidgetProvider : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
    ) {
        val payload = ReparaWidgetPayload.load(context)
        for (appWidgetId in appWidgetIds) {
            when {
                !payload.isSignedIn -> {
                    ReparaWidgetPayload.renderCard(
                        context = context,
                        appWidgetManager = appWidgetManager,
                        appWidgetId = appWidgetId,
                        label = "REPARA",
                        title = "Toque para entrar",
                        subtitle = "",
                        deepLink = "repara://sign-in?homeWidget=1",
                    )
                }

                payload.discreet -> {
                    ReparaWidgetPayload.renderCard(
                        context = context,
                        appWidgetManager = appWidgetManager,
                        appWidgetId = appWidgetId,
                        label = "LEMBRETE",
                        title = "Texto neutro",
                        subtitle = "",
                        deepLink = "repara://settings/discreet?homeWidget=1",
                    )
                }

                !payload.isPaired -> {
                    ReparaWidgetPayload.renderCard(
                        context = context,
                        appWidgetManager = appWidgetManager,
                        appWidgetId = appWidgetId,
                        label = "JUNTOS",
                        title = "Convide para ver aqui",
                        subtitle = "Convidar",
                        deepLink = "repara://together?homeWidget=1",
                    )
                }

                else -> {
                    val days = payload.daysTogether()
                    val title = if (days != null) "$days dias" else "Começando agora"
                    val subtitle = (if (payload.showNames) payload.partnerName else null) ?: "Tempo juntos"
                    ReparaWidgetPayload.renderCard(
                        context = context,
                        appWidgetManager = appWidgetManager,
                        appWidgetId = appWidgetId,
                        label = "JUNTOS HÁ",
                        title = title,
                        subtitle = subtitle,
                        deepLink = "repara://together?homeWidget=1",
                    )
                }
            }
        }
    }
}
