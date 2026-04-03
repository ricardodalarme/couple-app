import 'package:authentication_service/authentication_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SupabaseAuthenticationService', () {
    test('can be instantiated', () {
      expect(AuthenticationService.new, isNot(throwsA(isA<Exception>())));
    });
  });
}
