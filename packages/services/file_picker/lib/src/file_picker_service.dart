import 'package:file_picker/file_picker.dart';
import 'package:file_picker_service/src/file_picker_exception.dart';

/// Opens the native file picker and returns the selected files.
class const FilePickerService({final FilePickerPlatform? _platform}) {
  FilePickerPlatform get _client => _platform ?? FilePickerPlatform.instance;

  /// Opens the picker for a single file.
  ///
  /// [allowedExtensions] only applies when [type] is [FileType.custom].
  /// Returns null when the user cancels. Throws a [FilePickerException] when the
  /// platform picker fails.
  Future<PlatformFile?> pickFile({
    String? dialogTitle,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
  }) async {
    try {
      return await _client.pickFile(
        dialogTitle: dialogTitle,
        type: type,
        allowedExtensions: allowedExtensions,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(FilePickerException(error), stackTrace);
    }
  }

  /// Opens the picker for one or more files.
  ///
  /// [allowedExtensions] only applies when [type] is [FileType.custom].
  /// Returns an empty list when the user cancels. Throws a
  /// [FilePickerException] when the platform picker fails.
  Future<List<PlatformFile>> pickFiles({
    String? dialogTitle,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
  }) async {
    try {
      return await _client.pickFiles(
        dialogTitle: dialogTitle,
        type: type,
        allowedExtensions: allowedExtensions,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(FilePickerException(error), stackTrace);
    }
  }
}
