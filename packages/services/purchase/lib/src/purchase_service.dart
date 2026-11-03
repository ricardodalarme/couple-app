import 'dart:async';
import 'dart:io';

import 'package:purchases_flutter/purchases_flutter.dart';

/// Wraps RevenueCat purchases and exposes the app's entitlement state.
///
/// [configure] must run once before any other method. The service keeps a
/// broadcast stream of customer-info updates for the lifetime of the app.
class PurchaseService({required final String _iosApiKey, required final String _androidApiKey}) {
  final _controller = StreamController<CustomerInfo>.broadcast();

  /// Configures RevenueCat with the API key for the current platform.
  ///
  /// Calling this more than once throws from the SDK.
  Future<void> configure() async {
    final apiKey = Platform.isIOS ? _iosApiKey : _androidApiKey;
    assert(
      apiKey.isNotEmpty,
      'RevenueCat API key must not be empty. Pass REVENUECAT_IOS_API_KEY / '
      'REVENUECAT_ANDROID_API_KEY via --dart-define.',
    );

    await Purchases.configure(PurchasesConfiguration(apiKey));
    Purchases.addCustomerInfoUpdateListener(_controller.add);
  }

  /// Customer info emitted whenever the SDK refreshes the user's entitlements.
  Stream<CustomerInfo> get customerInfoStream => _controller.stream;

  /// Packages available in the current offering, or an empty list.
  Future<List<Package>> getPackages() async {
    final offerings = await Purchases.getOfferings();
    return offerings.current?.availablePackages ?? [];
  }

  /// Whether offerings can be loaded, used to gate paywall entry points.
  Future<bool> isAvailable() async {
    try {
      await Purchases.getOfferings();
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Restores purchases from the underlying store.
  Future<CustomerInfo> restorePurchases() => Purchases.restorePurchases();

  /// Purchases [package] and returns the updated customer info.
  Future<CustomerInfo> purchasePackage(Package package) async {
    final result = await Purchases.purchase(PurchaseParams.package(package));
    return result.customerInfo;
  }

  /// Reads the current customer info from the SDK cache.
  Future<CustomerInfo> getCustomerInfo() => Purchases.getCustomerInfo();

  /// Stops customer-info updates and closes the stream.
  Future<void> dispose() async {
    Purchases.removeCustomerInfoUpdateListener(_controller.add);
    await _controller.close();
  }

  /// Syncs purchases with the store and RevenueCat servers.
  ///
  /// Use sparingly, for example once during a migration. Do not call this on
  /// every app launch for every user.
  Future<void> syncPurchases() async {
    await Purchases.syncPurchasesForResult();
  }
}
