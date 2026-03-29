import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/models/token.dart';
import 'package:secure_storage_service/secure_storage_service.dart';

class TokenLocalDataSource {
  TokenLocalDataSource({required SecureStorageService storage}) : _storage = storage;

  final SecureStorageService _storage;

  Future<void> save(Token token) async {
    await _storage.write(key: StorageKeys.accessToken, value: token.token);
    await _storage.write(
      key: StorageKeys.accessTokenExpiresIn,
      value: token.expires.toIso8601String(),
    );
  }

  Future<Token?> get() async {
    final String? token = await _storage.read(key: StorageKeys.accessToken);
    final String? expiresIn = await _storage.read(key: StorageKeys.accessTokenExpiresIn);

    if (token == null || expiresIn == null) {
      return null;
    }

    return Token(token: token, expires: DateTime.parse(expiresIn));
  }

  Future<void> delete() async {
    await _storage.delete(key: StorageKeys.accessToken);
    await _storage.delete(key: StorageKeys.accessTokenExpiresIn);
  }
}
