import 'dart:convert';

import 'package:flutter_bloc_starter/features/help/data/models/pending_support_request.dart';
import 'package:preferences_service/preferences_service.dart';

class SupportLocalDataSource({required final PreferencesService _preferencesService}) {
  static const _pendingKey = 'pendingSupportRequests';
  static const _discardedKey = 'discardedSupportRequests';

  List<PendingSupportRequest> readPending() {
    final raw = _preferencesService.readString(key: _pendingKey);
    if (raw == null) return const [];

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List<dynamic>) return const [];

      final requests = <PendingSupportRequest>[];
      for (final item in decoded) {
        if (item is! Map<String, dynamic>) continue;
        try {
          requests.add(PendingSupportRequest.fromMap(item));
        } on Object {
          // One malformed entry must not discard the others.
        }
      }
      return requests;
    } on Object {
      return const [];
    }
  }

  Future<void> writePending(List<PendingSupportRequest> requests) {
    if (requests.isEmpty) return _preferencesService.delete(key: _pendingKey);

    return _preferencesService.writeString(
      key: _pendingKey,
      value: jsonEncode(requests.map((request) => request.toMap()).toList()),
    );
  }

  bool readDiscarded() => _preferencesService.readBool(key: _discardedKey) ?? false;

  Future<void> writeDiscarded({required bool value}) {
    if (!value) return _preferencesService.delete(key: _discardedKey);

    return _preferencesService.writeBool(key: _discardedKey, value: true);
  }
}
