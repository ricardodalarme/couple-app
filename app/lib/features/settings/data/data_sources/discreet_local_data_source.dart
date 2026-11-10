import 'package:preferences_service/preferences_service.dart';

/// Keeps the device-local part of discreet mode so the shield can read it before any request.
class DiscreetLocalDataSource({required final PreferencesService _preferencesService}) {
  static const _notificationsKey = 'discreetNeutralNotifications';
  static const _widgetKey = 'discreetHideWidgetText';
  static const _iconKey = 'discreetNeutralIcon';

  bool get neutralNotifications => _preferencesService.readBool(key: _notificationsKey) ?? false;

  bool get hideWidgetText => _preferencesService.readBool(key: _widgetKey) ?? false;

  bool get neutralIcon => _preferencesService.readBool(key: _iconKey) ?? false;

  Future<void> setNeutralNotifications({required bool value}) =>
      _preferencesService.writeBool(key: _notificationsKey, value: value);

  Future<void> setHideWidgetText({required bool value}) =>
      _preferencesService.writeBool(key: _widgetKey, value: value);

  Future<void> setNeutralIcon({required bool value}) =>
      _preferencesService.writeBool(key: _iconKey, value: value);
}
