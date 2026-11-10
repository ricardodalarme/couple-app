import 'package:flutter_bloc_starter/features/_shared/data/data_sources/device_marker_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:secure_storage_service/secure_storage_service.dart';

class _MockSecureStorageService() extends Mock implements SecureStorageService;

void main() {
  test('markerFor keeps a stable short marker', () {
    expect(DeviceMarkerStore.markerFor('token-12345678'), 'a1455365');
    expect(DeviceMarkerStore.markerFor('abc'), '1a47e90b');
    expect(DeviceMarkerStore.markerFor('token-12345678'), isNot(contains('token')));
  });

  test('a secure-storage read failure degrades to no marker', () async {
    final storage = _MockSecureStorageService();
    when(() => storage.read(key: any(named: 'key')))
        .thenThrow(SecureStorageException(Exception('locked')));
    final store = DeviceMarkerStore(secureStorageService: storage);

    expect(await store.readMarker(), isNull);
  });

  test('clear removes the marker', () async {
    final storage = _MockSecureStorageService();
    when(() => storage.delete(key: any(named: 'key'))).thenAnswer((_) async {});
    final store = DeviceMarkerStore(secureStorageService: storage);

    await store.clear();

    verify(() => storage.delete(key: 'deviceMarker')).called(1);
  });
}
