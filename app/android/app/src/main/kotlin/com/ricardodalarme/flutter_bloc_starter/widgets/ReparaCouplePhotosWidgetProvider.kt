package com.ricardodalarme.flutter_bloc_starter.widgets

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context

class ReparaCouplePhotosWidgetProvider : AppWidgetProvider() {
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
                        imagePath = null,
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

                !payload.hasPlus -> {
                    ReparaWidgetPayload.renderCard(
                        context = context,
                        appWidgetManager = appWidgetManager,
                        appWidgetId = appWidgetId,
                        label = "MEMÓRIA",
                        title = "Disponível no Plus",
                        subtitle = "",
                        deepLink = "repara://memories?homeWidget=1",
                    )
                }

                else -> {
                    val days = payload.daysTogether()
                    val fallbackTitle = if (days != null) "$days dias juntos" else "Um momento nosso"
                    val hasCachedPhoto = !payload.cachedPhotoPath.isNullOrBlank()
                    ReparaWidgetPayload.renderCard(
                        context = context,
                        appWidgetManager = appWidgetManager,
                        appWidgetId = appWidgetId,
                        label = "MEMÓRIA",
                        title = if (hasCachedPhoto) "Memória salva neste aparelho" else fallbackTitle,
                        subtitle = if (hasCachedPhoto) "" else "Sem foto selecionada",
                        deepLink = "repara://memories?homeWidget=1",
                        imagePath = payload.cachedPhotoPath,
                    )
                }
            }
        }
    }
}
