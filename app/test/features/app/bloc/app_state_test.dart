import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/app/bloc/app_bloc.dart';

void main() {
  group('AppState', () {
    test('supports value equality', () {
      const authenticatedState1 = AppState.authenticated();
      const authenticatedState2 = AppState.authenticated();
      const unauthenticatedState = AppState.unauthenticated();

      expect(authenticatedState1, equals(authenticatedState2));
      expect(authenticatedState1, isNot(equals(unauthenticatedState)));
    });

    test('creates authenticated state correctly', () {
      const authenticatedState = AppState.authenticated();

      expect(authenticatedState.status, equals(AppStatus.authenticated));
    });

    test('creates unauthenticated state correctly', () {
      const unauthenticatedState = AppState.unauthenticated();

      expect(unauthenticatedState.status, equals(AppStatus.unauthenticated));
    });
  });
}
