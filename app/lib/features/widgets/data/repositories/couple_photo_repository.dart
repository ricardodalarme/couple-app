import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/data/data_sources/couple_photo_data_source.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/couple_photo.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/data/services/widget_data_service.dart';
import 'package:logger/logger.dart';
import 'package:storage_service/storage_service.dart';
import 'package:uuid/uuid.dart';

/// Reads and writes the couple photo row and its private storage file.
///
/// Never logs photo bytes or storage paths.
class CouplePhotoRepository({
  required final CouplePhotoDataSource _dataSource,
  required final StorageService _storageService,
  required final ProfileRepository _profileRepository,
  required final AuthenticationRepository _authenticationRepository,
  required final WidgetsRepository _widgetsRepository,
  required final WidgetDataService _widgetDataService,
}) {
  static const String bucket = 'couple_photos';
  static const int maxBytes = 8 * 1024 * 1024;

  final Logger _logger = Logger('CouplePhotoRepository');
  final Uuid _uuid = const Uuid();

  /// The couple's current photo with a short-lived read URL, or null when none was chosen.
  Future<CouplePhoto?> getPhoto() async {
    try {
      final snapshot = await _dataSource.getPhoto();
      final photo = snapshot.photo;
      if (photo == null) return null;

      String? url;
      try {
        url = await _storageService.signedUrl(bucket: bucket, path: photo.storagePath);
      } on Object {
        url = null;
      }
      return photo.copyWith(url: url);
    } catch (e, stack) {
      _logger.error('Failed to read the couple photo', error: e.runtimeType, stackTrace: stack);
      throw const LocalizedException(l10nKey: 'COUPLE_PHOTO_LOAD_FAILED');
    }
  }

  /// Uploads [bytes] under the couple folder, replaces the row and the widget cache,
  /// and returns the refreshed widget overview.
  Future<WidgetOverview> upload({required Uint8List bytes, required String contentType}) async {
    final userId = _authenticationRepository.currentUserId;
    if (userId == null) throw const LocalizedException(l10nKey: 'COUPLE_PHOTO_SIGNED_OUT');

    final extension = _extensionFor(contentType);
    if (extension == null || bytes.isEmpty || bytes.length > maxBytes) {
      throw const LocalizedException(l10nKey: 'COUPLE_PHOTO_INVALID');
    }

    try {
      final snapshot = await _dataSource.getPhoto();
      final coupleId = snapshot.coupleId;
      if (coupleId == null) throw const LocalizedException(l10nKey: 'COUPLE_PHOTO_NOT_PAIRED');

      final profile = await _profileRepository.getMyProfile();
      final path = '$coupleId/${_uuid.v4()}.$extension';
      await _storageService.upload(
        bucket: bucket,
        path: path,
        bytes: bytes,
        contentType: contentType,
      );
      try {
        final updated = await _dataSource.update(
          coupleId: coupleId,
          storagePath: path,
          uploadedBy: profile.id,
        );
        if (updated == 0) {
          await _dataSource.insert(coupleId: coupleId, storagePath: path, uploadedBy: profile.id);
        }
      } catch (_) {
        await _removeQuietly(path);
        rethrow;
      }

      final previousPath = snapshot.photo?.storagePath;
      if (previousPath != null && previousPath != path) {
        await _removeQuietly(previousPath);
      }

      await _widgetDataService.cacheCouplePhoto(bytes, extension);
      return await _widgetsRepository.loadAndSync();
    } catch (e, stack) {
      if (e is LocalizedException) rethrow;
      _logger.error('Failed to upload the couple photo', error: e.runtimeType, stackTrace: stack);
      throw const LocalizedException(l10nKey: 'COUPLE_PHOTO_UPLOAD_FAILED');
    }
  }

  /// Deletes the row and the storage file, clears the widget cache, and returns the refreshed overview.
  Future<WidgetOverview> remove() async {
    try {
      final snapshot = await _dataSource.getPhoto();
      final coupleId = snapshot.coupleId;
      if (coupleId == null) throw const LocalizedException(l10nKey: 'COUPLE_PHOTO_NOT_PAIRED');

      await _dataSource.delete(coupleId);
      final path = snapshot.photo?.storagePath;
      if (path != null) await _removeQuietly(path);

      await _widgetDataService.clearCouplePhoto();
      return await _widgetsRepository.loadAndSync();
    } catch (e, stack) {
      if (e is LocalizedException) rethrow;
      _logger.error('Failed to remove the couple photo', error: e.runtimeType, stackTrace: stack);
      throw const LocalizedException(l10nKey: 'COUPLE_PHOTO_REMOVE_FAILED');
    }
  }

  Future<void> _removeQuietly(String path) async {
    try {
      await _storageService.remove(bucket: bucket, path: path);
    } on Object {
      // A file that is already gone does not block the row change.
    }
  }

  static String? _extensionFor(String contentType) => switch (contentType) {
    'image/jpeg' => 'jpg',
    'image/png' => 'png',
    'image/webp' => 'webp',
    'image/heic' => 'heic',
    _ => null,
  };
}
