import 'package:flutter_bloc_starter/features/widgets/data/data_sources/queries/generated/WidgetOverview.graphql.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';

extension QueryWidgetOverviewMapper on QueryWidgetOverview {
  WidgetOverview toModel({
    required bool localHideWidgetText,
    required WidgetContentSource contentSource,
    required WidgetRotationCadence rotationCadence,
    String? cachedPhotoPath,
    DateTime? now,
  }) {
    final widgetState = widget;
    final todayState = today;
    final settings = mySettings;

    final profileId = settings?.profileId ?? widgetState?.profileId ?? '';
    final showNames = settings?.widgetShowNames ?? true;
    final hideInDiscreet = settings?.widgetInDiscreet ?? localHideWidgetText;
    final allowPartnerNotes = settings?.widgetAllowPartnerNotes ?? true;
    final onLockScreen = settings?.widgetOnLockScreen ?? false;
    final isDiscreet = (widgetState?.discreet ?? false) || hideInDiscreet || localHideWidgetText;
    final isPaired = widgetState?.isPaired ?? todayState?.isPaired ?? false;
    final hasPlus = todayState?.hasPlus ?? false;

    final togetherSinceDate =
        widgetState?.togetherSince ?? todayState?.togetherSince ?? settings?.togetherSince;
    final togetherSince = togetherSinceDate != null ? _formatDateOnly(togetherSinceDate) : null;

    final nextDate = widgetState?.nextDateOn ?? todayState?.nextDateOn;
    final nextDateOn = nextDate != null ? _formatDateOnly(nextDate) : null;
    final nextDateTitle = widgetState?.nextDateTitle ?? todayState?.nextDateTitle;

    final pauseReturnAt = (widgetState?.pauseReturnAt ?? todayState?.pauseReturnAt)
        ?.toUtc()
        .toIso8601String();
    final unopenedCards = widgetState?.unopenedCards ?? todayState?.unopenedCards ?? 0;
    final rawCardStatus = todayState?.cardStatus;
    final cardState = switch ((unopenedCards > 0, rawCardStatus)) {
      (true, _) => 'ready',
      (false, 'sent') => 'sent',
      (false, 'ready' || 'draft') => 'ready',
      _ => 'none',
    };

    final ritualNode = ritualsCollection.edges.firstOrNull?.node;
    final ritualSchedule = ritualNode != null
        ? _formatRitualSchedule(weekday: ritualNode.weekday, atTime: ritualNode.atTime)
        : null;

    final moodNode = moodsCollection.edges.firstOrNull?.node;
    final referenceNow = now ?? DateTime.now();

    final rawPayload = WidgetPayload(
      isSignedIn: true,
      discreet: isDiscreet,
      isPaired: isPaired,
      hasPlus: hasPlus,
      showNames: showNames,
      allowPartnerNotes: allowPartnerNotes,
      onLockScreen: onLockScreen,
      isOffline: false,
      togetherSince: togetherSince,
      relationshipPhase: settings?.phase?.toJson().toLowerCase(),
      partnerName: widgetState?.partnerName ?? todayState?.partnerName ?? settings?.partnerName,
      nextDateTitle: nextDateTitle,
      nextDateOn: nextDateOn,
      unopenedCards: unopenedCards,
      cardState: cardState,
      pauseReturnAt: pauseReturnAt,
      partnerNote: widgetState?.partnerNote,
      partnerNoteMedia: widgetState?.partnerNoteMedia,
      partnerNoteAt: widgetState?.partnerNoteAt?.toUtc().toIso8601String(),
      partnerMood: widgetState?.partnerMood,
      myMood: moodNode?.mood,
      ritualTitle: ritualNode?.title,
      ritualSchedule: ritualSchedule,
      dailyIdeaTitle: idea?.title,
      slipsCount: todayState?.slipsTotal ?? todayState?.slipsThisWeek ?? 0,
      suggestionKey: todayState?.suggestionKey,
      cachedPhotoPath: cachedPhotoPath,
      updatedAt: referenceNow.toUtc().toIso8601String(),
    ).sanitized(referenceNow: referenceNow);

    final preferences = WidgetPreferences(
      profileId: profileId,
      showNames: showNames,
      hideInDiscreet: hideInDiscreet,
      allowPartnerNotes: allowPartnerNotes,
      onLockScreen: onLockScreen,
      contentSource: contentSource,
      rotationCadence: rotationCadence,
    );

    return WidgetOverview(payload: rawPayload, preferences: preferences);
  }
}

String _formatDateOnly(DateTime date) {
  final year = date.year.toString().padLeft(4, '0');
  final month = date.month.toString().padLeft(2, '0');
  final day = date.day.toString().padLeft(2, '0');
  return '$year-$month-$day';
}

String? _formatRitualSchedule({int? weekday, String? atTime}) {
  const weekdayLabels = <int, String>{
    1: 'Seg',
    2: 'Ter',
    3: 'Qua',
    4: 'Qui',
    5: 'Sex',
    6: 'Sáb',
    7: 'Dom',
  };
  final dayLabel = weekday != null ? weekdayLabels[weekday] : null;
  final timeLabel = atTime != null && atTime.length >= 5 ? atTime.substring(0, 5) : atTime;
  return switch ((dayLabel, timeLabel)) {
    (final d?, final t?) when t.isNotEmpty => '$d · $t',
    (final d?, _) => d,
    (null, final t?) when t.isNotEmpty => t,
    _ => null,
  };
}
