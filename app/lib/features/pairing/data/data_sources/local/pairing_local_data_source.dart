import 'dart:convert';

import 'package:flutter_bloc_starter/features/pairing/data/models/active_invite.dart';
import 'package:secure_storage_service/secure_storage_service.dart';

class PairingLocalDataSource({required final SecureStorageService _secureStorageService}) {
  static const _key = 'activeInvite';

  Future<ActiveInvite?> read() async {
    final raw = await _secureStorageService.read(key: _key);
    if (raw == null) return null;

    return ActiveInvite.fromMap(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> write(ActiveInvite invite) =>
      _secureStorageService.write(key: _key, value: jsonEncode(invite.toMap()));

  Future<void> clear() => _secureStorageService.delete(key: _key);
}
