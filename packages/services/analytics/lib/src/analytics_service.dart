import 'package:analytics_service/src/models/analytics_event.dart';

abstract interface class AnalyticsService {
  void logEvent(AnalyticsEvent event);
  void logScreenView({required String screenName});
}
