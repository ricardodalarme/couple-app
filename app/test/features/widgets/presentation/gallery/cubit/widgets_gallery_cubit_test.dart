import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/gallery/cubit/widgets_gallery_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockWidgetsRepository() extends Mock implements WidgetsRepository;

void main() {
  late WidgetsRepository repository;

  setUp(() {
    repository = _MockWidgetsRepository();
  });

  test('load emits Success with WidgetOverview from repository', () async {
    final overview = WidgetOverview.fake();
    when(() => repository.loadAndSync()).thenAnswer((_) async => overview);

    final cubit = WidgetsGalleryCubit(repository: repository);
    await cubit.load();

    expect(cubit.state.overview, Success(overview));
    expect(cubit.state.segment, WidgetGallerySegment.own);
  });

  test('selectSegment switches between own and couple segments', () {
    final cubit = WidgetsGalleryCubit(repository: repository)
      ..selectSegment(WidgetGallerySegment.couple);

    expect(cubit.state.segment, WidgetGallerySegment.couple);
  });

  test('load emits Failure when repository throws', () async {
    when(() => repository.loadAndSync()).thenThrow(Exception('network error'));

    final cubit = WidgetsGalleryCubit(repository: repository);
    await cubit.load();

    expect(cubit.state.overview, isA<Failure>());
  });
}
