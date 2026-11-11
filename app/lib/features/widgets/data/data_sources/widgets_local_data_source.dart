import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:preferences_service/preferences_service.dart';

/// Persists device-local widget preferences and the last sanitized payload for offline fallback.
class WidgetsLocalDataSource({required final PreferencesService _preferencesService}) {
  static const String _contentSourceKey = 'widgetsContentSource';
  static const String _rotationCadenceKey = 'widgetsRotationCadence';
  static const String _cachedPayloadKey = 'widgetsCachedPayloadJson';

  WidgetContentSource get contentSource =>
      switch (_preferencesService.readString(key: _contentSourceKey)) {
        'recent' => WidgetContentSource.recent,
        'dailyIdea' => WidgetContentSource.dailyIdea,
        _ => WidgetContentSource.favorites,
      };

  WidgetRotationCadence get rotationCadence =>
      switch (_preferencesService.readString(key: _rotationCadenceKey)) {
        'everySixHours' => WidgetRotationCadence.everySixHours,
        'manual' => WidgetRotationCadence.manual,
        _ => WidgetRotationCadence.daily,
      };

  Future<void> setContentSource(WidgetContentSource source) =>
      _preferencesService.writeString(key: _contentSourceKey, value: source.name);

  Future<void> setRotationCadence(WidgetRotationCadence cadence) =>
      _preferencesService.writeString(key: _rotationCadenceKey, value: cadence.name);

  WidgetPayload? readCachedPayload() {
    final raw = _preferencesService.readString(key: _cachedPayloadKey);
    if (raw == null || raw.isEmpty) return null;
    try {
      return WidgetPayload.fromJsonString(raw);
    } on Object {
      return null;
    }
  }

  Future<void> writeCachedPayload(WidgetPayload payload) =>
      _preferencesService.writeString(key: _cachedPayloadKey, value: payload.toJsonString());

  Future<void> clear() async {
    await _preferencesService.delete(key: _cachedPayloadKey);
  }
}
