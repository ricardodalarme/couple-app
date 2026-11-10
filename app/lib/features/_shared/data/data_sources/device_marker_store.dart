import 'package:secure_storage_service/secure_storage_service.dart';

/// Keeps the marker of this installation's notification registration.
class DeviceMarkerStore({required final SecureStorageService _secureStorageService}) {
  static const _key = 'deviceMarker';

  /// A short hash of the token kept in the device label to recognise this installation.
  static String markerFor(String token) {
    var hash = 0x811c9dc5;
    for (final unit in token.codeUnits) {
      hash = ((hash ^ unit) * 0x01000193) & 0xffffffff;
    }

    return hash.toRadixString(16).padLeft(8, '0');
  }

  Future<String?> readMarker() async {
    try {
      return await _secureStorageService.read(key: _key);
    } on Object {
      return null;
    }
  }

  Future<void> writeMarker(String marker) => _secureStorageService.write(key: _key, value: marker);

  Future<void> clear() async {
    try {
      await _secureStorageService.delete(key: _key);
    } on Object {
      // Nothing to clean up if the device storage is unavailable.
    }
  }
}
