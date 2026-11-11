import 'package:flutter_bloc_starter/features/reminders/data/models/planned_reminder.dart';
import 'package:flutter_bloc_starter/features/reminders/data/models/reminder_preferences.dart';
import 'package:flutter_bloc_starter/features/reminders/data/planner/reminder_planner.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const planner = ReminderPlanner(
    texts: {
      ReminderKind.dailyIdea: 'Uma ideia para hoje.',
      ReminderKind.dates: 'Uma data chegando.',
      ReminderKind.weeklyCard: 'Seu cartão está pronto.',
    },
    discreetText: 'Abra o app para ver.',
  );
  final now = DateTime(2026, 11, 9, 9);
  const preferences = ReminderPreferences();

  ReminderCandidate at(
    int day,
    int hour, {
    int minute = 0,
    ReminderKind kind = ReminderKind.dailyIdea,
    String? key,
  }) => ReminderCandidate(kind: kind, at: DateTime(2026, 11, day, hour, minute), key: key);

  List<PlannedReminder> run(
    List<ReminderCandidate> candidates, {
    ReminderPreferences prefs = preferences,
  }) => planner.plan(preferences: prefs, candidates: candidates, now: now);

  group('filtering', () {
    test('a paused person gets nothing', () {
      expect(run([at(10, 12)], prefs: preferences.copyWith(isPaused: true)), isEmpty);
    });

    test('kinds that are switched off are dropped', () {
      final prefs = preferences.copyWith(enabled: {ReminderKind.weeklyCard});

      final plan = run([at(10, 12), at(10, 13, kind: ReminderKind.weeklyCard)], prefs: prefs);

      expect(plan.map((reminder) => reminder.kind), [ReminderKind.weeklyCard]);
    });

    test('moments already in the past are dropped', () {
      expect(run([at(9, 8), at(9, 9)]), isEmpty);
      expect(run([at(9, 9, minute: 1)]), hasLength(1));
    });
  });

  test('a late-evening reminder keeps its moment', () {
    expect(run([at(10, 23)]).single.at, DateTime(2026, 11, 10, 23));
  });

  group('daily limit', () {
    test('keeps the earliest two of three on one day', () {
      final plan = run([at(10, 18), at(10, 10), at(10, 14)]);

      expect(plan.map((reminder) => reminder.at.hour), [10, 14]);
    });

    test('counts each calendar day separately', () {
      final plan = run([at(10, 10), at(10, 11), at(11, 10), at(11, 11)]);

      expect(plan, hasLength(4));
    });

    test('a limit of one keeps one per day', () {
      final plan = run([at(10, 10), at(10, 11)], prefs: preferences.copyWith(maxPerDay: 1));

      expect(plan, hasLength(1));
    });

    test('a limit above two is brought back to two', () {
      expect(preferences.copyWith(maxPerDay: 5).maxPerDay, 2);
      expect(preferences.copyWith(maxPerDay: 0).maxPerDay, 1);
    });
  });

  test('only the nearest 64 are kept for the platform limit', () {
    final candidates = [
      for (var offset = 0; offset < 100; offset++)
        ReminderCandidate(kind: ReminderKind.dailyIdea, at: DateTime(2026, 11, 10 + offset, 12)),
    ];

    final plan = run(candidates);

    expect(plan, hasLength(platformPendingLimit));
    expect(plan.first.at, DateTime(2026, 11, 10, 12));
    expect(plan.last.at, DateTime(2026, 11, 10 + 63, 12));
  });

  group('texts', () {
    test('come from the fixed list for the kind', () {
      expect(run([at(10, 12)]).single.text, 'Uma ideia para hoje.');
    });

    test('are neutral in discreet mode', () {
      final plan = run([at(10, 12)], prefs: preferences.copyWith(isDiscreet: true));

      expect(plan.single.text, 'Abra o app para ver.');
    });
  });

  group('ids', () {
    test('are stable between plans', () {
      expect(run([at(10, 12)]).single.id, run([at(10, 12)]).single.id);
    });

    test('differ for different kinds and moments', () {
      final ids = run([at(10, 12), at(10, 13), at(11, 12, kind: ReminderKind.dates)])
          .map((reminder) => reminder.id)
          .toSet();

      expect(ids, hasLength(3));
    });

    test('are never negative', () {
      expect(run([at(10, 12, key: 'x' * 200)]).single.id, greaterThanOrEqualTo(0));
    });
  });

  group('ReminderPreferences', () {
    test('survive the storage round trip', () {
      final prefs = preferences.copyWith(
        enabled: {ReminderKind.dates},
        maxPerDay: 1,
        isPaused: true,
        isDiscreet: true,
      );

      expect(ReminderPreferences.fromMap(prefs.toMap()), prefs);
    });

    test('an empty stored map falls back to safe defaults', () {
      final prefs = ReminderPreferences.fromMap(const {});

      expect(prefs.maxPerDay, 2);
      expect(prefs.enabled, isEmpty);
    });
  });
}
