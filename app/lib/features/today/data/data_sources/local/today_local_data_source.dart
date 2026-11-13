import 'dart:convert';

import 'package:flutter_bloc_starter/features/today/data/models/today_home.dart';
import 'package:preferences_service/preferences_service.dart';

/// Keeps the last Hoje state so a cold start without a connection still shows something.
class TodayLocalDataSource({required final PreferencesService _preferencesService}) {
  static const _key = 'todayCache';
  static const _wasPairedKey = 'todayWasPaired';
  static const _partnerNameKey = 'todayPartnerName';

  TodayHome? read() {
    final raw = _preferencesService.readString(key: _key);
    if (raw == null) return null;

    try {
      return TodayHome.fromMap(jsonDecode(raw) as Map<String, dynamic>);
    } on Object {
      return null;
    }
  }

  Future<void> write(TodayHome home) =>
      _preferencesService.writeString(key: _key, value: jsonEncode(home.toMap()));

  /// Whether the person was paired on the last read and the stored partner name.
  ({bool wasPaired, String? partnerName}) readRelationship() => (
    wasPaired: _preferencesService.readBool(key: _wasPairedKey) ?? false,
    partnerName: _preferencesService.readString(key: _partnerNameKey),
  );

  Future<void> writeRelationship({required bool wasPaired, String? partnerName}) async {
    await _preferencesService.writeBool(key: _wasPairedKey, value: wasPaired);
    if (partnerName == null) {
      await _preferencesService.delete(key: _partnerNameKey);
    } else {
      await _preferencesService.writeString(key: _partnerNameKey, value: partnerName);
    }
  }

  Future<void> clear() async {
    await _preferencesService.delete(key: _key);
    await _preferencesService.delete(key: _wasPairedKey);
    await _preferencesService.delete(key: _partnerNameKey);
  }
}
