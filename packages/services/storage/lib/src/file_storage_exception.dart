/// A file could not be stored, read or removed.
class FileStorageException(
  /// The underlying error.
  final Object cause,
) implements Exception {
  @override
  String toString() => 'FileStorageException: $cause';
}
