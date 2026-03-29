import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:remote_config_service/src/exceptions.dart';

class RemoteConfigService {
  factory RemoteConfigService([FirebaseRemoteConfig? firebaseRemoteConfig]) {
    return RemoteConfigService._(firebaseRemoteConfig ?? FirebaseRemoteConfig.instance)
      .._initialize();
  }

  const RemoteConfigService._(this._firebaseRemoteConfig);

  final FirebaseRemoteConfig _firebaseRemoteConfig;

  Future<void> _initialize() async {
    await _firebaseRemoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );

    try {
      await _firebaseRemoteConfig.fetchAndActivate();
    } on Exception {
      throw CannotFetchRemoteConfigDataExcpetion();
    }
  }

  Map<String, String> getAll() {
    final Map<String, RemoteConfigValue> all = _firebaseRemoteConfig.getAll();
    return all.map((key, value) => MapEntry(key, value.asString()));
  }

  bool getBool(String key) {
    return _firebaseRemoteConfig.getBool(key);
  }

  double getDouble(String key) {
    return _firebaseRemoteConfig.getDouble(key);
  }

  int getInt(String key) {
    return _firebaseRemoteConfig.getInt(key);
  }

  String getString(String key) {
    return _firebaseRemoteConfig.getString(key);
  }
}
