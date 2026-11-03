import 'package:analytics_service/analytics_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

class AnalyticsRouterObserver({required final AnalyticsService analyticsService})
    extends AutoRouterObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final routeName = route.settings.name;
    if (routeName != null) {
      analyticsService.logScreenView(screenName: routeName);
    }

    super.didPush(route, previousRoute);
  }
}
