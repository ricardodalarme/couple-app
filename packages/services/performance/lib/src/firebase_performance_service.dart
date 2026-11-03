import 'package:firebase_performance/firebase_performance.dart';
import 'package:performance_service/performance_service.dart';

/// [PerformanceService] backed by Firebase Performance Monitoring.
class const FirebasePerformanceService._(final FirebasePerformance _firebasePerformance)
    implements PerformanceService {
  factory([FirebasePerformance? firebasePerformance]) {
    return FirebasePerformanceService._(firebasePerformance ?? FirebasePerformance.instance);
  }

  @override
  Future<bool> isPerformanceCollectionEnabled() {
    return _firebasePerformance.isPerformanceCollectionEnabled();
  }

  @override
  Future<void> setPerformanceCollectionEnabled(bool enabled) {
    return _firebasePerformance.setPerformanceCollectionEnabled(enabled);
  }

  @override
  Trace newTrace(String name) {
    return _firebasePerformance.newTrace(name);
  }

  @override
  HttpMetric newHttpMetric(String url, HttpMethod httpMethod) {
    return _firebasePerformance.newHttpMetric(url, httpMethod);
  }
}
