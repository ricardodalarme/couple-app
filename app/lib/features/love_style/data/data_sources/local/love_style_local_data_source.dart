import 'package:preferences_service/preferences_service.dart';

/// Keeps the shared note id per person so the revoke action survives a reload.
class LoveStyleLocalDataSource({required final PreferencesService _preferencesService}) {
  static const _sharedMessagePrefix = 'loveStyleSharedMessage';

  String _sharedMessageKey(String userId) => '$_sharedMessagePrefix:$userId';

  String? readSharedMessageId(String userId) =>
      _preferencesService.readString(key: _sharedMessageKey(userId));

  Future<void> writeSharedMessageId({required String userId, required String id}) =>
      _preferencesService.writeString(key: _sharedMessageKey(userId), value: id);

  Future<void> clearSharedMessageId(String userId) =>
      _preferencesService.delete(key: _sharedMessageKey(userId));
}
