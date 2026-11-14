import 'dart:convert';

import 'package:clock/clock.dart';
import 'package:design_system/design_system.dart' show Skeletonizer;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';

/// Breakdown of the relationship duration at local midnight.
typedef TogetherDurationBreakdown = ({int years, int months, int days, int totalDays});

/// Compact JSON payload stored in the shared native store for iOS WidgetKit and Android AppWidgets.
final class const WidgetPayload({
  required final bool isSignedIn,
  required final bool discreet,
  required final bool isPaired,
  required final bool hasPlus,
  required final bool showNames,
  required final bool allowPartnerNotes,
  required final bool onLockScreen,
  required final bool isOffline,
  required final int unopenedCards,
  required final String cardState,
  required final int slipsCount,
  required final String updatedAt,
  final String? togetherSince,
  final RelationshipPhase? relationshipPhase,
  final String? partnerName,
  final String? nextDateTitle,
  final String? nextDateOn,
  final String? pauseReturnAt,
  final String? partnerNote,
  final String? partnerNoteMedia,
  final String? partnerNoteAt,
  final String? partnerMood,
  final String? myMood,
  final String? ritualTitle,
  final String? ritualSchedule,
  final String? dailyIdeaTitle,
  final String? suggestionKey,
  final String? cachedPhotoPath,
}) with Equatable {
  /// Neutral payload written when the user is signed out so no previous account data remains.
  factory signedOut({DateTime? now}) => WidgetPayload(
    isSignedIn: false,
    discreet: false,
    isPaired: false,
    hasPlus: false,
    showNames: false,
    allowPartnerNotes: false,
    onLockScreen: false,
    isOffline: false,
    unopenedCards: 0,
    cardState: 'none',
    slipsCount: 0,
    updatedAt: (now ?? clock.now().toUtc()).toUtc().toIso8601String(),
  );

  /// Placeholder payload used only by [Skeletonizer] while loading.
  factory fake() => const WidgetPayload(
    isSignedIn: true,
    discreet: false,
    isPaired: true,
    hasPlus: true,
    showNames: true,
    allowPartnerNotes: true,
    onLockScreen: false,
    isOffline: false,
    togetherSince: '2024-02-14',
    relationshipPhase: RelationshipPhase.dating,
    partnerName: 'Marina',
    nextDateTitle: 'Aniversário',
    nextDateOn: '2026-11-23',
    unopenedCards: 1,
    cardState: 'ready',
    slipsCount: 4,
    partnerNote: 'Boa sorte na reunião!',
    myMood: 'happy',
    ritualTitle: 'Caminhada de domingo',
    ritualSchedule: 'Dom · 10:00',
    dailyIdeaTitle: 'Deixe um bilhete na marmita dele',
    suggestionKey: 'write_slip',
    updatedAt: '2026-11-11T12:00:00.000Z',
  );

  factory fromJson(Map<String, dynamic> json) => WidgetPayload(
    isSignedIn: json['isSignedIn'] as bool? ?? false,
    discreet: json['discreet'] as bool? ?? false,
    isPaired: json['isPaired'] as bool? ?? false,
    hasPlus: json['hasPlus'] as bool? ?? false,
    showNames: json['showNames'] as bool? ?? false,
    allowPartnerNotes: json['allowPartnerNotes'] as bool? ?? false,
    onLockScreen: json['onLockScreen'] as bool? ?? false,
    isOffline: json['isOffline'] as bool? ?? false,
    togetherSince: json['togetherSince'] as String?,
    relationshipPhase: RelationshipPhase.values.asNameMap()[json['relationshipPhase'] as String?],
    partnerName: json['partnerName'] as String?,
    nextDateTitle: json['nextDateTitle'] as String?,
    nextDateOn: json['nextDateOn'] as String?,
    unopenedCards: json['unopenedCards'] as int? ?? 0,
    cardState: json['cardState'] as String? ?? 'none',
    pauseReturnAt: json['pauseReturnAt'] as String?,
    partnerNote: json['partnerNote'] as String?,
    partnerNoteMedia: json['partnerNoteMedia'] as String?,
    partnerNoteAt: json['partnerNoteAt'] as String?,
    partnerMood: json['partnerMood'] as String?,
    myMood: json['myMood'] as String?,
    ritualTitle: json['ritualTitle'] as String?,
    ritualSchedule: json['ritualSchedule'] as String?,
    dailyIdeaTitle: json['dailyIdeaTitle'] as String?,
    slipsCount: json['slipsCount'] as int? ?? 0,
    suggestionKey: json['suggestionKey'] as String?,
    cachedPhotoPath: json['cachedPhotoPath'] as String?,
    updatedAt: json['updatedAt'] as String? ?? '',
  );

  factory fromJsonString(String raw) {
    final decoded = jsonDecode(raw);
    if (decoded is Map<String, dynamic>) {
      return WidgetPayload.fromJson(decoded);
    }
    return WidgetPayload.signedOut();
  }

  /// Applies privacy, discreet, pairing, Plus, and date-expiration rules before persisting.
  WidgetPayload sanitized({DateTime? referenceNow}) {
    final now = referenceNow ?? clock.now();
    if (!isSignedIn) {
      return WidgetPayload.signedOut(now: now);
    }

    final activePause = isPaired && isPauseActiveOn(now) ? pauseReturnAt : null;
    final rawDaysUntilDate = _daysUntilDateString(nextDateOn, now);
    final validDateOn = rawDaysUntilDate != null && rawDaysUntilDate >= 0 ? nextDateOn : null;
    final validDateTitle = validDateOn != null ? _nonEmpty(nextDateTitle) : null;

    if (discreet) {
      return WidgetPayload(
        isSignedIn: true,
        discreet: true,
        isPaired: isPaired,
        hasPlus: hasPlus,
        showNames: false,
        allowPartnerNotes: allowPartnerNotes,
        onLockScreen: onLockScreen,
        isOffline: isOffline,
        unopenedCards: 0,
        cardState: 'none',
        slipsCount: 0,
        updatedAt: now.toUtc().toIso8601String(),
      );
    }

    final resolvedPartnerName = isPaired && showNames ? _nonEmpty(partnerName) : null;
    final resolvedNote = isPaired && allowPartnerNotes ? _nonEmpty(partnerNote) : null;
    final resolvedNoteMedia = isPaired && allowPartnerNotes ? _nonEmpty(partnerNoteMedia) : null;
    final resolvedNoteAt = (resolvedNote != null || resolvedNoteMedia != null)
        ? partnerNoteAt
        : null;
    final resolvedPhotoPath = isPaired && hasPlus ? _nonEmpty(cachedPhotoPath) : null;
    final resolvedUnopenedCards = isPaired ? unopenedCards : 0;

    final resolvedCardState = switch ((activePause != null, isPaired, cardState)) {
      (true, _, _) => 'pause',
      (false, false, _) => 'none',
      (false, true, 'ready' || 'sent' || 'none') => resolvedUnopenedCards > 0 ? 'ready' : cardState,
      _ => resolvedUnopenedCards > 0 ? 'ready' : 'none',
    };

    return WidgetPayload(
      isSignedIn: true,
      discreet: false,
      isPaired: isPaired,
      hasPlus: hasPlus,
      showNames: showNames,
      allowPartnerNotes: allowPartnerNotes,
      onLockScreen: onLockScreen,
      isOffline: isOffline,
      togetherSince: _nonEmpty(togetherSince),
      relationshipPhase: relationshipPhase,
      partnerName: resolvedPartnerName,
      nextDateTitle: validDateTitle,
      nextDateOn: validDateOn,
      unopenedCards: resolvedUnopenedCards,
      cardState: resolvedCardState,
      pauseReturnAt: activePause,
      partnerNote: resolvedNote,
      partnerNoteMedia: resolvedNoteMedia,
      partnerNoteAt: resolvedNoteAt,
      partnerMood: isPaired ? _nonEmpty(partnerMood) : null,
      myMood: _nonEmpty(myMood),
      ritualTitle: _nonEmpty(ritualTitle),
      ritualSchedule: _nonEmpty(ritualSchedule),
      dailyIdeaTitle: _nonEmpty(dailyIdeaTitle),
      slipsCount: slipsCount,
      suggestionKey: _nonEmpty(suggestionKey),
      cachedPhotoPath: resolvedPhotoPath,
      updatedAt: now.toUtc().toIso8601String(),
    );
  }

  /// Whether a pause is currently active at [now].
  bool isPauseActiveOn(DateTime now) {
    final raw = pauseReturnAt;
    if (raw == null || raw.isEmpty) return false;
    final parsed = DateTime.tryParse(raw);
    if (parsed == null) return false;
    return parsed.toUtc().isAfter(now.toUtc());
  }

  /// Exact days together at local midnight for [localNow], or `null` when unset or discreet.
  int? daysTogetherOn(DateTime localNow) {
    if (discreet || !isSignedIn) return null;
    final start = _parseLocalDate(togetherSince);
    if (start == null) return null;
    final today = DateTime.utc(localNow.year, localNow.month, localNow.day);
    final startUtc = DateTime.utc(start.year, start.month, start.day);
    final diff = today.difference(startUtc).inDays;
    return diff < 0 ? 0 : diff;
  }

  /// Years, months, days, and total days together at local midnight for [localNow].
  TogetherDurationBreakdown? durationBreakdownOn(DateTime localNow) {
    final total = daysTogetherOn(localNow);
    final start = _parseLocalDate(togetherSince);
    if (total == null || start == null) return null;

    final today = DateTime(localNow.year, localNow.month, localNow.day);
    var years = today.year - start.year;
    var months = today.month - start.month;
    var days = today.day - start.day;

    if (days < 0) {
      final previousMonth = DateTime(today.year, today.month, 0);
      days += previousMonth.day;
      months -= 1;
    }
    if (months < 0) {
      months += 12;
      years -= 1;
    }
    if (years < 0) {
      return (years: 0, months: 0, days: 0, totalDays: 0);
    }
    return (years: years, months: months, days: days, totalDays: total);
  }

  /// Calendar days until [nextDateOn] at local midnight for [localNow].
  int? daysUntilNextDateOn(DateTime localNow) {
    if (discreet || !isSignedIn) return null;
    final days = _daysUntilDateString(nextDateOn, localNow);
    return days != null && days >= 0 ? days : null;
  }

  WidgetPayload copyWith({
    bool? isSignedIn,
    bool? discreet,
    bool? isPaired,
    bool? hasPlus,
    bool? showNames,
    bool? allowPartnerNotes,
    bool? onLockScreen,
    bool? isOffline,
    String? togetherSince,
    RelationshipPhase? relationshipPhase,
    String? partnerName,
    String? nextDateTitle,
    String? nextDateOn,
    int? unopenedCards,
    String? cardState,
    String? pauseReturnAt,
    String? partnerNote,
    String? partnerNoteMedia,
    String? partnerNoteAt,
    String? partnerMood,
    String? myMood,
    String? ritualTitle,
    String? ritualSchedule,
    String? dailyIdeaTitle,
    int? slipsCount,
    String? suggestionKey,
    String? cachedPhotoPath,
    String? updatedAt,
  }) => WidgetPayload(
    isSignedIn: isSignedIn ?? this.isSignedIn,
    discreet: discreet ?? this.discreet,
    isPaired: isPaired ?? this.isPaired,
    hasPlus: hasPlus ?? this.hasPlus,
    showNames: showNames ?? this.showNames,
    allowPartnerNotes: allowPartnerNotes ?? this.allowPartnerNotes,
    onLockScreen: onLockScreen ?? this.onLockScreen,
    isOffline: isOffline ?? this.isOffline,
    togetherSince: togetherSince ?? this.togetherSince,
    relationshipPhase: relationshipPhase ?? this.relationshipPhase,
    partnerName: partnerName ?? this.partnerName,
    nextDateTitle: nextDateTitle ?? this.nextDateTitle,
    nextDateOn: nextDateOn ?? this.nextDateOn,
    unopenedCards: unopenedCards ?? this.unopenedCards,
    cardState: cardState ?? this.cardState,
    pauseReturnAt: pauseReturnAt ?? this.pauseReturnAt,
    partnerNote: partnerNote ?? this.partnerNote,
    partnerNoteMedia: partnerNoteMedia ?? this.partnerNoteMedia,
    partnerNoteAt: partnerNoteAt ?? this.partnerNoteAt,
    partnerMood: partnerMood ?? this.partnerMood,
    myMood: myMood ?? this.myMood,
    ritualTitle: ritualTitle ?? this.ritualTitle,
    ritualSchedule: ritualSchedule ?? this.ritualSchedule,
    dailyIdeaTitle: dailyIdeaTitle ?? this.dailyIdeaTitle,
    slipsCount: slipsCount ?? this.slipsCount,
    suggestionKey: suggestionKey ?? this.suggestionKey,
    cachedPhotoPath: cachedPhotoPath ?? this.cachedPhotoPath,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'isSignedIn': isSignedIn,
    'discreet': discreet,
    'isPaired': isPaired,
    'hasPlus': hasPlus,
    'showNames': showNames,
    'allowPartnerNotes': allowPartnerNotes,
    'onLockScreen': onLockScreen,
    'isOffline': isOffline,
    'togetherSince': togetherSince,
    'relationshipPhase': relationshipPhase?.name,
    'partnerName': partnerName,
    'nextDateTitle': nextDateTitle,
    'nextDateOn': nextDateOn,
    'unopenedCards': unopenedCards,
    'cardState': cardState,
    'pauseReturnAt': pauseReturnAt,
    'partnerNote': partnerNote,
    'partnerNoteMedia': partnerNoteMedia,
    'partnerNoteAt': partnerNoteAt,
    'partnerMood': partnerMood,
    'myMood': myMood,
    'ritualTitle': ritualTitle,
    'ritualSchedule': ritualSchedule,
    'dailyIdeaTitle': dailyIdeaTitle,
    'slipsCount': slipsCount,
    'suggestionKey': suggestionKey,
    'cachedPhotoPath': cachedPhotoPath,
    'updatedAt': updatedAt,
  };

  String toJsonString() => jsonEncode(toJson());

  static int? _daysUntilDateString(String? rawDate, DateTime localNow) {
    final target = _parseLocalDate(rawDate);
    if (target == null) return null;
    final today = DateTime.utc(localNow.year, localNow.month, localNow.day);
    final targetUtc = DateTime.utc(target.year, target.month, target.day);
    return targetUtc.difference(today).inDays;
  }

  static DateTime? _parseLocalDate(String? raw) {
    if (raw == null || raw.trim().isEmpty) return null;
    final datePart = raw.split('T').first;
    final parts = datePart.split('-');
    if (parts.length != 3) return null;
    final year = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final day = int.tryParse(parts[2]);
    if (year == null || month == null || day == null) return null;
    return DateTime(year, month, day);
  }

  static String? _nonEmpty(String? value) {
    final trimmed = value?.trim();
    return (trimmed == null || trimmed.isEmpty) ? null : trimmed;
  }

  @override
  List<Object?> get props => [
    isSignedIn,
    discreet,
    isPaired,
    hasPlus,
    showNames,
    allowPartnerNotes,
    onLockScreen,
    isOffline,
    togetherSince,
    relationshipPhase,
    partnerName,
    nextDateTitle,
    nextDateOn,
    unopenedCards,
    cardState,
    pauseReturnAt,
    partnerNote,
    partnerNoteMedia,
    partnerNoteAt,
    partnerMood,
    myMood,
    ritualTitle,
    ritualSchedule,
    dailyIdeaTitle,
    slipsCount,
    suggestionKey,
    cachedPhotoPath,
    updatedAt,
  ];
}
