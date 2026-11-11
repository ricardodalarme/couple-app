import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/couple_photos/cubit/couple_photos_widget_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockWidgetsRepository() extends Mock implements WidgetsRepository;

void main() {
  late WidgetsRepository repository;

  setUp(() {
    repository = _MockWidgetsRepository();
  });

  group('CouplePhotosWidgetCubit', () {
    final overview = WidgetOverview.fake();

    blocTest<CouplePhotosWidgetCubit, CouplePhotosWidgetState>(
      'emits Loading then Success on load and toggles dark preview',
      build: () {
        when(() => repository.loadAndSync()).thenAnswer((_) async => overview);
        return CouplePhotosWidgetCubit(repository: repository);
      },
      act: (cubit) async {
        await cubit.load();
        cubit.setDarkPreview(isDark: true);
      },
      expect: () => [
        const CouplePhotosWidgetState(overview: Loading()),
        CouplePhotosWidgetState(overview: Success(overview)),
        CouplePhotosWidgetState(overview: Success(overview), isDarkPreview: true),
      ],
    );

    test(
      'discreet mode strips cachedPhotoPath so photo widget never renders photo in discreet',
      () {
        final payload = WidgetPayload.fake().copyWith(
          hasPlus: true,
          cachedPhotoPath: '/var/mobile/Containers/Shared/AppGroup/photo.jpg',
        );
        final sanitized = payload.sanitized();
        expect(sanitized.cachedPhotoPath, '/var/mobile/Containers/Shared/AppGroup/photo.jpg');

        final discreetSanitized = payload.copyWith(discreet: true).sanitized();
        expect(discreetSanitized.cachedPhotoPath, isNull);
      },
    );
  });
}
