import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/history/data/models/story_event_kind.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/avatar_kind.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_status.dart';

/// Where a timeline milestone is stored in the backend.
enum MilestoneSource() {
  storyEvent,
  memory,
  importantDate,
}

/// Visual and semantic category of a milestone in "Our history".
enum MilestoneKind() {
  met,
  dating,
  engaged,
  married,
  first,
  trip,
  home,
  custom,
}

/// How much of a milestone's date is known.
enum MilestoneDatePrecision() {
  day,
  month,
  year,
  unknown,
}

/// A single milestone or memory shown on the "Our history" timeline.
final class const HistoryMilestone({
  required final String id,
  required final MilestoneSource source,
  required final MilestoneKind kind,
  required final String title,
  final DateTime? date,
  final MilestoneDatePrecision precision = MilestoneDatePrecision.day,
  final String? place,
  final String? body,
  final bool isShared = true,
  final bool isMine = true,
  final String? authorName,
}) with Equatable {
  factory fake() => HistoryMilestone(
    id: 'fake-milestone',
    source: MilestoneSource.memory,
    kind: MilestoneKind.trip,
    title: 'Primeira viagem juntos',
    date: DateTime(2025, 7, 14),
    precision: MilestoneDatePrecision.month,
    place: 'Paraty',
  );

  bool get isUnknownDate => precision == MilestoneDatePrecision.unknown || date == null;

  int? get year => isUnknownDate ? null : date?.year;

  HistoryMilestone copyWith({
    String? id,
    MilestoneSource? source,
    MilestoneKind? kind,
    String? title,
    DateTime? date,
    bool clearDate = false,
    MilestoneDatePrecision? precision,
    String? place,
    bool clearPlace = false,
    String? body,
    bool clearBody = false,
    bool? isShared,
    bool? isMine,
    String? authorName,
  }) {
    return HistoryMilestone(
      id: id ?? this.id,
      source: source ?? this.source,
      kind: kind ?? this.kind,
      title: title ?? this.title,
      date: clearDate ? null : (date ?? this.date),
      precision: precision ?? this.precision,
      place: clearPlace ? null : (place ?? this.place),
      body: clearBody ? null : (body ?? this.body),
      isShared: isShared ?? this.isShared,
      isMine: isMine ?? this.isMine,
      authorName: authorName ?? this.authorName,
    );
  }

  @override
  List<Object?> get props => [
    id,
    source,
    kind,
    title,
    date,
    precision,
    place,
    body,
    isShared,
    isMine,
    authorName,
  ];
}

/// One of the four canonical relationship story dates (`met`, `dating`, `engaged`, `married`).
final class const StoryDateEntry({
  required final StoryEventKind kind,
  final String? id,
  final DateTime? date,
  final MilestoneDatePrecision precision = MilestoneDatePrecision.month,
  final bool isShared = true,
  final bool isMine = true,
  final String? authorName,
}) with Equatable {
  @override
  List<Object?> get props => [kind, id, date, precision, isShared, isMine, authorName];
}

/// Summary of the four canonical story dates plus any start-date difference between partners.
final class const StoryDatesSummary({
  required final StoryDateEntry met,
  required final StoryDateEntry dating,
  required final StoryDateEntry engaged,
  required final StoryDateEntry married,
  final DateTime? selfStartDate,
  final DateTime? partnerStartDate,
}) with Equatable {
  factory empty() => const StoryDatesSummary(
    met: StoryDateEntry(kind: StoryEventKind.met),
    dating: StoryDateEntry(kind: StoryEventKind.dating),
    engaged: StoryDateEntry(kind: StoryEventKind.engaged),
    married: StoryDateEntry(kind: StoryEventKind.married),
  );

  bool get hasDifferentStartDates {
    final selfDate = selfStartDate;
    final partnerDate = partnerStartDate;
    if (selfDate == null || partnerDate == null) return false;
    return selfDate.year != partnerDate.year ||
        selfDate.month != partnerDate.month ||
        selfDate.day != partnerDate.day;
  }

  List<StoryDateEntry> get entries => [met, dating, engaged, married];

  @override
  List<Object?> get props => [met, dating, engaged, married, selfStartDate, partnerStartDate];
}

