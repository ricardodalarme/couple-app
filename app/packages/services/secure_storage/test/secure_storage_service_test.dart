import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:secure_storage_service/secure_storage_service.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  const mockKey = 'mock-key';
  const mockValue = 'mock-value';
  final mockException = Exception('oops');

  group('SecureStorage', () {
    late FlutterSecureStorage flutterSecureStorage;
    late SecureStorageServiceImpl secureStorage;

    setUp(() {
      flutterSecureStorage = MockFlutterSecureStorage();
      secureStorage = SecureStorageServiceImpl(flutterSecureStorage);
    });

    group('constructor', () {
      test('defaults to internal FlutterSecureStorage if none is provided', () {
        expect(
          () => const SecureStorageServiceImpl(),
          isNot(throwsA(isA<Exception>())),
        );
      });
    });

    group('read', () {
      test('returns value when FlutterSecureStorage returns successfully',
          () async {
        when(() => flutterSecureStorage.read(key: any(named: 'key')))
            .thenAnswer((_) => Future.value(mockValue));
        final String? actual = await secureStorage.read(key: mockKey);
        expect(actual, mockValue);
      });

      test('returns null when FlutterSecureStorage returns null', () async {
        when(() => flutterSecureStorage.read(key: any(named: 'key')))
            .thenAnswer((_) => Future<String?>.value());
        final String? actual = await secureStorage.read(key: mockKey);
        expect(actual, isNull);
      });

      test('throws SecureStorageException when FlutterSecureStorage fails',
          () async {
        when(() => flutterSecureStorage.read(key: any(named: 'key')))
            .thenThrow(mockException);

        try {
          await secureStorage.read(key: mockKey);
        } on SecureStorageException catch (e) {
          expect(e.error, mockException);
        }
      });
    });

    group('write', () {
      test('completes when FlutterSecureStorage completes', () async {
        when(
          () => flutterSecureStorage.write(
            key: any(named: 'key'),
            value: any(named: 'value'),
          ),
        ).thenAnswer((_) => Future.value());
        expect(
          secureStorage.write(key: mockKey, value: mockValue),
          completes,
        );
      });

      test('throws SecureStorageException when FlutterSecureStorage fails',
          () async {
        when(
          () => flutterSecureStorage.write(
            key: any(named: 'key'),
            value: any(named: 'value'),
          ),
        ).thenThrow(mockException);
        try {
          await secureStorage.write(key: mockKey, value: mockValue);
        } on SecureStorageException catch (e) {
          expect(e.error, mockException);
        }
      });
    });

    group('delete', () {
      test('completes when FlutterSecureStorage completes', () async {
        when(() => flutterSecureStorage.delete(key: any(named: 'key')))
            .thenAnswer((_) => Future.value());
        expect(
          secureStorage.delete(key: mockKey),
          completes,
        );
      });

      test('throws SecureStorageException when FlutterSecureStorage fails',
          () async {
        when(() => flutterSecureStorage.delete(key: any(named: 'key')))
            .thenThrow(mockException);
        try {
          await secureStorage.delete(key: mockKey);
        } on SecureStorageException catch (e) {
          expect(e.error, mockException);
        }
      });
    });

    group('clear', () {
      test('completes when FlutterSecureStorage completes', () async {
        when(() => flutterSecureStorage.deleteAll())
            .thenAnswer((_) => Future.value());
        expect(secureStorage.clear(), completes);
      });

      test('throws SecureStorageException when FlutterSecureStorage fails',
          () async {
        when(() => flutterSecureStorage.deleteAll()).thenThrow(mockException);
        try {
          await secureStorage.clear();
        } on SecureStorageException catch (e) {
          expect(e.error, mockException);
        }
      });
    });
  });
}
