import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slip_kind/cubit/slip_kind_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSlipRepository() extends Mock implements SlipRepository;

void main() {
  late SlipRepository repository;

  setUpAll(() => registerFallbackValue(DateTime(2026)));

  setUp(() {
    repository = _MockSlipRepository();
    when(
      () => repository.saveQuick(
        id: any(named: 'id'),
        body: any(named: 'body'),
        createdAt: any(named: 'createdAt'),
        category: any(named: 'category'),
        kind: any(named: 'kind'),
        feeling: any(named: 'feeling'),
        planNote: any(named: 'planNote'),
        workArea: any(named: 'workArea'),
      ),
    ).thenAnswer((_) async => SlipSaveOutcome.synced);
    when(
      () => repository.saveDraft(
        text: any(named: 'text'),
        now: any(named: 'now'),
      ),
    ).thenAnswer((_) async {});
  });

  SlipKindCubit build() => SlipKindCubit(slipRepository: repository);

  void verifyNoSave() => verifyNever(
    () => repository.saveQuick(
      id: any(named: 'id'),
      body: any(named: 'body'),
      createdAt: any(named: 'createdAt'),
      category: any(named: 'category'),
      kind: any(named: 'kind'),
      feeling: any(named: 'feeling'),
      planNote: any(named: 'planNote'),
      workArea: any(named: 'workArea'),
    ),
  );

  test('start keeps the carried text and falls back to specific for unknown kinds', () {
    final cubit = build()..start(kind: 'nope', text: 'Fez café');

    expect(cubit.state.kind, 'specific');
    expect(cubit.state.text.value, 'Fez café');
  });

  test('switching the kind keeps the text', () {
    final cubit = build()
      ..start(kind: 'specific', text: 'Fez café')
      ..onKindChanged('invisible');

    expect(cubit.state.kind, 'invisible');
    expect(cubit.state.text.value, 'Fez café');
  });

  test('keeping a quick draft saves the current text', () async {
    final cubit = build()
      ..start(kind: 'specific', text: 'Fez café')
      ..onTextChanged('Fez café e pão');

    await cubit.keepQuickDraft();

    verify(
      () => repository.saveDraft(text: 'Fez café e pão', now: any(named: 'now')),
    ).called(1);
  });

  test('if-then needs the plan before saving', () async {
    final cubit = build()
      ..start(kind: 'if_then', text: 'Quando eu estiver cansada')
      ..onPlanChanged('  ');

    await cubit.save();
    expect(cubit.state.plan.errorName, 'empty');
    verifyNoSave();

    cubit.onTextChanged('');
    await cubit.save();
    expect(cubit.state.text.errorName, 'empty');
    verifyNoSave();

    cubit
      ..onTextChanged('Quando eu estiver cansada')
      ..onPlanChanged('peço um tempo');
    await cubit.save();

    verify(
      () => repository.saveQuick(
        id: any(named: 'id'),
        body: 'Quando eu estiver cansada',
        createdAt: any(named: 'createdAt'),
        kind: 'if_then',
        feeling: null,
        planNote: 'peço um tempo',
        workArea: null,
      ),
    ).called(1);
  });

  test('specific rejects an over-long feeling', () async {
    final cubit = build()
      ..start(kind: 'specific', text: 'Fez café')
      ..onFeelingChanged('a' * (slipKindNoteMaxLength + 1));

    await cubit.save();

    expect(cubit.state.feeling.errorName, 'tooLong');
    verifyNoSave();
  });

  test('invisible work area can be toggled off', () {
    final cubit = build()
      ..onWorkAreaToggled('kids')
      ..onWorkAreaToggled('kids');

    expect(cubit.state.workArea, isNull);
  });

  test('saving an if-then slip sends the plan note and no work area', () async {
    final cubit = build()
      ..start(kind: 'if_then', text: 'Quando eu estiver cansada')
      ..onPlanChanged('peço um tempo')
      ..onWorkAreaToggled('kids');

    await cubit.save();

    verify(
      () => repository.saveQuick(
        id: any(named: 'id'),
        body: 'Quando eu estiver cansada',
        createdAt: any(named: 'createdAt'),
        kind: 'if_then',
        feeling: null,
        planNote: 'peço um tempo',
        workArea: null,
      ),
    ).called(1);
  });

  test('saving an invisible slip sends the work area', () async {
    final cubit = build()
      ..start(kind: 'invisible', text: 'Marquei a consulta')
      ..onWorkAreaToggled('planning');

    await cubit.save();

    verify(
      () => repository.saveQuick(
        id: any(named: 'id'),
        body: 'Marquei a consulta',
        createdAt: any(named: 'createdAt'),
        kind: 'invisible',
        feeling: null,
        planNote: null,
        workArea: 'planning',
      ),
    ).called(1);
    expect(cubit.state.saveAction.isLoading, isFalse);
  });
}
