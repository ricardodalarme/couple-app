import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/notification_preferences.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/preferences/cubit/notification_preferences_cubit.dart';
import 'package:flutter_bloc_starter/features/reminders/data/models/reminder_preferences.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockNotificationsRepository() extends Mock implements NotificationsRepository;

class _MockRemindersRepository() extends Mock implements RemindersRepository;

class _MockSyncService() extends Mock implements ReminderSyncService;

void main() {
  late NotificationsRepository notifications;
  late RemindersRepository reminders;
  late ReminderSyncService sync;

  setUpAll(() {
    registerFallbackValue(const NotificationPreferences());
    registerFallbackValue(const ReminderPreferences());
  });

  setUp(() {
    notifications = _MockNotificationsRepository();
    reminders = _MockRemindersRepository();
    sync = _MockSyncService();
    when(() => notifications.currentAccess()).thenAnswer((_) async => NotificationAccess.granted);
    when(() => notifications.getPreferences())
        .thenAnswer((_) async => const NotificationPreferences());
    when(() => notifications.savePreferences(any())).thenAnswer((_) async {});
    when(() => reminders.getPreferences()).thenReturn(const ReminderPreferences());
    when(() => reminders.savePreferences(any())).thenAnswer((_) async {});
    when(() => sync.sync()).thenAnswer((_) async {});
  });

  NotificationPreferencesCubit build() => NotificationPreferencesCubit(
    notificationsRepository: notifications,
    remindersRepository: reminders,
    syncService: sync,
  );

  test('load reads the choices and whether the system blocks notifications', () async {
    when(() => notifications.currentAccess()).thenAnswer((_) async => NotificationAccess.denied);
    final cubit = build();

    await cubit.load();

    expect(cubit.state.current, const NotificationPreferences());
    expect(cubit.state.isSystemOff, isTrue);
  });

  test('switching a type off saves it and mirrors it on the device', () async {
    final cubit = build();
    await cubit.load();

    await cubit.setTypeEnabled('daily_idea', value: false);

    expect(cubit.state.current?.allows('daily_idea'), isFalse);
    verify(
      () =>
          notifications.savePreferences(const NotificationPreferences(mutedTypes: {'daily_idea'})),
    ).called(1);
    final saved =
        verify(() => reminders.savePreferences(captureAny())).captured.single
            as ReminderPreferences;
    expect(saved.enabled, isNot(contains(ReminderKind.dailyIdea)));
    verify(() => sync.sync()).called(1);
  });

  test('turning everything off pauses the local reminders', () async {
    final cubit = build();
    await cubit.load();

    await cubit.setEnabled(value: false);

    final saved =
        verify(() => reminders.savePreferences(captureAny())).captured.single
            as ReminderPreferences;
    expect(saved.isPaused, isTrue);
  });

  test('quiet hours that cross midnight are flagged', () async {
    final cubit = build();
    await cubit.load();

    expect(cubit.state.current?.crossesMidnight, isTrue);

    await cubit.setQuietStart(6);
    await cubit.setQuietEnd(7);

    expect(cubit.state.current?.crossesMidnight, isFalse);
  });

  test('a failed save keeps the previous choice', () async {
    when(() => notifications.savePreferences(any()))
        .thenThrow(const LocalizedException(l10nKey: 'RATE_LIMITED'));
    final cubit = build();
    await cubit.load();

    await cubit.setCardDay(3);

    expect(cubit.state.current?.cardDay, 0);
    expect(cubit.state.saveAction, isA<Initial>());
    verifyNever(() => sync.sync());
  });

  test('choosing the same value again does not call the server', () async {
    final cubit = build();
    await cubit.load();

    await cubit.setCardHour(9);

    verifyNever(() => notifications.savePreferences(any()));
  });
}
