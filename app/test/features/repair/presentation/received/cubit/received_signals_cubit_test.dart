import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/received_signal.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/received/cubit/received_signals_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRepairRepository() extends Mock implements RepairRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockRemindersRepository() extends Mock implements RemindersRepository;

class _MockSyncService() extends Mock implements ReminderSyncService;

void main() {
  late RepairRepository repair;
  late ProfileRepository profile;
  late RemindersRepository reminders;
  late ReminderSyncService sync;

  final first = ReceivedSignal(
    id: 's1',
    kind: 'repair',
    createdAt: DateTime(2026, 11, 10),
    body: 'Podemos recomeçar?',
  );
  final second = ReceivedSignal(id: 's2', kind: 'hug', createdAt: DateTime(2026, 11, 10));

  setUpAll(() => registerFallbackValue(DateTime(2026)));

  setUp(() {
    repair = _MockRepairRepository();
    profile = _MockProfileRepository();
    reminders = _MockRemindersRepository();
    sync = _MockSyncService();
    when(
      () => profile.getMyProfile(),
    ).thenAnswer((_) async => const Profile(id: 'me', avatarKind: 'initials', displayName: 'Ana'));
    when(() => repair.getReceivedSignals('me')).thenAnswer((_) async => [first, second]);
    when(
      () => repair.respondToSignal(
        signalId: any(named: 'signalId'),
        response: any(named: 'response'),
      ),
    ).thenAnswer((_) async {});
    when(() => reminders.addFollowUp(any(), now: any(named: 'now'))).thenAnswer((_) async {});
    when(() => sync.sync()).thenAnswer((_) async {});
  });

  ReceivedSignalsCubit build() => ReceivedSignalsCubit(
    repairRepository: repair,
    profileRepository: profile,
    remindersRepository: reminders,
    syncService: sync,
  );

  List<ReceivedSignal> items(ReceivedSignalsCubit cubit) =>
      (cubit.state.signals as Success<List<ReceivedSignal>>).value;

  test('load reads the unanswered messages for the person', () async {
    final cubit = build();

    await cubit.load();

    expect(items(cubit), [first, second]);
  });

  test('answering removes the message and the next one comes up', () async {
    final cubit = build();
    await cubit.load();

    await cubit.respond(first, response: 'talk');

    verify(() => repair.respondToSignal(signalId: 's1', response: 'talk')).called(1);
    expect(items(cubit), [second]);
    expect(cubit.state.answeredCount, 1);
    verifyNever(() => reminders.addFollowUp(any(), now: any(named: 'now')));
  });

  test('later schedules a generic reminder', () async {
    final cubit = build();
    await cubit.load();

    await cubit.respond(first, response: 'later');

    verify(() => reminders.addFollowUp(any(), now: any(named: 'now'))).called(1);
    verify(() => sync.sync()).called(1);
  });

  test('a message with no answer is only marked seen', () async {
    final cubit = build();
    await cubit.load();

    await cubit.respond(second);

    verify(() => repair.respondToSignal(signalId: 's2', response: null)).called(1);
  });

  test('a failed answer keeps the message', () async {
    when(
      () => repair.respondToSignal(
        signalId: any(named: 'signalId'),
        response: any(named: 'response'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    await cubit.load();

    await cubit.respond(first, response: 'talk');

    expect(items(cubit), [first, second]);
    expect(cubit.state.respondAction, isA<Initial>());
  });
}
