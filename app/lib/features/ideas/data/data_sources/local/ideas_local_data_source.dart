import 'dart:convert';

import 'package:preferences_service/preferences_service.dart';

/// Remembers which ideas the person already did, so marking one twice is harmless.
class IdeasLocalDataSource({required final PreferencesService _preferencesService}) {
  static const _key = 'doneIdeas';

  Set<String> readDone() {
    final raw = _preferencesService.readString(key: _key);
    if (raw == null) return {};

    try {
      return (jsonDecode(raw) as List<dynamic>).cast<String>().toSet();
    } on Object {
      return {};
    }
  }

  Future<void> writeDone(Set<String> slugs) =>
      _preferencesService.writeString(key: _key, value: jsonEncode(slugs.toList()));
}
