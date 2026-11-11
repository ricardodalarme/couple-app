package com.ricardodalarme.flutter_bloc_starter.widgets

import android.appwidget.AppWidgetManager
import android.content.Context
import android.graphics.BitmapFactory
import android.net.Uri
import android.view.View
import android.widget.RemoteViews
import com.ricardodalarme.flutter_bloc_starter.MainActivity
import com.ricardodalarme.flutter_bloc_starter.R
import es.antonborri.home_widget.HomeWidgetLaunchIntent
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
    val myMood: String?,
    val dailyIdeaTitle: String?,
    val ritualTitle: String?,
    val ritualSchedule: String?,
    val slipsCount: Int,
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
        if (!isSignedIn || !isPaired || pauseReturnAt.isNullOrBlank()) return false
        return try {
            Instant.parse(pauseReturnAt).isAfter(now)
        } catch (_: Exception) {
            false
        }
    }

    fun renderGuardState(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int,
        requirePaired: Boolean,
    ): Boolean {
        if (!isSignedIn) {
            renderCard(
                context = context,
                appWidgetManager = appWidgetManager,
                appWidgetId = appWidgetId,
                label = context.getString(R.string.repara_widget_signed_out_label),
                title = context.getString(R.string.repara_widget_signed_out_title),
                subtitle = "",
                deepLink = "repara://sign-in?homeWidget=1",
            )
            return true
        }
        if (discreet) {
            renderCard(
                context = context,
                appWidgetManager = appWidgetManager,
                appWidgetId = appWidgetId,
                label = context.getString(R.string.repara_widget_discreet_label),
                title = context.getString(R.string.repara_widget_discreet_title),
                subtitle = "",
                deepLink = "repara://settings/discreet?homeWidget=1",
                imagePath = null,
            )
            return true
        }
        if (requirePaired && !isPaired) {
            renderCard(
                context = context,
                appWidgetManager = appWidgetManager,
                appWidgetId = appWidgetId,
                label = context.getString(R.string.repara_widget_unpaired_label),
                title = context.getString(R.string.repara_widget_unpaired_title),
                subtitle = context.getString(R.string.repara_widget_unpaired_action),
                deepLink = "repara://invite?homeWidget=1",
            )
            return true
        }
        return false
    }

    companion object {
        private const val PREFS_NAME = "HomeWidgetPreferences"
        private const val PAYLOAD_KEY = "repara_widget_payload"
        private const val CACHED_PHOTO_KEY = "repara_widget_photo_path"

        fun load(context: Context): ReparaWidgetPayload {
            val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            val raw = prefs.getString(PAYLOAD_KEY, null) ?: return signedOut()
            return try {
                val json = JSONObject(raw)
                val isSignedIn = json.optBoolean("isSignedIn", false)
                val discreet = json.optBoolean("discreet", false)
                val isPaired = json.optBoolean("isPaired", false)
                val hasPlus = json.optBoolean("hasPlus", false)
                val directPhotoPath = prefs.getString(CACHED_PHOTO_KEY, null)?.trim()?.ifEmpty { null }
                val resolvedPhotoPath = if (isSignedIn && !discreet && isPaired && hasPlus) {
                    json.optNullableString("cachedPhotoPath") ?: directPhotoPath
                } else {
                    null
                }
                ReparaWidgetPayload(
                    isSignedIn = isSignedIn,
                    discreet = discreet,
                    isPaired = isPaired,
                    hasPlus = hasPlus,
                    showNames = json.optBoolean("showNames", false),
                    allowPartnerNotes = json.optBoolean("allowPartnerNotes", false),
                    togetherSince = json.optNullableString("togetherSince"),
                    partnerName = json.optNullableString("partnerName"),
                    nextDateTitle = json.optNullableString("nextDateTitle"),
                    nextDateOn = json.optNullableString("nextDateOn"),
                    unopenedCards = json.optInt("unopenedCards", 0),
                    cardState = json.optString("cardState", "none"),
                    pauseReturnAt = json.optNullableString("pauseReturnAt"),
                    partnerNote = json.optNullableString("partnerNote"),
                    myMood = json.optNullableString("myMood"),
                    dailyIdeaTitle = json.optNullableString("dailyIdeaTitle"),
                    ritualTitle = json.optNullableString("ritualTitle"),
                    ritualSchedule = json.optNullableString("ritualSchedule"),
                    slipsCount = json.optInt("slipsCount", 0),
                    cachedPhotoPath = resolvedPhotoPath,
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
            myMood = null,
            dailyIdeaTitle = null,
            ritualTitle = null,
            ritualSchedule = null,
            slipsCount = 0,
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
            views.setViewVisibility(
                R.id.repara_widget_subtitle,
                if (subtitle.isBlank()) View.GONE else View.VISIBLE,
            )

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

            val pendingIntent = HomeWidgetLaunchIntent.getActivity(
                context,
                MainActivity::class.java,
                Uri.parse(deepLink),
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