/// Descriptive annual activity counts from `my_year`.
final class const HistoryYearRecap({
  required final int year,
  final int memories = 0,
  final int firsts = 0,
  final int slips = 0,
  final int cardsSent = 0,
  final int ritualsDone = 0,
}) with Equatable {
  @override
  List<Object?> get props => [year, memories, firsts, slips, cardsSent, ritualsDone];
}

/// Descriptive numbers for "Our history in numbers" (never comparative).
final class const HistoryNumbers({
  required final int daysTogether,
  required final int years,
  required final int months,
  required final int remainingDays,
  required final int weekendsTogether,
  required final int fullMoons,
  required final int christmasesTogether,
  required final int monthsUntilNextAnniversary,
  required final int daysUntilNextAnniversary,
  required final int nextAnniversaryYears,
  required final List<String> places,
  final HistoryYearRecap? yearRecap,
}) with Equatable {
  factory compute({
    required DateTime? togetherSince,
    required DateTime now,
    required List<String> places,
    HistoryYearRecap? yearRecap,
  }) {
    final normalizedPlaces = <String>[];
    final seen = <String>{};
    for (final raw in places) {
      final trimmed = raw.trim();
      if (trimmed.isNotEmpty && seen.add(trimmed.toLowerCase())) {
        normalizedPlaces.add(trimmed);
      }
    }

    if (togetherSince == null) {
      return HistoryNumbers(
        daysTogether: 0,
        years: 0,
        months: 0,
        remainingDays: 0,
        weekendsTogether: 0,
        fullMoons: 0,
        christmasesTogether: 0,
        monthsUntilNextAnniversary: 0,
        daysUntilNextAnniversary: 0,
        nextAnniversaryYears: 1,
        places: normalizedPlaces,
        yearRecap: yearRecap,
      );
    }

    final start = DateTime.utc(togetherSince.year, togetherSince.month, togetherSince.day);
    final today = DateTime.utc(now.year, now.month, now.day);
    if (start.isAfter(today)) {
      return HistoryNumbers(
        daysTogether: 0,
        years: 0,
        months: 0,
        remainingDays: 0,
        weekendsTogether: 0,
        fullMoons: 0,
        christmasesTogether: 0,
        monthsUntilNextAnniversary: 0,
        daysUntilNextAnniversary: 0,
        nextAnniversaryYears: 1,
        places: normalizedPlaces,
        yearRecap: yearRecap,
      );
    }

    final daysTogether = today.difference(start).inDays;
    final weekendsTogether = daysTogether ~/ 7;
    final fullMoons = (daysTogether / 29.530588).floor();

    var christmases = 0;
    for (var y = start.year; y <= today.year; y++) {
      final xmas = DateTime.utc(y, 12, 25);
      if (!xmas.isBefore(start) && !xmas.isAfter(today)) {
        christmases++;
      }
    }

    var totalMonths = (today.year - start.year) * 12 + (today.month - start.month);
    var anchor = _addMonthsClamped(start, totalMonths);
    if (anchor.isAfter(today)) {
      totalMonths -= 1;
      anchor = _addMonthsClamped(start, totalMonths);
    }
    final years = totalMonths ~/ 12;
    final months = totalMonths % 12;
    final remainingDays = today.difference(anchor).inDays;

    final nextAnniversaryYears = years + 1;
    final nextAnniversaryTargetYear = start.year + nextAnniversaryYears;
    final nextAnniversaryLastDay = DateTime.utc(nextAnniversaryTargetYear, start.month + 1, 0).day;
    final nextAnniversary = DateTime.utc(
      nextAnniversaryTargetYear,
      start.month,
      start.day > nextAnniversaryLastDay ? nextAnniversaryLastDay : start.day,
    );
    final daysUntilNext = nextAnniversary.difference(today).inDays;
    final monthsUntilNext = (daysUntilNext / 30.4375).ceil().clamp(1, 12);

    return HistoryNumbers(
      daysTogether: daysTogether,
      years: years,
      months: months,
      remainingDays: remainingDays,
      weekendsTogether: weekendsTogether,
      fullMoons: fullMoons,
      christmasesTogether: christmases,
      monthsUntilNextAnniversary: monthsUntilNext,
      daysUntilNextAnniversary: daysUntilNext,
      nextAnniversaryYears: nextAnniversaryYears,
      places: normalizedPlaces,
      yearRecap: yearRecap,
    );
  }

  int get placesCount => places.length;

  @override
  List<Object?> get props => [
    daysTogether,
    years,
    months,
    remainingDays,
    weekendsTogether,
    fullMoons,
    christmasesTogether,
    monthsUntilNextAnniversary,
    daysUntilNextAnniversary,
    nextAnniversaryYears,
    places,
    yearRecap,
  ];
}

