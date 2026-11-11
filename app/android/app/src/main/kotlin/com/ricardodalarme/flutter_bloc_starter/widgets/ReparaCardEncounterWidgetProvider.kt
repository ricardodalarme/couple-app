package com.ricardodalarme.flutter_bloc_starter.widgets

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context

class ReparaCardEncounterWidgetProvider : AppWidgetProvider() {
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

                payload.isPauseActive() -> {
                    ReparaWidgetPayload.renderCard(
                        context = context,
                        appWidgetManager = appWidgetManager,
                        appWidgetId = appWidgetId,
                        label = "CARTÃO E ENCONTRO",
                        title = "Pausa em andamento",
                        subtitle = "Toque quando estiver pronto",
                        deepLink = "repara://pause?homeWidget=1",
                    )
                }

                else -> {
                    val cardTitle = when (payload.cardState) {
                        "ready" -> "Chegou um cartão"
                        "sent" -> "Cartão enviado"
                        else -> "Cartão de domingo"
                    }
                    val days = payload.daysUntilNextDate()
                    val subtitle = if (days != null) {
                        val dateTitle = payload.nextDateTitle ?: "Próximo encontro"
                        "$days dias · $dateTitle"
                    } else if (payload.cardState == "ready") {
                        "Toque para abrir"
                    } else {
                        "Em preparação"
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
                        label = "CARTÃO DA SEMANA",
                        title = cardTitle,
                        subtitle = subtitle,
                        deepLink = deepLink,
                    )
                }
            }
        }
    }
}
