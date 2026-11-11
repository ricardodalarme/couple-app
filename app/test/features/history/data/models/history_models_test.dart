import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HistoryNumbers.compute', () {
    test('computes descriptive days, weekends, full moons, Christmases and unique places', () {
      final numbers = HistoryNumbers.compute(
        togetherSince: DateTime(2024, 3, 14),
        now: DateTime(2026, 11, 8),
        places: const ['Paraty', 'paraty', 'Ubatuba', '  '],
        yearRecap: const HistoryYearRecap(year: 2026, memories: 12, firsts: 3),
      );

      expect(numbers.daysTogether, 969);
      expect(numbers.years, 2);
      expect(numbers.months, 7);
      expect(numbers.remainingDays, 25);
      expect(numbers.weekendsTogether, 138);
      expect(numbers.fullMoons, 32);
      expect(numbers.christmasesTogether, 2);
      expect(numbers.places, ['Paraty', 'Ubatuba']);
      expect(numbers.placesCount, 2);
      expect(numbers.nextAnniversaryYears, 3);
      expect(numbers.yearRecap?.memories, 12);
    });

    test('returns zeros when togetherSince is null', () {
      final numbers = HistoryNumbers.compute(
        togetherSince: null,
        now: DateTime(2026, 11, 8),
        places: const [],
      );

      expect(numbers.daysTogether, 0);
      expect(numbers.weekendsTogether, 0);
      expect(numbers.fullMoons, 0);
      expect(numbers.christmasesTogether, 0);
    });

    test('never borrows a negative day count across month ends', () {
      final jan31ToMar1Leap = HistoryNumbers.compute(
        togetherSince: DateTime(2024, 1, 31),
        now: DateTime(2024, 3, 1),
        places: const [],
      );
      expect(jan31ToMar1Leap.years, 0);
      expect(jan31ToMar1Leap.months, 1);
      expect(jan31ToMar1Leap.remainingDays, 1);

      final jan31ToMar1 = HistoryNumbers.compute(
        togetherSince: DateTime(2023, 1, 31),
        now: DateTime(2023, 3, 1),
        places: const [],
      );
      expect(jan31ToMar1.months, 1);
      expect(jan31ToMar1.remainingDays, 1);

      final jan30ToMar1 = HistoryNumbers.compute(
        togetherSince: DateTime(2024, 1, 30),
        now: DateTime(2024, 3, 1),
        places: const [],
      );
      expect(jan30ToMar1.months, 1);
      expect(jan30ToMar1.remainingDays, 1);

      for (final numbers in [jan31ToMar1Leap, jan31ToMar1, jan30ToMar1]) {
        expect(numbers.remainingDays, greaterThanOrEqualTo(0));
      }
    });

    test('counts a leap-day start without a negative remainder', () {
      final numbers = HistoryNumbers.compute(
        togetherSince: DateTime(2024, 2, 29),
        now: DateTime(2025, 2, 28),
        places: const [],
      );

      expect(numbers.years, 1);
      expect(numbers.months, 0);
      expect(numbers.remainingDays, 0);
    });

    test('keeps future start dates at zero instead of a negative count', () {
      final numbers = HistoryNumbers.compute(
        togetherSince: DateTime(2026, 12, 1),
        now: DateTime(2026, 11, 8),
        places: const [],
      );

      expect(numbers.daysTogether, 0);
      expect(numbers.years, 0);
      expect(numbers.months, 0);
      expect(numbers.remainingDays, 0);
      expect(numbers.daysUntilNextAnniversary, 0);
    });
  });

  group('HistoryOverview & StoryDatesSummary', () {
    test('sorts available years descending and detects unknown date milestones', () {
      final overview = HistoryOverview.fake().copyWithMilestones([
        HistoryMilestone(
          id: '1',
          source: MilestoneSource.storyEvent,
          kind: MilestoneKind.met,
          title: 'Nos conhecemos',
          date: DateTime(2024, 3, 14),
        ),
        HistoryMilestone(
          id: '2',
          source: MilestoneSource.memory,
          kind: MilestoneKind.trip,
          title: 'Paraty',
          date: DateTime(2026, 7, 10),
        ),
        const HistoryMilestone(
          id: '3',
          source: MilestoneSource.importantDate,
          kind: MilestoneKind.first,
          title: 'Primeira dança',
          precision: MilestoneDatePrecision.unknown,
        ),
      ]);

      expect(overview.availableYears, [2026, 2024]);
      expect(overview.hasUnknownYearMilestones, isTrue);
    });

    test('detects when self and partner chose different start dates', () {
      final same = StoryDatesSummary(
        met: const StoryDateEntry(kind: 'met'),
        dating: const StoryDateEntry(kind: 'dating'),
        engaged: const StoryDateEntry(kind: 'engaged'),
        married: const StoryDateEntry(kind: 'married'),
        selfStartDate: DateTime(2024, 3, 14),
        partnerStartDate: DateTime(2024, 3, 14),
      );
      expect(same.hasDifferentStartDates, isFalse);

      final different = StoryDatesSummary(
        met: const StoryDateEntry(kind: 'met'),
        dating: const StoryDateEntry(kind: 'dating'),
        engaged: const StoryDateEntry(kind: 'engaged'),
        married: const StoryDateEntry(kind: 'married'),
        selfStartDate: DateTime(2024, 3, 14),
        partnerStartDate: DateTime(2024, 3, 22),
      );
      expect(different.hasDifferentStartDates, isTrue);
    });
  });
}

extension on HistoryOverview {
  HistoryOverview copyWithMilestones(List<HistoryMilestone> items) => HistoryOverview(
    selfId: selfId,
    selfName: selfName,
    selfInitials: selfInitials,
    partnerName: partnerName,
    partnerInitials: partnerInitials,
    isPaired: isPaired,
    coupleId: coupleId,
    avatarKind: avatarKind,
    phase: RelationshipPhase.dating,
    togetherSince: togetherSince,
    milestones: items,
    storyDates: storyDates,
    numbers: numbers,
  );
}
