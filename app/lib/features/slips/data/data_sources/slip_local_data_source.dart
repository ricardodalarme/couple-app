import 'dart:convert';

import 'package:flutter_bloc_starter/features/slips/data/models/pending_slip.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_draft.dart';
import 'package:preferences_service/preferences_service.dart';

class SlipLocalDataSource({required final PreferencesService _preferencesService}) {
  static const _pendingKey = 'pendingSlips';
  static const _draftKey = 'slipDraft';

  List<PendingSlip> readPending() {
    final raw = _preferencesService.readString(key: _pendingKey);
    if (raw == null) return const [];

    return (jsonDecode(raw) as List<dynamic>)
        .map((item) => PendingSlip.fromMap(item as Map<String, dynamic>))
        .toList();
  }

  Future<void> writePending(List<PendingSlip> slips) {
    if (slips.isEmpty) return _preferencesService.delete(key: _pendingKey);

    return _preferencesService.writeString(
      key: _pendingKey,
      value: jsonEncode(slips.map((slip) => slip.toMap()).toList()),
    );
  }

  SlipDraft? readDraft() {
    final raw = _preferencesService.readString(key: _draftKey);
    if (raw == null) return null;

    return SlipDraft.fromMap(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> writeDraft(SlipDraft draft) =>
      _preferencesService.writeString(key: _draftKey, value: jsonEncode(draft.toMap()));

  Future<void> clearDraft() => _preferencesService.delete(key: _draftKey);
}
