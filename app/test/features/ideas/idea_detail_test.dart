import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/ideas/data/models/idea.dart';
import 'package:flutter_bloc_starter/features/ideas/data/repositories/ideas_repository.dart';
import 'package:flutter_bloc_starter/features/ideas/presentation/detail/cubit/idea_detail_cubit.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockIdeas() extends Mock implements IdeasRepository;

class _MockProfile() extends Mock implements ProfileRepository;

class _MockReminders() extends Mock implements RemindersRepository;

class _MockSync() extends Mock implements ReminderSyncService;

class _MockNotifications() extends Mock implements NotificationsRepository;

void main() {
  group('reminderMoment', () {
    final monday = DateTime(2026, 11, 9, 14);

    test('tonight is 20:00 today when there is time', () {
      expect(reminderMoment(ReminderChoice.tonight, monday), DateTime(2026, 11, 9, 20));
    });

    test('tonight after 20:00 moves to tomorrow instead of the past', () {
      final late = DateTime(2026, 11, 9, 21);

      expect(reminderMoment(ReminderChoice.tonight, late), DateTime(2026, 11, 10, 20));
    });

    test('tomorrow is 09:00 the next day', () {
      expect(reminderMoment(ReminderChoice.tomorrow, monday), DateTime(2026, 11, 10, 9));
    });

    test('the weekend is the coming Saturday at 10:00', () {
      expect(reminderMoment(ReminderChoice.weekend, monday), DateTime(2026, 11, 14, 10));
    });

    test('on Saturday morning the weekend is today, after 10:00 it is next week', () {
      expect(
        reminderMoment(ReminderChoice.weekend, DateTime(2026, 11, 14, 8)),
        DateTime(2026, 11, 14, 10),
      );
      expect(
        reminderMoment(ReminderChoice.weekend, DateTime(2026, 11, 14, 11)),
        DateTime(2026, 11, 21, 10),
      );
    });

    test('every choice is in the future', () {
      final now = DateTime(2026, 11, 14, 23, 59);

      for (final choice in ReminderChoice.values) {
        expect(reminderMoment(choice, now).isAfter(now), isTrue);
      }
    });
  });

  group('IdeaDetailCubit', () {
    late IdeasRepository ideas;
    late ProfileRepository profile;
    late RemindersRepository reminders;
    late ReminderSyncService sync;
    late NotificationsRepository notifications;
    const list = [
      Idea(slug: 'a', title: 'Um bilhete'),
      Idea(slug: 'b', title: 'Um obrigado'),
      Idea(slug: 'c', title: 'Um beijo'),
    ];

    setUpAll(() => registerFallbackValue(DateTime(2026)));

    setUp(() {
      ideas = _MockIdeas();
      profile = _MockProfile();
      reminders = _MockReminders();
      sync = _MockSync();
      notifications = _MockNotifications();
      when(() => ideas.getIdeas(any())).thenAnswer((_) async => list);
      when(() => ideas.isDone(any())).thenReturn(false);
      when(() => ideas.markDone(any())).thenAnswer((_) async {});
      when(() => profile.getMySettings()).thenAnswer(
        (_) async => const AccountSettings(
          theme: AppThemeVariant.rose,
          phase: 'married',
          goals: ['keep_romance'],
        ),
      );
      when(() => reminders.addCustomReminder(any(), now: any(named: 'now')))
          .thenAnswer((_) async {});
      when(() => sync.sync(now: any(named: 'now'))).thenAnswer((_) async {});
    });

    IdeaDetailCubit build() => IdeaDetailCubit(
      ideasRepository: ideas,
      profileRepository: profile,
      remindersRepository: reminders,
      reminderSyncService: sync,
      notificationsRepository: notifications,
    );

    test('load shows the idea with the given slug and the person phase and goals', () async {
      final cubit = build();
      await cubit.load('b');

      expect(cubit.state.current?.slug, 'b');
      expect(cubit.state.phase, 'married');
      expect(cubit.state.goals, ['keep_romance']);
    });

    test('an unknown slug falls back to the first idea', () async {
      final cubit = build();
      await cubit.load('zzz');

      expect(cubit.state.current?.slug, 'a');
    });

    test('another idea goes round the list and never ends empty', () async {
      final cubit = build();
      await cubit.load('c');
      cubit.another();

      expect(cubit.state.current?.slug, 'a');
    });

    test('an empty list has no current idea and nothing breaks', () async {
      when(() => ideas.getIdeas(any())).thenAnswer((_) async => const []);
      final cubit = build();
      await cubit.load(null);
      cubit.another();

      expect(cubit.state.current, isNull);
    });

    test('done is remembered once, and again changes nothing', () async {
      final cubit = build();
      await cubit.load('a');
      await cubit.markDone();
      await cubit.markDone();

      verify(() => ideas.markDone('a')).called(1);
      expect(cubit.state.isDone, isTrue);
    });

    test('later saves a reminder and re-plans', () async {
      final cubit = build();
      await cubit.load('a');
      await cubit.remindLater(ReminderChoice.tomorrow);

      verify(() => reminders.addCustomReminder(any(), now: any(named: 'now'))).called(1);
      verify(() => sync.sync(now: any(named: 'now'))).called(1);
    });

    test('a failing reminder is reported and reset', () async {
      when(() => reminders.addCustomReminder(any(), now: any(named: 'now')))
          .thenAnswer((_) async => throw Exception());
      final cubit = build();
      await cubit.load('a');
      await cubit.remindLater(ReminderChoice.tonight);

      expect(cubit.state.reminderAction, const Initial());
    });

    test('a failed load shows a failure', () async {
      when(() => profile.getMySettings()).thenAnswer((_) async => throw Exception());
      final cubit = build();
      await cubit.load('a');

      expect(cubit.state.ideas, isA<Failure>());
    });
  });
}
