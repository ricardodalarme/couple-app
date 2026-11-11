import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// Resolves `repara://` widget deep-link URIs to auto_route page stacks.
///
/// When the user is signed out, every widget tap opens the sign-in flow.
List<PageRouteInfo<void>>? resolveWidgetDeepLinkUri(Uri? uri, {required AppState appState}) {
  if (uri == null || uri.scheme != 'repara') return null;

  if (appState != AppState.authenticated) {
    return [const WelcomeRoute(), const SignInRoute()];
  }

  final host = uri.host.toLowerCase();
  final path = uri.path.toLowerCase();
  final target = path.isEmpty || path == '/' ? host : '$host$path';

  return switch (target) {
    'sign-in' || 'signin' => [const WelcomeRoute(), const SignInRoute()],
    'today' || '' => [
      const HomeRoute(children: [TodayRoute()]),
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
      const MoodRoute(),
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
