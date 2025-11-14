import 'package:local_auth/local_auth.dart';

abstract interface class BiometricService {
  Future<bool> authenticate(
    String reason, {
    bool persistAcrossBackgrounding,
    bool biometricOnly,
    bool sensitiveTransaction,
  });

  Future<bool> isDeviceSupported();
}

class BiometricServiceImpl implements BiometricService {
  factory BiometricServiceImpl([LocalAuthentication? localAuthentication]) {
    return BiometricServiceImpl._(localAuthentication ?? LocalAuthentication());
  }

  const BiometricServiceImpl._(this._localAuthentication);

  final LocalAuthentication _localAuthentication;

  @override
  Future<bool> authenticate(
    String reason, {
    bool persistAcrossBackgrounding = true,
    bool biometricOnly = true,
    bool sensitiveTransaction = true,
  }) {
    return _localAuthentication.authenticate(
      localizedReason: reason,
      persistAcrossBackgrounding: persistAcrossBackgrounding,
      biometricOnly: biometricOnly,
      sensitiveTransaction: sensitiveTransaction,
    );
  }

  @override
  Future<bool> isDeviceSupported() {
    return _localAuthentication.isDeviceSupported();
  }
}
