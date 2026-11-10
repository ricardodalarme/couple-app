import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/reminders/data/models/planned_reminder.dart';
import 'package:flutter_bloc_starter/features/reminders/data/models/reminder_preferences.dart';
import 'package:flutter_bloc_starter/features/reminders/data/planner/reminder_planner.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/guided_session.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/repair_path.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/guided/cubit/guided_repair_cubit.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/learning/cubit/learning_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRepairRepository() extends Mock implements RepairRepository;

class _MockRemindersRepository() extends Mock implements RemindersRepository;

class _MockSyncService() extends Mock implements ReminderSyncService;

void main() {
  late RepairRepository repair;
  late RemindersRepository reminders;
  late ReminderSyncService sync;

  setUpAll(() {
    registerFallbackValue(const GuidedSession(id: 'x'));
    registerFallbackValue(DateTime(2026));
    registerFallbackValue(RepairPath.guided);
  });

  setUp(() {
    repair = _MockRepairRepository();
    reminders = _MockRemindersRepository();
    sync = _MockSyncService();
    when(() => repair.openGuidedSession()).thenAnswer((_) async => const GuidedSession(id: 's1'));
    when(() => repair.saveProgress(any())).thenAnswer((_) async {});
    when(
      () => repair.completeSession(
        id: any(named: 'id'),
        now: any(named: 'now'),
        feeling: any(named: 'feeling'),
      ),
    ).thenAnswer((_) async {});
    when(() => reminders.addFollowUp(any(), now: any(named: 'now'))).thenAnswer((_) async {});
    when(() => sync.sync()).thenAnswer((_) async {});
  });

  GuidedRepairCubit build() => GuidedRepairCubit(
    repairRepository: repair,
    remindersRepository: reminders,
    syncService: sync,
  );

  test('load resumes the unfinished repair', () async {
    when(() => repair.openGuidedSession())
        .thenAnswer((_) async => const GuidedSession(id: 's1', step: 2, answers: ['a', 'b', '']));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.current?.step, 2);
    expect(cubit.state.current?.answers, ['a', 'b', '']);
  });

  test('load starts a guided session when none is open', () async {
    when(() => repair.openGuidedSession()).thenAnswer((_) async => null);
    when(
      () => repair.startSession(
        id: any(named: 'id'),
        path: any(named: 'path'),
        intensity: any(named: 'intensity'),
      ),
    ).thenAnswer((_) async {});
    final cubit = build();

    await cubit.load();

    verify(
      () => repair.startSession(
        id: any(named: 'id'),
        path: RepairPath.guided,
        intensity: any(named: 'intensity'),
      ),
    ).called(1);
    expect(cubit.state.current?.step, 0);
  });

  test('next saves the answers and the step, and an empty step is allowed', () async {
    final cubit = build();
    await cubit.load();
    cubit.onAnswerChanged('Discutimos');

    await cubit.next();

    final saved = verify(() => repair.saveProgress(captureAny())).captured.single as GuidedSession;
    expect(saved.step, 1);
    expect(saved.answers.first, 'Discutimos');
    await cubit.next();
    expect(cubit.state.current?.step, 2);
  });

  test('the step never goes below the first or past the final one', () async {
    final cubit = build();
    await cubit.load();

    await cubit.back();
    expect(cubit.state.current?.step, 0);

    for (var i = 0; i < 6; i++) {
      await cubit.next();
    }
    expect(cubit.state.current?.step, guidedWrittenSteps);
  });

  test('finish completes the session and schedules the follow-up', () async {
    final cubit = build();
    await cubit.load();
    cubit
      ..onFeelingChosen('calmer')
      ..onFollowUpChosen(FollowUp.tomorrow);

    await cubit.finish();

    verify(
      () => repair.completeSession(
        id: 's1',
        now: any(named: 'now'),
        feeling: 'calmer',
      ),
    ).called(1);
    verify(() => reminders.addFollowUp(any(), now: any(named: 'now'))).called(1);
    verify(() => sync.sync()).called(1);
    expect(cubit.state.completeAction, isA<Success<void>>());
  });

  test('no follow-up means no reminder', () async {
    final cubit = build();
    await cubit.load();

    await cubit.finish();

    verifyNever(() => reminders.addFollowUp(any(), now: any(named: 'now')));
  });

  test('a failed finish keeps the session open', () async {
    when(
      () => repair.completeSession(
        id: any(named: 'id'),
        now: any(named: 'now'),
        feeling: any(named: 'feeling'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    await cubit.load();

    await cubit.finish();

    expect(cubit.state.completeAction, isA<Initial>());
    expect(cubit.state.current, isNotNull);
  });

  test('stored drafts that cannot be read give empty answers', () {
    final session = GuidedSession.fromStored(id: 'x', step: 9, draft: 'not json');

    expect(session.answers, ['', '', '']);
    expect(session.step, guidedWrittenSteps);
  });

  test('a follow-up is planned even when the idea reminders are switched off', () {
    const planner = ReminderPlanner(texts: {}, discreetText: 'Abra o app para ver.');
    final now = DateTime(2026, 11, 10, 12);

    final plan = planner.plan(
      preferences: const ReminderPreferences(enabled: {}),
      candidates: [ReminderCandidate(kind: ReminderKind.followUp, at: DateTime(2026, 11, 11, 18))],
      now: now,
    );

    expect(plan, hasLength(1));
    expect(plan.single.text, 'Abra o app para ver.');
  });

  group('LearningCubit', () {
    test('a learning needs a kind and a note', () async {
      when(
        () => repair.saveLearning(
          id: any(named: 'id'),
          kind: any(named: 'kind'),
          note: any(named: 'note'),
          sessionId: any(named: 'sessionId'),
        ),
      ).thenAnswer((_) async {});
      when(() => repair.getLearnings()).thenAnswer((_) async => const []);
      final cubit = LearningCubit(repairRepository: repair)..onNoteChanged('Preciso de calma');
      expect(cubit.state.canSave, isFalse);

      cubit.onKindChosen('need');
      expect(cubit.state.canSave, isTrue);

      await cubit.save(sessionId: 's1');

      verify(
        () => repair.saveLearning(
          id: any(named: 'id'),
          kind: 'need',
          note: 'Preciso de calma',
          sessionId: 's1',
        ),
      ).called(1);
      expect(cubit.state.note, '');
      expect(cubit.state.kind, isNull);
    });

    test('delete removes the learning from the list', () async {
      final learning = Learning(id: 'l1', kind: 'need', note: 'x', createdAt: DateTime(2026));
      when(() => repair.getLearnings()).thenAnswer((_) async => [learning]);
      when(() => repair.deleteLearning('l1')).thenAnswer((_) async {});
      final cubit = LearningCubit(repairRepository: repair);
      await cubit.load();

      await cubit.delete('l1');

      expect((cubit.state.learnings as Success<List<Learning>>).value, isEmpty);
    });
  });
}
