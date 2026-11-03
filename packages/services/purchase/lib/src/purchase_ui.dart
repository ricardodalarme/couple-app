import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

/// RevenueCat-hosted paywall presentation.
abstract interface class PurchaseUI() {
  /// Shows the paywall when [requiredEntitlementIdentifier] is not active.
  static Future<PaywallResult> showPaywallIfNeeded(
    String requiredEntitlementIdentifier, {
    bool displayCloseButton = false,
  }) {
    return RevenueCatUI.presentPaywallIfNeeded(
      requiredEntitlementIdentifier,
      displayCloseButton: displayCloseButton,
    );
  }
}
