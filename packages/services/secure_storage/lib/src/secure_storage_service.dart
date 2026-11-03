import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:secure_storage_service/src/secure_storage_exception.dart';

class SecureStorageService([FlutterSecureStorage? secureStorage]) {
  final FlutterSecureStorage _secureStorage = secureStorage ?? const FlutterSecureStorage();

  Future<Map<String, String>> readAll() async {
    try {
      return await _secureStorage.readAll();
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(SecureStorageException(error), stackTrace);
    }
  }

  Future<String?> read({required String key}) async {
    try {
      return await _secureStorage.read(key: key);
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(SecureStorageException(error), stackTrace);
    }
  }

  Future<void> write({required String key, required String value}) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(SecureStorageException(error), stackTrace);
    }
  }

  Future<void> delete({required String key}) async {
    try {
      await _secureStorage.delete(key: key);
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(SecureStorageException(error), stackTrace);
    }
  }

  Future<void> clear() async {
    try {
      await _secureStorage.deleteAll();
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(SecureStorageException(error), stackTrace);
    }
  }
}
