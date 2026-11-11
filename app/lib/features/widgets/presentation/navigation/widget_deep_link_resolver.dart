import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// Intercepts `repara://<host>/<path>` deep links before AutoRoute matches them and
/// normalizes the custom-scheme host + path into a canonical `/target` path.
Future<Uri> transformWidgetDeepLinkUri(Uri uri) {
  if (uri.scheme != 'repara') return SynchronousFuture(uri);
  final target = _extractNormalizedTarget(uri);
  final normalizedPath = target.isEmpty ? '/today' : '/$target';
  final updatedQuery = <String, String>{
    ...uri.queryParameters,
    'homeWidget': uri.queryParameters['homeWidget'] ?? '1',
  };
  return SynchronousFuture(
    uri.replace(host: '', path: normalizedPath, queryParameters: updatedQuery),
  );
}

/// Resolves `repara://` or normalized `?homeWidget=` deep-link URIs to auto_route page stacks.
///
/// When the user is signed out, every widget tap opens the sign-in flow.
List<PageRouteInfo<void>>? resolveWidgetDeepLinkUri(Uri? uri, {required AppState appState}) {
  if (uri == null) return null;
  final isWidgetUri = uri.scheme == 'repara' || uri.queryParameters.containsKey('homeWidget');
  if (!isWidgetUri) return null;

  if (appState != AppState.authenticated) {
    return [const WelcomeRoute(), const SignInRoute()];
  }

  final target = _extractNormalizedTarget(uri);

  return switch (target) {
    'sign-in' || 'signin' => [const WelcomeRoute(), const SignInRoute()],
    'today' || '' => [
      const HomeRoute(children: [TodayRoute()]),
    ],
    'together' || 'juntos' => [
      const HomeRoute(children: [TogetherRoute()]),
    ],
    'memories' || 'memorias' => [
      const HomeRoute(children: [MemoriesRoute()]),
    ],
    'card' || 'cards' => [
      const HomeRoute(children: [TodayRoute()]),
      const SundayCardRoute(),
    ],
    'dates' => [
      const HomeRoute(children: [TogetherRoute()]),
      const DatesRoute(),
    ],
    'settings/discreet' || 'discreet' => [
      const HomeRoute(children: [TodayRoute()]),
      const DiscreetModeRoute(),
    ],
    'capture' || 'slip' => [
      const HomeRoute(children: [TodayRoute()]),
      const QuickSlipRoute(),
    ],
    'mood' => [
      const HomeRoute(children: [TodayRoute()]),
      MoodRoute(),
    ],
    'rituals' => [
      const HomeRoute(children: [TogetherRoute()]),
      const RitualsRoute(),
    ],
    'jar' || 'slips' => [
      const HomeRoute(children: [SlipsRoute()]),
    ],
    'pause' => [
      const HomeRoute(children: [TodayRoute()]),
      const PauseRoute(),
    ],
    'invite' => [
      const HomeRoute(children: [TodayRoute()]),
      const InviteRoute(),
    ],
    'widgets' => [
      const HomeRoute(children: [TodayRoute()]),
      const WidgetsGalleryRoute(),
    ],
    _ => [
      const HomeRoute(children: [TodayRoute()]),
    ],
  };
}

String _extractNormalizedTarget(Uri uri) {
  final host = uri.host.toLowerCase().trim();
  final rawPath = uri.path.toLowerCase().trim();
  final trimmedPath = rawPath.replaceFirst(RegExp('^/+'), '').replaceFirst(RegExp(r'/+$'), '');
  if (host.isEmpty) return trimmedPath;
  if (trimmedPath.isEmpty) return host;
  return '$host/$trimmedPath';
}
