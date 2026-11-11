import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/cubit/history_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockHistoryRepository() extends Mock implements HistoryRepository;

void main() {
  late HistoryRepository repository;
  final overview = HistoryOverview.fake();

  setUp(() {
    repository = _MockHistoryRepository();
    when(() => repository.getOverview()).thenAnswer((_) async => overview);
  });

  HistoryCubit build() => HistoryCubit(historyRepository: repository);

  test('load emits Success with overview', () async {
    final cubit = build();
    await cubit.load();
    expect(cubit.state.overview, Success(overview));
  });

  test('selectYear, selectUnknownYear, and showMoreYears update timeline pagination', () {
    final cubit = build()
      ..selectYear(2025)
      ..showMoreYears();

    expect(cubit.state.selectedYear, 2025);
    expect(cubit.state.showUnknownOnly, isFalse);
    expect(cubit.state.visibleYearCount, 3);

    cubit.selectUnknownYear();
    expect(cubit.state.selectedYear, isNull);
    expect(cubit.state.showUnknownOnly, isTrue);

    cubit.selectYear(null);
    expect(cubit.state.selectedYear, isNull);
    expect(cubit.state.showUnknownOnly, isFalse);
  });

  test('resets the year filter when a reload no longer contains it', () async {
    final cubit = build();
    await cubit.load();
    cubit.selectYear(2024);

    await cubit.load();

    expect(cubit.state.selectedYear, isNull);
    expect(cubit.state.showUnknownOnly, isFalse);
  });
}
