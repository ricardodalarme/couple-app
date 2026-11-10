import 'package:flutter_test/flutter_test.dart';
import 'package:purchase_service/purchase_service.dart';

void main() {
  test('without a store key the service reports unavailable instead of crashing', () async {
    final service = PurchaseService(iosApiKey: '', androidApiKey: '');

    expect(await service.isAvailable(), isFalse);
    expect(service.getPackages(), throwsA(isA<PurchaseUnavailableException>()));
    expect(service.getCustomerInfo(), throwsA(isA<PurchaseUnavailableException>()));
  });

  test('configuring without a key is a no-op', () async {
    final service = PurchaseService(iosApiKey: '', androidApiKey: '');

    await service.configure();

    expect(await service.isAvailable(), isFalse);
  });
}
