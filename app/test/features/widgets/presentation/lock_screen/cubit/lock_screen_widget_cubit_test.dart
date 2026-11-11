import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/lock_screen/cubit/lock_screen_widget_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockWidgetsRepository() extends Mock implements WidgetsRepository;

void main() {
  late WidgetsRepository repository;

  setUp(() {
    repository = _MockWidgetsRepository();
  });

  test('load emits Success with the widget overview', () async {
    final overview = WidgetOverview.fake();
    when(() => repository.loadAndSync()).thenAnswer((_) async => overview);

    final cubit = LockScreenWidgetCubit(repository: repository);

    await cubit.load();
    expect(cubit.state.overview, Success(overview));
  });
}
