import 'package:preferences_service/preferences_service.dart';

/// Keeps local notification notice state.
class NotificationsLocalDataSource({required final PreferencesService _preferencesService}) {
  static const _offBannerDismissedKey = 'notificationsOffBannerDismissed';

  /// Whether the person hid the reminders-off notice.
  bool get isOffBannerDismissed =>
      _preferencesService.readBool(key: _offBannerDismissedKey) ?? false;

  Future<void> setOffBannerDismissed({required bool value}) =>
      _preferencesService.writeBool(key: _offBannerDismissedKey, value: value);
}
