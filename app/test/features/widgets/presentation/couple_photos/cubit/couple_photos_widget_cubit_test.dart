import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:file_picker_service/file_picker_service.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/couple_photo_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/couple_photos/cubit/couple_photos_widget_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockWidgetsRepository() extends Mock implements WidgetsRepository;

class _MockCouplePhotoRepository() extends Mock implements CouplePhotoRepository;

class _MockFilePickerService() extends Mock implements FilePickerService;

final class _FakePlatformFile({
  @override required final String name,
  required final Uint8List bytes,
}) extends PlatformFile {
  @override
  Uri get uri => Uri.file('/tmp/$name');

  @override
  Never get xFile => throw UnimplementedError();

  @override
  int? lengthSync() => bytes.length;

  @override
  Future<int?> length() async => bytes.length;

  @override
  Future<Uint8List> readAsBytes() async => bytes;

  @override
  Stream<Uint8List> readAsByteStream() => Stream.value(bytes);
}

void main() {
  late WidgetsRepository widgetsRepository;
  late CouplePhotoRepository couplePhotoRepository;
  late FilePickerService filePickerService;
  final bytes = Uint8List.fromList([1, 2, 3]);

  setUpAll(() {
    registerFallbackValue(FileType.any);
    registerFallbackValue(Uint8List(0));
  });

  setUp(() {
    widgetsRepository = _MockWidgetsRepository();
    couplePhotoRepository = _MockCouplePhotoRepository();
    filePickerService = _MockFilePickerService();

    when(() => widgetsRepository.loadAndSync()).thenAnswer((_) async => WidgetOverview.fake());
    when(
      () => couplePhotoRepository.upload(
        bytes: any(named: 'bytes'),
        contentType: any(named: 'contentType'),
      ),
    ).thenAnswer((_) async {});
    when(() => couplePhotoRepository.remove()).thenAnswer((_) async {});
    when(
      () => filePickerService.pickFile(
        dialogTitle: any(named: 'dialogTitle'),
        type: any(named: 'type'),
        allowedExtensions: any(named: 'allowedExtensions'),
      ),
    ).thenAnswer((_) async => _FakePlatformFile(name: 'photo.jpg', bytes: bytes));
  });

  CouplePhotosWidgetCubit build() => CouplePhotosWidgetCubit(
    widgetsRepository: widgetsRepository,
    couplePhotoRepository: couplePhotoRepository,
    filePickerService: filePickerService,
  );

  group('load', () {
    blocTest<CouplePhotosWidgetCubit, CouplePhotosWidgetState>(
      'emits Loading then Success and toggles dark preview',
      build: build,
      act: (cubit) async {
        await cubit.load();
        cubit.setDarkPreview(isDark: true);
      },
      expect: () => [
        const CouplePhotosWidgetState(overview: Loading()),
        CouplePhotosWidgetState(overview: Success(WidgetOverview.fake())),
        CouplePhotosWidgetState(overview: Success(WidgetOverview.fake()), isDarkPreview: true),
      ],
    );
  });

  group('choosePhoto', () {
    test('uploads the picked image as a supported content type', () async {
      final cubit = build();
      addTearDown(cubit.close);
      await cubit.load();

      await cubit.choosePhoto();

      expect(cubit.state.chooseAction, const Success<void>(null));
      expect(cubit.state.localPreview, isNull);
      verify(() => couplePhotoRepository.upload(bytes: bytes, contentType: 'image/jpeg')).called(1);
    });

    test('rejects an image above 8 MB before uploading', () async {
      when(
        () => filePickerService.pickFile(
          dialogTitle: any(named: 'dialogTitle'),
          type: any(named: 'type'),
          allowedExtensions: any(named: 'allowedExtensions'),
        ),
      ).thenAnswer(
        (_) async => _FakePlatformFile(
          name: 'big.jpg',
          bytes: Uint8List(CouplePhotoRepository.maxBytes + 1),
        ),
      );
      final cubit = build();
      addTearDown(cubit.close);
      await cubit.load();

      await cubit.choosePhoto();

      expect(
        cubit.state.chooseAction,
        const Failure(LocalizedException(l10nKey: 'COUPLE_PHOTO_INVALID')),
      );
      verifyNever(
        () => couplePhotoRepository.upload(
          bytes: any(named: 'bytes'),
          contentType: any(named: 'contentType'),
        ),
      );
    });

    test('rejects a file that is not an image', () async {
      when(
        () => filePickerService.pickFile(
          dialogTitle: any(named: 'dialogTitle'),
          type: any(named: 'type'),
          allowedExtensions: any(named: 'allowedExtensions'),
        ),
      ).thenAnswer((_) async => _FakePlatformFile(name: 'notes.pdf', bytes: bytes));
      final cubit = build();
      addTearDown(cubit.close);
      await cubit.load();

      await cubit.choosePhoto();

      expect(
        cubit.state.chooseAction,
        const Failure(LocalizedException(l10nKey: 'COUPLE_PHOTO_INVALID')),
      );
      verifyNever(
        () => couplePhotoRepository.upload(
          bytes: any(named: 'bytes'),
          contentType: any(named: 'contentType'),
        ),
      );
    });

    test('clears the local preview when the upload fails', () async {
      when(
        () => couplePhotoRepository.upload(
          bytes: any(named: 'bytes'),
          contentType: any(named: 'contentType'),
        ),
      ).thenThrow(Exception('upload failed'));
      final cubit = build();
      addTearDown(cubit.close);
      await cubit.load();

      await cubit.choosePhoto();

      expect(cubit.state.chooseAction, isA<Failure>());
      expect(cubit.state.localPreview, isNull);
    });

    test('resets the action when the picker is cancelled so no stale toast fires', () async {
      final cubit = build();
      addTearDown(cubit.close);
      await cubit.load();
      await cubit.choosePhoto();
      expect(cubit.state.chooseAction, const Success<void>(null));

      when(
        () => filePickerService.pickFile(
          dialogTitle: any(named: 'dialogTitle'),
          type: any(named: 'type'),
          allowedExtensions: any(named: 'allowedExtensions'),
        ),
      ).thenAnswer((_) async => null);
      await cubit.choosePhoto();

      expect(cubit.state.chooseAction, const Initial());
      verify(
        () => couplePhotoRepository.upload(
          bytes: any(named: 'bytes'),
          contentType: any(named: 'contentType'),
        ),
      ).called(1);
    });

    test('keeps the photo saved when the post-upload refresh fails', () async {
      var loads = 0;
      when(() => widgetsRepository.loadAndSync()).thenAnswer((_) async {
        loads++;
        if (loads > 1) throw Exception('offline');
        return WidgetOverview.fake();
      });
      final cubit = build();
      addTearDown(cubit.close);
      await cubit.load();

      await cubit.choosePhoto();

      expect(cubit.state.chooseAction, const Success<void>(null));
      final overview = cubit.state.overview;
      expect(overview, isA<Success<WidgetOverview>>());
      expect((overview as Success<WidgetOverview>).value.hasPhoto, isTrue);
    });

    test('does nothing when the person has no partner', () async {
      when(() => widgetsRepository.loadAndSync()).thenAnswer(
        (_) async =>
            WidgetOverview.fake().copyWith(payload: WidgetPayload.fake().copyWith(isPaired: false)),
      );
      final cubit = build();
      addTearDown(cubit.close);
      await cubit.load();

      await cubit.choosePhoto();

      expect(cubit.state.chooseAction, const Initial());
      verifyNever(
        () => filePickerService.pickFile(
          dialogTitle: any(named: 'dialogTitle'),
          type: any(named: 'type'),
          allowedExtensions: any(named: 'allowedExtensions'),
        ),
      );
    });

    test('does nothing without Plus', () async {
      when(() => widgetsRepository.loadAndSync()).thenAnswer(
        (_) async =>
            WidgetOverview.fake().copyWith(payload: WidgetPayload.fake().copyWith(hasPlus: false)),
      );
      final cubit = build();
      addTearDown(cubit.close);
      await cubit.load();

      await cubit.choosePhoto();

      expect(cubit.state.chooseAction, const Initial());
      verifyNever(
        () => couplePhotoRepository.upload(
          bytes: any(named: 'bytes'),
          contentType: any(named: 'contentType'),
        ),
      );
    });
  });

  group('removePhoto', () {
    test('removes the photo and refreshes the overview', () async {
      final cubit = build();
      addTearDown(cubit.close);
      await cubit.load();

      await cubit.removePhoto();

      expect(cubit.state.removeAction, const Success<void>(null));
      verify(() => couplePhotoRepository.remove()).called(1);
    });

    test('keeps the previous overview when the post-remove refresh fails', () async {
      var loads = 0;
      when(() => widgetsRepository.loadAndSync()).thenAnswer((_) async {
        loads++;
        if (loads > 1) throw Exception('offline');
        return WidgetOverview.fake().copyWith(hasPhoto: true);
      });
      final cubit = build();
      addTearDown(cubit.close);
      await cubit.load();

      await cubit.removePhoto();

      expect(cubit.state.removeAction, const Success<void>(null));
      final overview = cubit.state.overview;
      expect(overview, isA<Success<WidgetOverview>>());
      expect((overview as Success<WidgetOverview>).value.hasPhoto, isFalse);
    });
  });

  test('discreet mode strips cachedPhotoPath so the photo widget never renders a photo', () {
    final payload = WidgetPayload.fake().copyWith(
      hasPlus: true,
      cachedPhotoPath: '/var/mobile/Containers/Shared/AppGroup/photo.jpg',
    );
    final sanitized = payload.sanitized();
    expect(sanitized.cachedPhotoPath, '/var/mobile/Containers/Shared/AppGroup/photo.jpg');

    final discreetSanitized = payload.copyWith(discreet: true).sanitized();
    expect(discreetSanitized.cachedPhotoPath, isNull);
  });
}
