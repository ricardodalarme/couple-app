import 'dart:async';
import 'dart:developer';

import 'package:analytics_service/analytics_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsService([FirebaseAnalytics? firebaseAnalytics]) implements AnalyticsService {
  final FirebaseAnalytics _firebaseAnalytics = firebaseAnalytics ?? FirebaseAnalytics.instance;

  @override
  void logEvent(AnalyticsEvent event) {
    try {
      unawaited(_firebaseAnalytics.logEvent(name: event.name, parameters: event.parameters));
    } catch (error, stackTrace) {
      log('Failed to log event: $event', error: error, stackTrace: stackTrace);
    }
  }

  @override
  void logScreenView({required String screenName}) {
    try {
      unawaited(_firebaseAnalytics.logScreenView(screenName: screenName));
    } catch (error, stackTrace) {
      log('Failed to log screen view: $screenName', error: error, stackTrace: stackTrace);
    }
  }
}
