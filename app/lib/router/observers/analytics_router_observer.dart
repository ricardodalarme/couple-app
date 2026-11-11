import 'package:analytics_service/analytics_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

/// Routes that reveal a relationship or bereavement state show up as generic settings.
const Set<String> _sensitiveRouteNames = {
  'RelationshipRoute',
  'RelationshipChangedRoute',
  'GriefSupportRoute',
  'UnpairRoute',
  'BreakupRoute',
  'UnpairDoneRoute',
  'UsRoute',
  'TouchRoute',
  'CapsulesRoute',
  'GuidesRoute',
  'GuideRoute',
  'CheckinRoute',
};

/// The screen name safe to send, or null when the route has no name.
String? analyticsScreenNameFor(String? routeName) {
  if (routeName == null) return null;

  return _sensitiveRouteNames.contains(routeName) ? 'settings' : routeName;
}

class AnalyticsRouterObserver({required final AnalyticsService analyticsService})
    extends AutoRouterObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final screenName = analyticsScreenNameFor(route.settings.name);
    if (screenName != null) {
      analyticsService.logScreenView(screenName: screenName);
    }

    super.didPush(route, previousRoute);
  }
}
