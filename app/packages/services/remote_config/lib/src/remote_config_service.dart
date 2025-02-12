import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:remote_config_service/src/exceptions.dart';

abstract interface class RemoteConfigService {
  bool getBool(String key);

  int getInt(String key);

  double getDouble(String key);

  String getString(String key);
}

class RemoteConfigServiceImpl implements RemoteConfigService {
  factory RemoteConfigServiceImpl([FirebaseRemoteConfig? firebaseRemoteConfig]) {
    return RemoteConfigServiceImpl._(firebaseRemoteConfig ?? FirebaseRemoteConfig.instance)
      .._initialize();
  }

  const RemoteConfigServiceImpl._(this._firebaseRemoteConfig);

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

  @override
  bool getBool(String key) {
    return _firebaseRemoteConfig.getBool(key);
  }

  @override
  double getDouble(String key) {
    return _firebaseRemoteConfig.getDouble(key);
  }

  @override
  int getInt(String key) {
    return _firebaseRemoteConfig.getInt(key);
  }

  @override
  String getString(String key) {
    return _firebaseRemoteConfig.getString(key);
  }
}
