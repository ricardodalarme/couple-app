/// Thrown when the purchase SDK is not configured on this build.
///
/// The store keys are optional at build time, so the plans screen treats this
/// as "the store cannot be reached" and offers a retry instead of a price.
class const PurchaseUnavailableException({final String message = 'Purchases are not available.'})
    implements Exception {
  @override
  String toString() => message;
}
