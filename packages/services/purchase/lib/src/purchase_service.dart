import 'dart:async';
import 'dart:io';

import 'package:purchase_service/src/purchase_exception.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// Wraps RevenueCat purchases and exposes the app's entitlement state.
///
/// The SDK is configured lazily on the first call, and only when the store key
/// for this platform is present. Without a key every method fails with
/// [PurchaseUnavailableException] instead of crashing the native SDK.
class PurchaseService({required final String _iosApiKey, required final String _androidApiKey}) {
  final _controller = StreamController<CustomerInfo>.broadcast();

  Future<void>? _configuration;
  bool _isConfigured = false;

  String get _apiKey => Platform.isIOS ? _iosApiKey : _androidApiKey;

  /// Configures RevenueCat with the API key for the current platform.
  ///
  /// Safe to call more than once; it does nothing when the key is empty.
  Future<void> configure() async {
    await _ensureConfigured();
  }

  /// Customer info emitted whenever the SDK refreshes the user's entitlements.
  Stream<CustomerInfo> get customerInfoStream => _controller.stream;

  /// Packages available in the current offering, or an empty list.
  Future<List<Package>> getPackages() async {
    await _requireConfigured();
    final offerings = await Purchases.getOfferings();

    return offerings.current?.availablePackages ?? [];
  }

  /// Whether offerings can be loaded, used to gate paywall entry points.
  Future<bool> isAvailable() async {
    if (!await _ensureConfigured()) return false;
    try {
      await Purchases.getOfferings();
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Restores purchases from the underlying store.
  Future<CustomerInfo> restorePurchases() async {
    await _requireConfigured();

    return Purchases.restorePurchases();
  }

  /// Purchases [package] and returns the updated customer info.
  Future<CustomerInfo> purchasePackage(Package package) async {
    await _requireConfigured();
    final result = await Purchases.purchase(PurchaseParams.package(package));

    return result.customerInfo;
  }

  /// Reads the current customer info from the SDK cache.
  Future<CustomerInfo> getCustomerInfo() async {
    await _requireConfigured();

    return Purchases.getCustomerInfo();
  }

  /// Stops customer-info updates and closes the stream.
  Future<void> dispose() async {
    if (_isConfigured) {
      Purchases.removeCustomerInfoUpdateListener(_controller.add);
    }
    await _controller.close();
  }

  /// Syncs purchases with the store and RevenueCat servers.
  ///
  /// Use sparingly, for example once during a migration. Do not call this on
  /// every app launch for every user.
  Future<void> syncPurchases() async {
    await _requireConfigured();
    await Purchases.syncPurchasesForResult();
  }

  Future<bool> _ensureConfigured() async {
    if (_isConfigured) return true;
    final apiKey = _apiKey;
    if (apiKey.isEmpty) return false;

    _configuration ??= _configure(apiKey);
    await _configuration;

    return _isConfigured;
  }

  Future<void> _configure(String apiKey) async {
    await Purchases.configure(PurchasesConfiguration(apiKey));
    _isConfigured = true;
    Purchases.addCustomerInfoUpdateListener(_controller.add);
  }

  Future<void> _requireConfigured() async {
    if (!await _ensureConfigured()) throw const PurchaseUnavailableException();
  }
}
