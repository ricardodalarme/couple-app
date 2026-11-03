import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' show Rect;

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:share_service/src/share_exception.dart';

/// Resolves the directory used for temporary share files.
typedef TemporaryDirectoryProvider = Future<Directory> Function();

/// Opens the platform share sheet and stores temporary files for sharing.
class const ShareService({
  final SharePlus? _sharePlus,
  final TemporaryDirectoryProvider? _temporaryDirectory,
}) {
  SharePlus get _client => _sharePlus ?? SharePlus.instance;
  TemporaryDirectoryProvider get _temporaryDirectoryProvider =>
      _temporaryDirectory ?? getTemporaryDirectory;

  /// Opens the share sheet with [file] attached as [mimeType].
  ///
  /// [text] is offered alongside the file where the receiving app supports it.
  /// [sharePositionOrigin] anchors the sheet to a widget on iPads and Macs and
  /// is ignored elsewhere.
  ///
  /// Throws a [ShareException] when the platform share fails.
  Future<void> shareFile({
    required File file,
    required String mimeType,
    String? text,
    Rect? sharePositionOrigin,
  }) async {
    try {
      await _client.share(
        ShareParams(
          files: [XFile(file.path, mimeType: mimeType)],
          text: text,
          sharePositionOrigin: sharePositionOrigin,
        ),
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(ShareException(error), stackTrace);
    }
  }

  /// Writes [bytes] to [fileName] inside the temporary directory and returns
  /// the created file.
  ///
  /// Throws a [ShareException] when the temporary directory cannot be resolved
  /// or the file cannot be written.
  Future<File> writeTemporaryFile({required String fileName, required Uint8List bytes}) async {
    try {
      final directory = await _temporaryDirectoryProvider();
      final file = File('${directory.path}/$fileName');
      return await file.writeAsBytes(bytes, flush: true);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(ShareException(error), stackTrace);
    }
  }

  /// Removes a temporary file after its platform share operation has finished.
  Future<void> deleteTemporaryFile(File file) {
    try {
      if (file.existsSync()) file.deleteSync();
    } on FileSystemException {
      return Future.value();
    }
    return Future.value();
  }
}
