import 'dart:developer';

import 'package:flutter/widgets.dart';

class LogRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('Route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('Route popped: ${route.settings.name}');
  }
}
