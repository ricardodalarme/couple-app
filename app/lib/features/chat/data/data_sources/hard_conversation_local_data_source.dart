import 'package:preferences_service/preferences_service.dart';

/// Keeps the unfinished hard conversation per person, so leaving midway loses nothing.
class HardConversationLocalDataSource({required final PreferencesService _preferencesService}) {
  static const _keyPrefix = 'hardConversationDraft';

  String _key(String userId) => '$_keyPrefix:$userId';

  String? read(String userId) => _preferencesService.readString(key: _key(userId));

  Future<void> write({required String userId, required String draft}) =>
      _preferencesService.writeString(key: _key(userId), value: draft);

  Future<void> clear(String userId) => _preferencesService.delete(key: _key(userId));
}
