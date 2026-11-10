import 'package:preferences_service/preferences_service.dart';

/// Whether safe mode is on for this device.
///
/// The choice lives only in local preferences: it is never sent to the server, logged or tracked.
class SafeModeRepository({required final PreferencesService _preferencesService}) {
  static const _key = 'safeMode';

  bool get isOn => _preferencesService.readBool(key: _key) ?? false;

  Future<void> setOn({required bool value}) =>
      _preferencesService.writeBool(key: _key, value: value);
}
