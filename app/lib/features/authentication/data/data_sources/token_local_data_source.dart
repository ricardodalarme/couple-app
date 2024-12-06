import 'package:core/core.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/models/token_local.dart';
import 'package:secure_storage_service/secure_storage_service.dart';

abstract interface class TokenLocalDataSource {
  Future<void> save(TokenLocal token);

  Future<TokenLocal?> get();

  Future<void> delete();
}

class TokenLocalDataSourceImpl implements TokenLocalDataSource {
  TokenLocalDataSourceImpl({
    required SecureStorageService storage,
  }) : _storage = storage;

  final SecureStorageService _storage;

  @override
  Future<void> save(TokenLocal token) async {
    await _storage.write(
      key: StorageKeys.accessToken,
      value: token.token,
    );
    await _storage.write(
      key: StorageKeys.accessTokenExpiresIn,
      value: token.expires.toIso8601String(),
    );
  }

  @override
  Future<TokenLocal?> get() async {
    final String? token = await _storage.read(key: StorageKeys.accessToken);
    final String? expiresIn =
        await _storage.read(key: StorageKeys.accessTokenExpiresIn);

    if (token == null || expiresIn == null) {
      return null;
    }

    return TokenLocal(
      token: token,
      expires: DateTime.parse(expiresIn),
    );
  }

  @override
  Future<void> delete() async {
    await _storage.delete(key: StorageKeys.accessToken);
    await _storage.delete(key: StorageKeys.accessTokenExpiresIn);
  }
}
