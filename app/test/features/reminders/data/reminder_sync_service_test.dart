import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/models/planned_reminder.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockNotificationsRepository() extends Mock implements NotificationsRepository;

class _MockRemindersRepository() extends Mock implements RemindersRepository;

void main() {
  late NotificationsRepository notifications;
  late RemindersRepository reminders;
  late ReminderSyncService service;

  setUpAll(() {
    registerFallbackValue(DateTime(2026));
    registerFallbackValue((title: '', dailyIdea: '', dates: '', weeklyCard: '', discreet: ''));
  });

  setUp(() {
    notifications = _MockNotificationsRepository();
    reminders = _MockRemindersRepository();
    service = ReminderSyncService(
      notificationsRepository: notifications,
      remindersRepository: reminders,
    );
    when(() => reminders.cancelAll()).thenAnswer((_) async {});
    when(
      () => reminders.reschedule(
        texts: any(named: 'texts'),
        now: any(named: 'now'),
        dateReminders: any(named: 'dateReminders'),
      ),
    ).thenAnswer((_) async => <PlannedReminder>[]);
  });

  test('denied notifications clear every pending reminder and schedule nothing', () async {
    when(() => notifications.currentAccess()).thenAnswer((_) async => NotificationAccess.denied);

    await service.sync();

    verify(() => reminders.cancelAll()).called(1);
    verifyNever(
      () => reminders.reschedule(
        texts: any(named: 'texts'),
        now: any(named: 'now'),
        dateReminders: any(named: 'dateReminders'),
      ),
    );
  });

  test('a failure is swallowed so startup is never blocked', () async {
    when(() => notifications.currentAccess()).thenAnswer((_) async => throw Exception());

    await expectLater(service.sync(), completes);
  });
}
