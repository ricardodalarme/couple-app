import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/card_encounter/cubit/card_encounter_widget_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockWidgetsRepository() extends Mock implements WidgetsRepository;

void main() {
  late WidgetsRepository repository;

  setUp(() {
    repository = _MockWidgetsRepository();
  });

  group('CardEncounterWidgetCubit', () {
    final overview = WidgetOverview.fake();

    blocTest<CardEncounterWidgetCubit, CardEncounterWidgetState>(
      'emits Loading then Success on load and toggles dark preview',
      build: () {
        when(() => repository.loadAndSync()).thenAnswer((_) async => overview);
        return CardEncounterWidgetCubit(repository: repository);
      },
      act: (cubit) async {
        await cubit.load();
        cubit.setDarkPreview(isDark: true);
      },
      expect: () => [
        const CardEncounterWidgetState(overview: Loading()),
        CardEncounterWidgetState(overview: Success(overview)),
        CardEncounterWidgetState(overview: Success(overview), isDarkPreview: true),
      ],
    );

    test('daysUntilNextDateOn removes past dates and pause active overrides card state', () {
      final now = DateTime(2026, 6, 15, 10);
      final pastDatePayload = WidgetPayload.fake().copyWith(nextDateOn: '2026-06-14');
      final todayDatePayload = WidgetPayload.fake().copyWith(nextDateOn: '2026-06-15');
      final futureDatePayload = WidgetPayload.fake().copyWith(nextDateOn: '2026-07-27');

      expect(pastDatePayload.daysUntilNextDateOn(now), isNull);
      expect(todayDatePayload.daysUntilNextDateOn(now), 0);
      expect(futureDatePayload.daysUntilNextDateOn(now), 42);

      final pausedPayload = WidgetPayload.fake().copyWith(
        pauseReturnAt: '2026-06-15T12:00:00Z',
        cardState: 'ready',
      );
      expect(pausedPayload.isPauseActiveOn(DateTime.utc(2026, 6, 15, 11)), isTrue);
      expect(pausedPayload.isPauseActiveOn(DateTime.utc(2026, 6, 15, 13)), isFalse);
    });
  });
}
