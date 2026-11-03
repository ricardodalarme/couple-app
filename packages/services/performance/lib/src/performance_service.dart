import 'package:firebase_performance/firebase_performance.dart' show HttpMethod, HttpMetric, Trace;

export 'package:firebase_performance/firebase_performance.dart' show HttpMethod, HttpMetric, Trace;

/// Exposes Firebase Performance Monitoring traces and HTTP metrics.
///
/// Collection is enabled by default; [setPerformanceCollectionEnabled] lets the
/// app respect a user's analytics preference.
abstract interface class PerformanceService() {
  /// Whether performance data collection is currently enabled.
  Future<bool> isPerformanceCollectionEnabled();

  /// Enables or disables performance data collection.
  Future<void> setPerformanceCollectionEnabled(bool enabled);

  /// Creates a trace named [name] for manual timing.
  Trace newTrace(String name);

  /// Creates an HTTP metric for [url] and [httpMethod].
  HttpMetric newHttpMetric(String url, HttpMethod httpMethod);
}
