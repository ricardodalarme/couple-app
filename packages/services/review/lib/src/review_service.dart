import 'package:in_app_review/in_app_review.dart';
import 'package:review_service/src/review_exception.dart';

/// Requests in-app reviews and opens the platform store listing.
///
/// The platforms rate-limit review prompts and may decide not to show one even
/// when [isAvailable] is true. A completed [requestReview] therefore does not
/// guarantee that the user saw a prompt.
class const ReviewService({final InAppReview? _inAppReview}) {
  InAppReview get _client => _inAppReview ?? InAppReview.instance;

  /// Whether the device can show an in-app review prompt.
  ///
  /// Throws a [ReviewException] when the platform check fails.
  Future<bool> isAvailable() async {
    try {
      return await _client.isAvailable();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(ReviewException(error), stackTrace);
    }
  }

  /// Asks the platform to show an in-app review prompt.
  ///
  /// The prompt is best-effort: the operating system may suppress it. Throws a
  /// [ReviewException] when the request fails.
  Future<void> requestReview() async {
    try {
      await _client.requestReview();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(ReviewException(error), stackTrace);
    }
  }

  /// Opens the platform store listing.
  ///
  /// [appStoreId] is required on iOS and macOS and [microsoftStoreId] on
  /// Windows. Throws a [ReviewException] when the store cannot be opened.
  Future<void> openStoreListing({String? appStoreId, String? microsoftStoreId}) async {
    try {
      await _client.openStoreListing(appStoreId: appStoreId, microsoftStoreId: microsoftStoreId);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(ReviewException(error), stackTrace);
    }
  }
}
