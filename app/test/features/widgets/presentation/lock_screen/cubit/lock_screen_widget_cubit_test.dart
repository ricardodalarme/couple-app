import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/today/data/repositories/today_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/lock_screen/cubit/lock_screen_widget_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockWidgetsRepository() extends Mock implements WidgetsRepository;

class _MockTodayRepository() extends Mock implements TodayRepository;

void main() {
  late WidgetsRepository repository;
  late TodayRepository todayRepository;

  setUp(() {
    repository = _MockWidgetsRepository();
    todayRepository = _MockTodayRepository();
  });

  test('load emits Success and endPause ends active pause and reloads widget state', () async {
    final overview = WidgetOverview.fake();
    when(() => repository.loadAndSync()).thenAnswer((_) async => overview);
    when(() => todayRepository.endPause()).thenAnswer((_) async {});

    final cubit = LockScreenWidgetCubit(repository: repository, todayRepository: todayRepository);

    await cubit.load();
    expect(cubit.state.overview, Success(overview));

    await cubit.endPause();
    verify(() => todayRepository.endPause()).called(1);
    expect(cubit.state.endPauseAction, const Success<void>(null));
  });
}
