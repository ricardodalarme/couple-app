import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:flutter_bloc_starter/features/history/presentation/milestone/cubit/milestone_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';

class _MockHistoryRepository() extends Mock implements HistoryRepository;

void main() {
  late HistoryRepository repository;

  setUpAll(() {
    registerFallbackValue(MilestoneKind.custom);
    registerFallbackValue(MilestoneDatePrecision.day);
    registerFallbackValue(HistoryMilestone.fake());
  });

  setUp(() {
    repository = _MockHistoryRepository();
    when(() => repository.getOverview()).thenAnswer((_) async => HistoryOverview.fake());
    when(
      () => repository.saveMilestone(
        id: any(named: 'id'),
        title: any(named: 'title'),
        kind: any(named: 'kind'),
        precision: any(named: 'precision'),
        isShared: any(named: 'isShared'),
        date: any(named: 'date'),
        place: any(named: 'place'),
        body: any(named: 'body'),
        coupleId: any(named: 'coupleId'),
        existing: any(named: 'existing'),
      ),
    ).thenAnswer((_) async {});
    when(() => repository.deleteMilestone(any())).thenAnswer((_) async {});
  });

  MilestoneCubit build() => MilestoneCubit(historyRepository: repository);

  test('supports saving a milestone with unknown date and toggled visibility', () async {
    final cubit = build();
    await cubit.initialize();

    cubit
      ..onTitleChanged('Primeira música')
      ..onKindSelected(MilestoneKind.first)
      ..onPrecisionSelected(MilestoneDatePrecision.unknown)
      ..toggleVisibility();

    expect(cubit.state.isUnknownDate, isTrue);
    expect(cubit.state.isShared, isFalse);
    expect(cubit.state.title.isValid, isTrue);

    await cubit.save();

    verify(
      () => repository.saveMilestone(
        id: any(named: 'id'),
        title: 'Primeira música',
        kind: MilestoneKind.first,
        precision: MilestoneDatePrecision.unknown,
        isShared: false,
        date: null,
        place: '',
        body: '',
        coupleId: 'fake-couple',
        existing: null,
      ),
    ).called(1);
    expect(cubit.state.saveAction, isA<Success<void>>());
  });

  test('saving without a title reports the field error', () async {
    final cubit = build();
    await cubit.initialize();

    await cubit.save();

    expect(cubit.state.title.error, NonEmptyValidationError.empty);
    verifyNever(
      () => repository.saveMilestone(
        id: any(named: 'id'),
        title: any(named: 'title'),
        kind: any(named: 'kind'),
        precision: any(named: 'precision'),
        isShared: any(named: 'isShared'),
        date: any(named: 'date'),
        place: any(named: 'place'),
        body: any(named: 'body'),
        coupleId: any(named: 'coupleId'),
        existing: any(named: 'existing'),
      ),
    );
  });

  test('deletes an existing milestone', () async {
    final existing = HistoryMilestone.fake();
    final cubit = build();
    await cubit.initialize(initialMilestone: existing);

    await cubit.delete();

    verify(() => repository.deleteMilestone(existing)).called(1);
    expect(cubit.state.deleteAction, isA<Success<void>>());
  });
}
