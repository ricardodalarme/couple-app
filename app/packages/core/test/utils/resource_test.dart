import 'package:core/core.dart';
import 'package:test/test.dart';

final class MockException extends L10nPlaceholderException {
  const MockException(String l10nPlaceholder)
      : super(l10nPlaceholder: l10nPlaceholder);
}

void main() {
  group('Resource', () {
    test('Success equality', () {
      const success1 = Success('value');
      const success2 = Success('value');
      const success3 = Success('different_value');

      expect(success1, equals(success2));
      expect(success1, isNot(equals(success3)));
    });

    test('Failure equality', () {
      const exception = MockException('error message');
      const failure1 = Failure(exception);
      const failure2 = Failure(exception);
      const failure3 = Failure(MockException('different_message'));

      expect(failure1, equals(failure2));
      expect(failure1, isNot(equals(failure3)));
    });

    test('Loading equality', () {
      const loading1 = Loading();
      const loading2 = Loading();
      expect(loading1, equals(loading2));
    });
  });
}
