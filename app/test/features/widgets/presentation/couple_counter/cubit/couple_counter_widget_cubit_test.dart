import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/couple_counter/cubit/couple_counter_widget_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockWidgetsRepository() extends Mock implements WidgetsRepository;

void main() {
  late WidgetsRepository repository;

  setUp(() {
    repository = _MockWidgetsRepository();
  });

  group('CoupleCounterWidgetCubit', () {
    final overview = WidgetOverview.fake();

    blocTest<CoupleCounterWidgetCubit, CoupleCounterWidgetState>(
      'emits Loading then Success on load',
      build: () {
        when(() => repository.loadAndSync()).thenAnswer((_) async => overview);
        return CoupleCounterWidgetCubit(repository: repository);
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        const CoupleCounterWidgetState(overview: Loading()),
        CoupleCounterWidgetState(overview: Success(overview)),
      ],
    );

    test('daysTogetherOn advances by 1 at local midnight', () {
      final payload = WidgetPayload.fake().copyWith(togetherSince: '2025-05-10');
      final beforeMidnight = DateTime(2026, 5, 9, 23, 59, 59);
      final atMidnight = DateTime(2026, 5, 10);

      expect(payload.daysTogetherOn(beforeMidnight), 364);
      expect(payload.daysTogetherOn(atMidnight), 365);
    });
  });
}
