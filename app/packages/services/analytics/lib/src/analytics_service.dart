import 'dart:async';
import 'dart:developer';

import 'package:analytics_service/src/models/analytics_event.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

abstract interface class AnalyticsService {
  void logEvent(AnalyticsEvent event);
}

class AnalyticsServiceImpl implements AnalyticsService {
  factory AnalyticsServiceImpl([FirebaseAnalytics? firebaseAnalytics]) {
    return AnalyticsServiceImpl._(firebaseAnalytics ?? FirebaseAnalytics.instance);
  }

  const AnalyticsServiceImpl._(this._firebaseAnalytics);

  final FirebaseAnalytics _firebaseAnalytics;

  @override
  void logEvent(AnalyticsEvent event) {
    unawaited(_logEventAsync(event));
  }

  Future<void> _logEventAsync(AnalyticsEvent event) async {
    try {
      await _firebaseAnalytics.logEvent(name: event.name, parameters: event.parameters);
    } catch (error, stackTrace) {
      log('Failed to log event: $event', error: error, stackTrace: stackTrace);
    }
  }
}
