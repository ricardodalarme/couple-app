import 'package:flutter_test/flutter_test.dart';
import 'package:persistent_storage_service/persistent_storage_service.dart';

void main() {
  group('PersistentStorage', () {
    group('constructor', () {
      test('defaults to internal FlutterPersistentStorage if none is provided', () {
        expect(PersistentStorageServiceImpl.new, isNot(throwsA(isA<Exception>())));
      });
    });
  });
}
