import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/data/data_sources/couple_photo_data_source.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/couple_photo.dart';
import 'package:flutter_bloc_starter/features/widgets/data/services/couple_photo_image.dart';
import 'package:flutter_bloc_starter/features/widgets/data/services/widget_data_service.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:storage_service/storage_service.dart';
import 'package:uuid/uuid.dart';

typedef PhotoResizer = Future<Uint8List?> Function(Uint8List bytes);
typedef PhotoDownloader = Future<Uint8List> Function(String url);

/// Reads and writes the couple photo row and its private storage file.
///
/// Never logs photo bytes or storage paths.
class CouplePhotoRepository({
  required final CouplePhotoDataSource _dataSource,
  required final StorageService _storageService,
  required final ProfileRepository _profileRepository,
  required final AuthenticationRepository _authenticationRepository,
  required final WidgetDataService _widgetDataService,
  final PhotoResizer _resizePhoto = CouplePhotoImage.downscalePng,
  final PhotoDownloader _downloadPhoto = _downloadSignedPhoto,
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

  /// Synchronizes the widget cache with the couple photo row.
  ///
  /// Returns whether the couple has a photo row. When [cacheAllowed] is false the file is
  /// deleted and nothing is downloaded.
  Future<bool> syncWidgetCache({required bool cacheAllowed}) async {
    try {
      final snapshot = await _dataSource.getPhoto();
      final photo = snapshot.photo;

      if (!cacheAllowed) {
        await _widgetDataService.clearCouplePhoto();
        return photo != null;
      }
      if (photo == null) {
        await _widgetDataService.clearCouplePhoto();
        return false;
      }

      final cachedPath = await _widgetDataService.readCachedPhotoPath(
        discreet: false,
        hasPlus: true,
      );
      final marker = await _widgetDataService.readCachedPhotoUpdatedAt();
      final updatedAt = photo.updatedAt.toUtc().toIso8601String();
      if (cachedPath != null && marker == updatedAt) return true;

      String? url;
      try {
        url = await _storageService.signedUrl(bucket: bucket, path: photo.storagePath);
      } on Object {
        url = null;
      }
      if (url == null) return cachedPath != null;

      final downloaded = await _downloadPhoto(url);
      final resized = await _resizePhoto(downloaded);
      if (resized == null) return cachedPath != null;

      await _widgetDataService.cacheCouplePhoto(resized, 'png', updatedAt: photo.updatedAt);
      return true;
    } catch (e, stack) {
      _logger.error(
        'Failed to sync the couple photo cache',
        error: e.runtimeType,
        stackTrace: stack,
      );
      if (!cacheAllowed) {
        await _widgetDataService.clearCouplePhoto();
        return false;
      }
      final cachedPath = await _widgetDataService.readCachedPhotoPath(
        discreet: false,
        hasPlus: true,
      );
      return cachedPath != null;
    }
  }

  /// Uploads [bytes] under the couple folder, replaces the row, and caches a widget-sized copy.
  Future<void> upload({required Uint8List bytes, required String contentType}) async {
    final userId = _authenticationRepository.currentUserId;
    if (userId == null) throw const LocalizedException(l10nKey: 'COUPLE_PHOTO_SIGNED_OUT');

    final extension = _extensionFor(contentType);
    if (extension == null || bytes.isEmpty || bytes.length > maxBytes) {
      throw const LocalizedException(l10nKey: 'COUPLE_PHOTO_INVALID');
    }
    final resized = await _resizePhoto(bytes);
    if (resized == null) throw const LocalizedException(l10nKey: 'COUPLE_PHOTO_INVALID');

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
          final inserted = await _dataSource.insert(
            coupleId: coupleId,
            storagePath: path,
            uploadedBy: profile.id,
          );
          if (inserted == 0) {
            throw const LocalizedException(l10nKey: 'COUPLE_PHOTO_UPLOAD_FAILED');
          }
        }
      } catch (_) {
        await _removeQuietly(path);
        rethrow;
      }

      final previousPath = snapshot.photo?.storagePath;
      if (previousPath != null && previousPath != path) {
        await _removeQuietly(previousPath);
      }

      DateTime? updatedAt;
      try {
        final stored = await _dataSource.getPhoto();
        updatedAt = stored.photo?.updatedAt;
      } on Object {
        updatedAt = null;
      }
      await _widgetDataService.cacheCouplePhoto(resized, 'png', updatedAt: updatedAt);
    } catch (e, stack) {
      if (e is LocalizedException) rethrow;
      _logger.error('Failed to upload the couple photo', error: e.runtimeType, stackTrace: stack);
      throw const LocalizedException(l10nKey: 'COUPLE_PHOTO_UPLOAD_FAILED');
    }
  }

  /// Deletes the row and the storage file, then clears the widget cache.
  Future<void> remove() async {
    try {
      final snapshot = await _dataSource.getPhoto();
      final coupleId = snapshot.coupleId;
      if (coupleId == null) throw const LocalizedException(l10nKey: 'COUPLE_PHOTO_NOT_PAIRED');

      final deleted = await _dataSource.delete(coupleId);
      if (deleted == 0) throw const LocalizedException(l10nKey: 'COUPLE_PHOTO_REMOVE_FAILED');

      final path = snapshot.photo?.storagePath;
      if (path != null) await _removeQuietly(path);

      await _widgetDataService.clearCouplePhoto();
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

Future<Uint8List> _downloadSignedPhoto(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode < 200 || response.statusCode >= 300) {
    throw StateError('signed photo download failed');
  }
  return response.bodyBytes;
}
