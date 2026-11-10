import 'package:flutter_bloc_starter/features/reminders/data/data_sources/reminders_local_data_source.dart';
import 'package:flutter_bloc_starter/features/reminders/data/models/reminder_preferences.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_notification_service/local_notification_service.dart';
import 'package:mocktail/mocktail.dart';

class _MockLocal() extends Mock implements RemindersLocalDataSource;

class _MockNotifications() extends Mock implements LocalNotificationService;

const ReminderTexts _texts = (
  title: 'Repara',
  dailyIdea: 'Ideia',
  dates: 'Data',
  weeklyCard: 'Cartão',
  discreet: 'Abra o app',
);

void main() {
  late RemindersLocalDataSource local;
  late LocalNotificationService notifications;
  late RemindersRepository repository;
  List<LocalNotificationRequest>? scheduled;

  setUpAll(() {
    registerFallbackValue(<LocalNotificationRequest>[]);
    registerFallbackValue(<DateTime>[]);
  });

  setUp(() {
    local = _MockLocal();
    notifications = _MockNotifications();
    scheduled = null;
    repository = RemindersRepository(localDataSource: local, notificationService: notifications);
    when(() => local.read()).thenReturn(const ReminderPreferences());
    when(() => local.readCustom()).thenReturn(const []);
    when(() => local.writeCustom(any())).thenAnswer((_) async {});
    when(() => notifications.replaceAll(any())).thenAnswer((invocation) async {
      scheduled = invocation.positionalArguments.first as List<LocalNotificationRequest>;
    });
  });

  group('candidatesFor', () {
    test('plans an idea every evening and a card on Sundays for two weeks', () {
      final candidates = RemindersRepository.candidatesFor(DateTime(2026, 11, 9, 9));

      expect(
        candidates.where((candidate) => candidate.kind == ReminderKind.dailyIdea),
        hasLength(reminderHorizonDays),
      );
      final cards = candidates.where((candidate) => candidate.kind == ReminderKind.weeklyCard);
      expect(cards, hasLength(2));
      expect(cards.every((candidate) => candidate.at.weekday == DateTime.sunday), isTrue);
    });

    test('evening reminders sit at 18:00', () {
      final candidates = RemindersRepository.candidatesFor(DateTime(2026, 11, 9, 9));

      expect(candidates.every((candidate) => candidate.at.hour == reminderHour), isTrue);
    });
  });

  group('reschedule', () {
    test('sends the plan to the device with the fixed texts', () async {
      final plan = await repository.reschedule(texts: _texts, now: DateTime(2026, 11, 9, 9));

      expect(plan, isNotEmpty);
      expect(scheduled, hasLength(plan.length));
      expect(scheduled!.first.title, 'Repara');
      expect(scheduled!.map((request) => request.body).toSet(), {'Ideia', 'Cartão'});
    });

    test('at most two per day and none during quiet hours', () async {
      await repository.reschedule(texts: _texts, now: DateTime(2026, 11, 9, 9));

      final perDay = <int, int>{};
      for (final request in scheduled!) {
        perDay.update(request.at.day, (count) => count + 1, ifAbsent: () => 1);
        expect(request.at.hour, isNot(inInclusiveRange(22, 23)));
        expect(request.at.hour, greaterThanOrEqualTo(8));
      }
      expect(perDay.values.every((count) => count <= 2), isTrue);
    });

    test('discreet mode hides what the reminder is about', () async {
      when(() => local.read()).thenReturn(const ReminderPreferences(isDiscreet: true));

      await repository.reschedule(texts: _texts, now: DateTime(2026, 11, 9, 9));

      expect(scheduled!.map((request) => request.body).toSet(), {'Abra o app'});
    });

    test('a paused person schedules nothing and clears what was pending', () async {
      when(() => local.read()).thenReturn(const ReminderPreferences(isPaused: true));

      await repository.reschedule(texts: _texts, now: DateTime(2026, 11, 9, 9));

      expect(scheduled, isEmpty);
    });

    test('a custom reminder is placed with the others', () async {
      when(() => local.readCustom()).thenReturn([DateTime(2026, 11, 10, 20)]);

      await repository.reschedule(texts: _texts, now: DateTime(2026, 11, 9, 9));

      expect(scheduled!.any((request) => request.at == DateTime(2026, 11, 10, 20)), isTrue);
    });

    test('a custom reminder inside quiet hours moves out of them', () async {
      when(() => local.readCustom()).thenReturn([DateTime(2026, 11, 10, 23)]);

      await repository.reschedule(texts: _texts, now: DateTime(2026, 11, 9, 9));

      expect(scheduled!.any((request) => request.at == DateTime(2026, 11, 11, 8)), isTrue);
    });

    test('adding a custom reminder drops the ones already in the past', () async {
      final now = DateTime(2026, 11, 9, 9);
      when(() => local.readCustom())
          .thenReturn([DateTime(2026, 11, 8, 20), DateTime(2026, 11, 12, 20)]);

      await repository.addCustomReminder(DateTime(2026, 11, 10, 9), now: now);

      final saved = verify(() => local.writeCustom(captureAny())).captured.single as List<DateTime>;
      expect(saved, [DateTime(2026, 11, 12, 20), DateTime(2026, 11, 10, 9)]);
    });

    test('a failing device call is reported', () {
      when(() => notifications.replaceAll(any())).thenAnswer((_) async => throw Exception());

      expect(
        () => repository.reschedule(texts: _texts, now: DateTime(2026, 11, 9, 9)),
        throwsA(isA<Exception>()),
      );
    });
  });
}
