final class AuthenticationException({String? code}) implements Exception {
  final String code = code ?? 'auth_error';

  @override
  String toString() => 'AuthenticationException(code: $code)';
}
