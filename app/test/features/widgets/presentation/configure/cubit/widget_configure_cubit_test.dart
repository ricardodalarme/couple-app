import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/configure/cubit/widget_configure_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockWidgetsRepository() extends Mock implements WidgetsRepository;

void main() {
  late WidgetsRepository repository;

  setUpAll(() {
    registerFallbackValue(WidgetPreferences.fake());
  });

  setUp(() {
    repository = _MockWidgetsRepository();
  });

  test('load populates draft preferences and save persists changes', () async {
    final overview = WidgetOverview.fake();
    when(() => repository.loadAndSync()).thenAnswer((_) async => overview);
    when(() => repository.savePreferences(any())).thenAnswer((invocation) async {
      final prefs = invocation.positionalArguments.first as WidgetPreferences;
      return overview.copyWith(preferences: prefs);
    });

    final cubit = WidgetConfigureCubit(repository: repository);
    await cubit.load();

    cubit
      ..setShowNames(value: false)
      ..setAllowPartnerNotes(value: false)
      ..setContentSource(WidgetContentSource.dailyIdea)
      ..setRotationCadence(WidgetRotationCadence.everySixHours);

    await cubit.save();

    expect(cubit.state.draft.showNames, isFalse);
    expect(cubit.state.draft.allowPartnerNotes, isFalse);
    expect(cubit.state.draft.contentSource, WidgetContentSource.dailyIdea);
    expect(cubit.state.draft.rotationCadence, WidgetRotationCadence.everySixHours);
    expect(cubit.state.saveAction, const Success<void>(null));
    verify(() => repository.savePreferences(any())).called(1);
  });
}
