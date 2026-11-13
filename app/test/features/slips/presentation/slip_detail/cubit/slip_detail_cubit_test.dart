import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_detail.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slip_detail/cubit/slip_detail_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSlipRepository() extends Mock implements SlipRepository;

void main() {
  late SlipRepository repository;
  final slip = SlipDetail(
    id: 's1',
    body: 'Fez café',
    kind: 'quick',
    createdAt: DateTime(2026, 11, 9),
    forCard: true,
  );

  setUpAll(() => registerFallbackValue(slip));

  setUp(() {
    repository = _MockSlipRepository();
    when(() => repository.getSlip('s1')).thenAnswer((_) async => slip);
    when(() => repository.updateSlip(any())).thenAnswer((_) async {});
    when(
      () => repository.setArchived(
        id: any(named: 'id'),
        archived: any(named: 'archived'),
      ),
    ).thenAnswer((_) async {});
    when(() => repository.deleteSlip(any())).thenAnswer((_) async {});
  });

  SlipDetailCubit build() => SlipDetailCubit(slipRepository: repository);

  blocTest<SlipDetailCubit, SlipDetailState>(
    'load reads the slip',
    build: build,
    act: (cubit) => cubit.load('s1'),
    expect: () => [const SlipDetailState(), SlipDetailState(slip: Success(slip))],
  );

  blocTest<SlipDetailCubit, SlipDetailState>(
    'a deleted slip loads as a success with no slip',
    build: () {
      when(() => repository.getSlip('gone')).thenAnswer((_) async => null);
      return build();
    },
    act: (cubit) => cubit.load('gone'),
    expect: () => [
      const SlipDetailState(),
      const SlipDetailState(slip: Success<SlipDetail?>(null)),
    ],
  );

  test('editing needs a changed, non-empty text', () async {
    final cubit = build();
    await cubit.load('s1');
    cubit.startEditing();

    await cubit.saveEdit();
    verifyNever(() => repository.updateSlip(any()));

    cubit.onBodyChanged('   ');
    await cubit.saveEdit();
    expect(cubit.state.draftBody.errorName, 'empty');
    verifyNever(() => repository.updateSlip(any()));

    cubit.onBodyChanged('Fez café e pão');
    await cubit.saveEdit();
    expect(cubit.state.draftBody.isValid, isTrue);
    verify(() => repository.updateSlip(any())).called(1);
  });

  test('saveEdit updates the slip and leaves edit mode', () async {
    final cubit = build();
    await cubit.load('s1');
    cubit
      ..startEditing()
      ..onBodyChanged('Fez café e pão');

    await cubit.saveEdit();

    verify(() => repository.updateSlip(slip.copyWith(body: 'Fez café e pão'))).called(1);
    expect(cubit.state.isEditing, isFalse);
    expect(cubit.state.current?.body, 'Fez café e pão');
  });

  test('an invisible slip cannot be moved into a card', () async {
    final invisible = SlipDetail(
      id: 's2',
      body: 'Marquei a consulta',
      kind: 'invisible',
      createdAt: DateTime(2026, 11, 9),
      forCard: false,
    );
    when(() => repository.getSlip('s2')).thenAnswer((_) async => invisible);
    final cubit = build();
    await cubit.load('s2');

    await cubit.setForCard(value: true);

    verifyNever(() => repository.updateSlip(any()));
  });

  test('archive then restore flips the flag', () async {
    final cubit = build();
    await cubit.load('s1');

    await cubit.toggleArchive();
    expect(cubit.state.current?.isArchived, isTrue);

    await cubit.toggleArchive();
    expect(cubit.state.current?.isArchived, isFalse);
  });

  blocTest<SlipDetailCubit, SlipDetailState>(
    'a failed save keeps the slip and re-enables actions',
    build: () {
      when(() => repository.updateSlip(any()))
          .thenThrow(const LocalizedException(l10nKey: 'RATE_LIMITED'));
      return build();
    },
    seed: () => SlipDetailState(slip: Success(slip)),
    act: (cubit) => cubit.setForCard(value: false),
    expect: () => [
      SlipDetailState(slip: Success(slip), saveAction: const Loading()),
      isA<SlipDetailState>().having((s) => s.saveAction, 'saveAction', isA<Failure>()),
      SlipDetailState(slip: Success(slip)),
    ],
  );

  blocTest<SlipDetailCubit, SlipDetailState>(
    'delete succeeds once and is not repeated while running',
    build: build,
    seed: () => SlipDetailState(slip: Success(slip)),
    act: (cubit) async {
      await cubit.delete();
    },
    expect: () => [
      SlipDetailState(slip: Success(slip), deleteAction: const Loading()),
      SlipDetailState(slip: Success(slip), deleteAction: const Success(null)),
    ],
    verify: (_) => verify(() => repository.deleteSlip('s1')).called(1),
  );
}
