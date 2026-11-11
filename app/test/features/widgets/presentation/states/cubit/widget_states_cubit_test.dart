import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/states/cubit/widget_states_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockWidgetsRepository() extends Mock implements WidgetsRepository;

void main() {
  late WidgetsRepository repository;

  setUp(() {
    repository = _MockWidgetsRepository();
  });

  group('WidgetStatesCubit', () {
    final overview = WidgetOverview.fake();
    final discreetPayload = overview.payload.copyWith(discreet: true).sanitized();

    blocTest<WidgetStatesCubit, WidgetStatesState>(
      'emits Loading then Success on load and updates discreet immediately',
      build: () {
        when(() => repository.loadAndSync()).thenAnswer((_) async => overview);
        when(() => repository.applyDiscreetModeImmediately(discreet: true))
            .thenAnswer((_) async => discreetPayload);
        return WidgetStatesCubit(repository: repository);
      },
      act: (cubit) async {
        await cubit.load();
        await cubit.toggleDiscreet(discreet: true);
      },
      expect: () => [
        const WidgetStatesState(overview: Loading()),
        WidgetStatesState(overview: Success(overview)),
        WidgetStatesState(overview: Success(overview), discreetToggleAction: const Loading()),
        WidgetStatesState(
          overview: Success(
            overview.copyWith(
              payload: discreetPayload,
              preferences: overview.preferences.copyWith(hideInDiscreet: true),
            ),
          ),
          discreetToggleAction: const Success(null),
        ),
      ],
    );

    test(
      'when both discreet and no-partner are active, payload degrades to most neutral state',
      () {
        final bothActive = WidgetPayload.fake()
            .copyWith(discreet: true, isPaired: false)
            .sanitized();

        expect(bothActive.discreet, isTrue);
        expect(bothActive.isPaired, isFalse);
        expect(bothActive.partnerName, isNull);
        expect(bothActive.partnerNote, isNull);
        expect(bothActive.nextDateTitle, isNull);
        expect(bothActive.cachedPhotoPath, isNull);
        expect(bothActive.daysTogetherOn(DateTime(2026, 6, 15)), isNull);
      },
    );
  });
}
