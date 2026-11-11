package com.ricardodalarme.flutter_bloc_starter.widgets

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context

class ReparaPartnerNoteWidgetProvider : AppWidgetProvider() {
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

                payload.allowPartnerNotes && !payload.partnerNote.isNullOrBlank() -> {
                    val label = if (payload.showNames && !payload.partnerName.isNullOrBlank()) {
                        "DE ${payload.partnerName.uppercase()}"
                    } else {
                        "RECADO DO PAR"
                    }
                    ReparaWidgetPayload.renderCard(
                        context = context,
                        appWidgetManager = appWidgetManager,
                        appWidgetId = appWidgetId,
                        label = label,
                        title = payload.partnerNote,
                        subtitle = "Responder com um coração",
                        deepLink = "repara://today?homeWidget=1",
                    )
                }

                else -> {
                    val label = if (payload.showNames && !payload.partnerName.isNullOrBlank()) {
                        "DE ${payload.partnerName.uppercase()}"
                    } else {
                        "RECADO DO PAR"
                    }
                    ReparaWidgetPayload.renderCard(
                        context = context,
                        appWidgetManager = appWidgetManager,
                        appWidgetId = appWidgetId,
                        label = label,
                        title = "Sem recado novo no momento",
                        subtitle = "",
                        deepLink = "repara://today?homeWidget=1",
                    )
                }
            }
        }
    }
}
