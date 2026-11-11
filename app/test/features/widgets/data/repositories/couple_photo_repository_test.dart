import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/data/data_sources/couple_photo_data_source.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/couple_photo.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/couple_photo_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/data/services/widget_data_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:storage_service/storage_service.dart';

class _MockCouplePhotoDataSource() extends Mock implements CouplePhotoDataSource;

class _MockStorageService() extends Mock implements StorageService;

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

class _MockWidgetsRepository() extends Mock implements WidgetsRepository;

class _MockWidgetDataService() extends Mock implements WidgetDataService;

void main() {
  late CouplePhotoDataSource dataSource;
  late StorageService storageService;
  late ProfileRepository profileRepository;
  late AuthenticationRepository authenticationRepository;
  late WidgetsRepository widgetsRepository;
  late WidgetDataService widgetDataService;
  late CouplePhotoRepository repository;

  final bytes = Uint8List.fromList([1, 2, 3]);
  final existing = CouplePhoto(
    coupleId: 'couple-1',
    storagePath: 'couple-1/old.jpg',
    uploadedBy: 'profile-1',
    updatedAt: DateTime.utc(2026, 11, 11),
  );

  setUpAll(() {
    registerFallbackValue(Uint8List(0));
    registerFallbackValue(existing);
  });

  setUp(() {
    dataSource = _MockCouplePhotoDataSource();
    storageService = _MockStorageService();
    profileRepository = _MockProfileRepository();
    authenticationRepository = _MockAuthenticationRepository();
    widgetsRepository = _MockWidgetsRepository();
    widgetDataService = _MockWidgetDataService();

    repository = CouplePhotoRepository(
      dataSource: dataSource,
      storageService: storageService,
      profileRepository: profileRepository,
      authenticationRepository: authenticationRepository,
      widgetsRepository: widgetsRepository,
      widgetDataService: widgetDataService,
    );

    when(() => authenticationRepository.currentUserId).thenReturn('profile-1');
    when(() => profileRepository.getMyProfile())
        .thenAnswer((_) async => const Profile(id: 'profile-1', avatarKind: 'initial'));
    when(
      () => storageService.upload(
        bucket: any(named: 'bucket'),
        path: any(named: 'path'),
        bytes: any(named: 'bytes'),
        contentType: any(named: 'contentType'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => storageService.remove(
        bucket: any(named: 'bucket'),
        path: any(named: 'path'),
      ),
    ).thenAnswer((_) async {});
    when(() => widgetDataService.cacheCouplePhoto(any(), any()))
        .thenAnswer((_) async => '/tmp/repara_widget_photo.jpg');
    when(() => widgetDataService.clearCouplePhoto()).thenAnswer((_) async {});
    when(() => widgetsRepository.loadAndSync()).thenAnswer((_) async => WidgetOverview.fake());
    when(() => dataSource.getPhoto())
        .thenAnswer((_) async => (coupleId: 'couple-1', photo: existing));
    when(
      () => dataSource.update(
        coupleId: any(named: 'coupleId'),
        storagePath: any(named: 'storagePath'),
        uploadedBy: any(named: 'uploadedBy'),
      ),
    ).thenAnswer((_) async => 1);
    when(
      () => dataSource.insert(
        coupleId: any(named: 'coupleId'),
        storagePath: any(named: 'storagePath'),
        uploadedBy: any(named: 'uploadedBy'),
      ),
    ).thenAnswer((_) async => 1);
    when(() => dataSource.delete(any())).thenAnswer((_) async => 1);
  });

  group('upload', () {
    test(
      'stores the file under the couple folder, upserts the row, caches, and refreshes',
      () async {
        String? uploadedPath;
        when(
          () => dataSource.update(
            coupleId: any(named: 'coupleId'),
            storagePath: any(named: 'storagePath'),
            uploadedBy: any(named: 'uploadedBy'),
          ),
        ).thenAnswer((invocation) async {
          uploadedPath = invocation.namedArguments[#storagePath] as String;
          return 1;
        });

        final overview = await repository.upload(bytes: bytes, contentType: 'image/jpeg');

        expect(overview, WidgetOverview.fake());
        expect(uploadedPath, startsWith('couple-1/'));
        expect(uploadedPath, endsWith('.jpg'));
        verify(
          () => storageService.upload(
            bucket: 'couple_photos',
            path: uploadedPath!,
            bytes: bytes,
            contentType: 'image/jpeg',
          ),
        ).called(1);
        verify(
          () => dataSource.update(
            coupleId: 'couple-1',
            storagePath: uploadedPath!,
            uploadedBy: 'profile-1',
          ),
        ).called(1);
        verify(() => widgetDataService.cacheCouplePhoto(bytes, 'jpg')).called(1);
        verify(() => widgetsRepository.loadAndSync()).called(1);
      },
    );

    test('deletes the previous file when the photo is replaced', () async {
      String? uploadedPath;
      when(
        () => dataSource.update(
          coupleId: any(named: 'coupleId'),
          storagePath: any(named: 'storagePath'),
          uploadedBy: any(named: 'uploadedBy'),
        ),
      ).thenAnswer((invocation) async {
        uploadedPath = invocation.namedArguments[#storagePath] as String;
        return 1;
      });

      await repository.upload(bytes: bytes, contentType: 'image/png');

      verify(() => storageService.remove(bucket: 'couple_photos', path: 'couple-1/old.jpg'))
          .called(1);
      expect(uploadedPath, endsWith('.png'));
    });

    test('inserts the row when the couple has none yet', () async {
      when(() => dataSource.getPhoto())
          .thenAnswer((_) async => (coupleId: 'couple-1', photo: null));
      when(
        () => dataSource.update(
          coupleId: any(named: 'coupleId'),
          storagePath: any(named: 'storagePath'),
          uploadedBy: any(named: 'uploadedBy'),
        ),
      ).thenAnswer((_) async => 0);

      await repository.upload(bytes: bytes, contentType: 'image/jpeg');

      verify(
        () => dataSource.insert(
          coupleId: 'couple-1',
          storagePath: any(named: 'storagePath'),
          uploadedBy: 'profile-1',
        ),
      ).called(1);
      verifyNever(
        () => storageService.remove(
          bucket: any(named: 'bucket'),
          path: any(named: 'path'),
        ),
      );
    });

    test('fails before writing when the person is not paired', () async {
      when(() => dataSource.getPhoto()).thenAnswer((_) async => (coupleId: null, photo: null));

      await expectLater(
        repository.upload(bytes: bytes, contentType: 'image/jpeg'),
        throwsA(isA<LocalizedException>()),
      );

      verifyNever(
        () => storageService.upload(
          bucket: any(named: 'bucket'),
          path: any(named: 'path'),
          bytes: any(named: 'bytes'),
          contentType: any(named: 'contentType'),
        ),
      );
    });

    test('rejects a content type the bucket does not accept', () async {
      await expectLater(
        repository.upload(bytes: bytes, contentType: 'application/pdf'),
        throwsA(isA<LocalizedException>()),
      );

      verifyNever(() => profileRepository.getMyProfile());
    });

    test('removes the new file when the row write fails', () async {
      when(
        () => dataSource.update(
          coupleId: any(named: 'coupleId'),
          storagePath: any(named: 'storagePath'),
          uploadedBy: any(named: 'uploadedBy'),
        ),
      ).thenThrow(Exception('row failed'));

      await expectLater(
        repository.upload(bytes: bytes, contentType: 'image/jpeg'),
        throwsA(isA<LocalizedException>()),
      );

      verify(
        () => storageService.remove(
          bucket: 'couple_photos',
          path: any(named: 'path'),
        ),
      ).called(1);
    });
  });

  group('remove', () {
    test('deletes the row, the file, and the cached photo, then refreshes', () async {
      final overview = await repository.remove();

      expect(overview, WidgetOverview.fake());
      verify(() => dataSource.delete('couple-1')).called(1);
      verify(() => storageService.remove(bucket: 'couple_photos', path: 'couple-1/old.jpg'))
          .called(1);
      verify(() => widgetDataService.clearCouplePhoto()).called(1);
      verify(() => widgetsRepository.loadAndSync()).called(1);
    });
  });

  group('getPhoto', () {
    test('adds a short-lived signed URL to the row', () async {
      when(
        () => storageService.signedUrl(
          bucket: any(named: 'bucket'),
          path: any(named: 'path'),
          seconds: any(named: 'seconds'),
        ),
      ).thenAnswer((_) async => 'https://example.test/photo.jpg');

      final photo = await repository.getPhoto();

      expect(photo?.storagePath, 'couple-1/old.jpg');
      expect(photo?.url, 'https://example.test/photo.jpg');
    });

    test('keeps the row when the signed URL fails', () async {
      when(
        () => storageService.signedUrl(
          bucket: any(named: 'bucket'),
          path: any(named: 'path'),
          seconds: any(named: 'seconds'),
        ),
      ).thenThrow(FileStorageException(Exception('signed url failed')));

      final photo = await repository.getPhoto();

      expect(photo?.storagePath, 'couple-1/old.jpg');
      expect(photo?.url, isNull);
    });
  });
}
