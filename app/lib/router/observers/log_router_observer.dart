import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

class LogRouterObserver() extends NavigatorObserver {
  final Logger _logger = Logger('Router');

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logger.info('Pushed route: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logger.info('Popped route: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _logger.info('Replaced route: ${oldRoute?.settings.name} -> ${newRoute?.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logger.info('Removed route: ${route.settings.name}');
  }
}
