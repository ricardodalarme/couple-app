package com.ricardodalarme.flutter_bloc_starter.widgets

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.Intent
import android.graphics.BitmapFactory
import android.net.Uri
import android.view.View
import android.widget.RemoteViews
import com.ricardodalarme.flutter_bloc_starter.MainActivity
import com.ricardodalarme.flutter_bloc_starter.R
import org.json.JSONObject
import java.io.File
import java.time.Instant
import java.time.LocalDate
import java.time.temporal.ChronoUnit

data class ReparaWidgetPayload(
    val isSignedIn: Boolean,
    val discreet: Boolean,
    val isPaired: Boolean,
    val hasPlus: Boolean,
    val showNames: Boolean,
    val allowPartnerNotes: Boolean,
    val togetherSince: String?,
    val partnerName: String?,
    val nextDateTitle: String?,
    val nextDateOn: String?,
    val unopenedCards: Int,
    val cardState: String,
    val pauseReturnAt: String?,
    val partnerNote: String?,
    val dailyIdeaTitle: String?,
    val ritualTitle: String?,
    val ritualSchedule: String?,
    val cachedPhotoPath: String?,
) {
    fun daysTogether(today: LocalDate = LocalDate.now()): Long? {
        if (!isSignedIn || discreet || togetherSince.isNullOrBlank()) return null
        return try {
            val start = LocalDate.parse(togetherSince.take(10))
            val days = ChronoUnit.DAYS.between(start, today)
            if (days < 0L) 0L else days
        } catch (_: Exception) {
            null
        }
    }

    fun daysUntilNextDate(today: LocalDate = LocalDate.now()): Long? {
        if (!isSignedIn || discreet || nextDateOn.isNullOrBlank()) return null
        return try {
            val target = LocalDate.parse(nextDateOn.take(10))
            val days = ChronoUnit.DAYS.between(today, target)
            if (days >= 0L) days else null
        } catch (_: Exception) {
            null
        }
    }

    fun isPauseActive(now: Instant = Instant.now()): Boolean {
        if (pauseReturnAt.isNullOrBlank()) return false
        return try {
            Instant.parse(pauseReturnAt).isAfter(now)
        } catch (_: Exception) {
            false
        }
    }

    companion object {
        private const val PREFS_NAME = "HomeWidgetPreferences"
        private const val PAYLOAD_KEY = "repara_widget_payload"

        fun load(context: Context): ReparaWidgetPayload {
            val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            val raw = prefs.getString(PAYLOAD_KEY, null) ?: return signedOut()
            return try {
                val json = JSONObject(raw)
                ReparaWidgetPayload(
                    isSignedIn = json.optBoolean("isSignedIn", false),
                    discreet = json.optBoolean("discreet", false),
                    isPaired = json.optBoolean("isPaired", false),
                    hasPlus = json.optBoolean("hasPlus", false),
                    showNames = json.optBoolean("showNames", true),
                    allowPartnerNotes = json.optBoolean("allowPartnerNotes", true),
                    togetherSince = json.optNullableString("togetherSince"),
                    partnerName = json.optNullableString("partnerName"),
                    nextDateTitle = json.optNullableString("nextDateTitle"),
                    nextDateOn = json.optNullableString("nextDateOn"),
                    unopenedCards = json.optInt("unopenedCards", 0),
                    cardState = json.optString("cardState", "none"),
                    pauseReturnAt = json.optNullableString("pauseReturnAt"),
                    partnerNote = json.optNullableString("partnerNote"),
                    dailyIdeaTitle = json.optNullableString("dailyIdeaTitle"),
                    ritualTitle = json.optNullableString("ritualTitle"),
                    ritualSchedule = json.optNullableString("ritualSchedule"),
                    cachedPhotoPath = json.optNullableString("cachedPhotoPath"),
                )
            } catch (_: Exception) {
                signedOut()
            }
        }

        fun signedOut() = ReparaWidgetPayload(
            isSignedIn = false,
            discreet = false,
            isPaired = false,
            hasPlus = false,
            showNames = false,
            allowPartnerNotes = false,
            togetherSince = null,
            partnerName = null,
            nextDateTitle = null,
            nextDateOn = null,
            unopenedCards = 0,
            cardState = "none",
            pauseReturnAt = null,
            partnerNote = null,
            dailyIdeaTitle = null,
            ritualTitle = null,
            ritualSchedule = null,
            cachedPhotoPath = null,
        )

        fun renderCard(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int,
            label: String,
            title: String,
            subtitle: String,
            deepLink: String,
            imagePath: String? = null,
        ) {
            val views = RemoteViews(context.packageName, R.layout.repara_widget_card)
            views.setTextViewText(R.id.repara_widget_label, label)
            views.setTextViewText(R.id.repara_widget_title, title)
            views.setTextViewText(R.id.repara_widget_subtitle, subtitle)

            val bitmap = if (!imagePath.isNullOrBlank() && File(imagePath).exists()) {
                BitmapFactory.decodeFile(imagePath)
            } else {
                null
            }
            if (bitmap != null) {
                views.setImageViewBitmap(R.id.repara_widget_image, bitmap)
                views.setViewVisibility(R.id.repara_widget_image, View.VISIBLE)
            } else {
                views.setViewVisibility(R.id.repara_widget_image, View.GONE)
            }

            val intent = Intent(Intent.ACTION_VIEW, Uri.parse(deepLink), context, MainActivity::class.java).apply {
                flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
            }
            val pendingIntent = PendingIntent.getActivity(
                context,
                appWidgetId,
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
            )
            views.setOnClickPendingIntent(R.id.repara_widget_root, pendingIntent)
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }

        private fun JSONObject.optNullableString(key: String): String? {
            if (isNull(key)) return null
            val v = optString(key, "").trim()
            return v.ifEmpty { null }
        }
    }
}
