final class AuthenticationException implements Exception {
  const AuthenticationException({String? code}) : code = code ?? 'auth_error';

  final String code;

  @override
  String toString() => 'AuthenticationServiceException(code: $code)';
}