DateTime _addMonthsClamped(DateTime start, int months) {
  final rawMonth = start.month + months;
  final year = start.year + (rawMonth - 1) ~/ 12;
  final month = (rawMonth - 1) % 12 + 1;
  final lastDay = DateTime.utc(year, month + 1, 0).day;
  return DateTime.utc(year, month, start.day > lastDay ? lastDay : start.day);
}

/// Complete view model for the "Our history" feature.
final class const HistoryOverview({
  required final String selfId,
  required final String selfName,
  required final String selfInitials,
  required final bool isPaired,
  required final AvatarKind avatarKind,
  required final RelationshipPhase phase,
  required final List<HistoryMilestone> milestones,
  required final StoryDatesSummary storyDates,
  required final HistoryNumbers numbers,
  final String? partnerName,
  final String? partnerInitials,
  final String? coupleId,
  final DateTime? togetherSince,
  final DateTime? nextReunionDate,
  final RelationshipStatus relationshipStatus = RelationshipStatus.together,
  final int memoryCount = 0,
  final bool hasMoreMemories = false,
  final bool hasMoreHistory = false,
}) with Equatable {
  factory fake() {
    final since = DateTime(2024, 3, 14);
    final now = DateTime(2026, 11, 8);
    return HistoryOverview(
      selfId: 'fake-self',
      selfName: 'Rafa',
      selfInitials: 'R',
      partnerName: 'Marina',
      partnerInitials: 'M',
      isPaired: true,
      coupleId: 'fake-couple',
      avatarKind: AvatarKind.initials,
      phase: RelationshipPhase.dating,
      togetherSince: since,
      milestones: [HistoryMilestone.fake()],
      storyDates: StoryDatesSummary.empty(),
      numbers: HistoryNumbers.compute(togetherSince: since, now: now, places: const ['Paraty']),
    );
  }

  /// Whether the relationship is ongoing, so forward-looking content is honest.
  bool get isOngoing => relationshipStatus == RelationshipStatus.together;

  /// Distinct known years in descending order for year-based pagination.
  List<int> get availableYears {
    final years = <int>{};
    for (final item in milestones) {
      final y = item.year;
      if (y != null) years.add(y);
    }
    final list = years.toList()..sort((a, b) => b.compareTo(a));
    return list;
  }

  bool get hasUnknownYearMilestones => milestones.any((item) => item.isUnknownDate);

  /// Days until [nextReunionDate] when positive.
  int? daysUntilReunion(DateTime now) {
    final reunion = nextReunionDate;
    if (reunion == null) return null;
    final today = DateTime.utc(now.year, now.month, now.day);
    final target = DateTime.utc(reunion.year, reunion.month, reunion.day);
    final diff = target.difference(today).inDays;
    return diff >= 0 ? diff : null;
  }

  @override
  List<Object?> get props => [
    selfId,
    selfName,
    selfInitials,
    partnerName,
    partnerInitials,
    isPaired,
    coupleId,
    avatarKind,
    phase,
    togetherSince,
    nextReunionDate,
    relationshipStatus,
    memoryCount,
    hasMoreMemories,
    hasMoreHistory,
    milestones,
    storyDates,
    numbers,
  ];
}
