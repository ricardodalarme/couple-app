import 'package:shared_preferences/shared_preferences.dart';

abstract interface class PreferencesService {
  Future<void> initialize();
  String? readString({required String key});
  Future<void> writeString({required String key, required String value});
  bool? readBool({required String key});
  Future<void> writeBool({required String key, required bool value});
  Future<void> delete({required String key});
  Future<void> clear();
}

class PreferencesServiceImpl implements PreferencesService {
  PreferencesServiceImpl();

  late final SharedPreferences _sharedPreferences;

  @override
  Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  String? readString({required String key}) {
    return _sharedPreferences.getString(key);
  }

  @override
  Future<void> writeString({required String key, required String value}) async {
    await _sharedPreferences.setString(key, value);
  }

  @override
  bool? readBool({required String key}) {
    return _sharedPreferences.getBool(key);
  }

  @override
  Future<void> writeBool({required String key, required bool value}) async {
    await _sharedPreferences.setBool(key, value);
  }

  @override
  Future<void> delete({required String key}) async {
    await _sharedPreferences.remove(key);
  }

  @override
  Future<void> clear() async {
    await _sharedPreferences.clear();
  }
}
