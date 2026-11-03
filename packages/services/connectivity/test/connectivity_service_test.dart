import 'package:connectivity_service/connectivity_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mocktail/mocktail.dart';

class MockInternetConnection() extends Mock implements InternetConnection;

void main() {
  late MockInternetConnection connection;
  late InternetConnectivityService service;

  setUp(() {
    connection = MockInternetConnection();
    service = InternetConnectivityService(connection);
  });

  group('InternetConnectivityService', () {
    test('maps connected status to true', () {
      when(() => connection.onStatusChange)
          .thenAnswer((_) => Stream.value(InternetStatus.connected));

      expect(service.onStatusChange, emitsInOrder(<bool>[true]));
    });

    test('maps disconnected status to false', () {
      when(() => connection.onStatusChange)
          .thenAnswer((_) => Stream.value(InternetStatus.disconnected));

      expect(service.onStatusChange, emitsInOrder(<bool>[false]));
    });

    test('exposes hasInternetAccess from the connection', () async {
      when(() => connection.hasInternetAccess).thenAnswer((_) async => true);

      expect(await service.hasInternetAccess, isTrue);
      verify(() => connection.hasInternetAccess).called(1);
    });

    test('delegates dispose to the connection', () async {
      when(connection.dispose).thenAnswer((_) async {});

      await service.dispose();

      verify(connection.dispose).called(1);
    });
  });
}
