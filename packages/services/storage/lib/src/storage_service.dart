import 'dart:typed_data';

import 'package:storage_service/src/file_storage_exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Stores private files in Supabase Storage and reads them back through short-lived signed URLs.
///
/// Buckets are private and the first folder of every path is the owner's id.
class const StorageService({final SupabaseStorageClient? _storage}) {
  SupabaseStorageClient get _client => _storage ?? Supabase.instance.client.storage;

  /// Uploads [bytes] to [path] in [bucket]; the same [path] can be uploaded again safely.
  ///
  /// Throws a [FileStorageException] when the upload fails.
  Future<void> upload({
    required String bucket,
    required String path,
    required Uint8List bytes,
    required String contentType,
  }) async {
    try {
      await _client
          .from(bucket)
          .uploadBinary(path, bytes, fileOptions: FileOptions(contentType: contentType, upsert: true));
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(FileStorageException(error), stackTrace);
    }
  }

  /// A URL that lets the file at [path] be read for [seconds] seconds.
  Future<String> signedUrl({
    required String bucket,
    required String path,
    int seconds = 300,
  }) async {
    try {
      return await _client.from(bucket).createSignedUrl(path, seconds);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(FileStorageException(error), stackTrace);
    }
  }

  /// Removes the file at [path]; a file that is already gone is not an error.
  Future<void> remove({required String bucket, required String path}) async {
    try {
      await _client.from(bucket).remove([path]);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(FileStorageException(error), stackTrace);
    }
  }
}
