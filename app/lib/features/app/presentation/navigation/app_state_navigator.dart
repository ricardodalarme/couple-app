import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';
import 'package:flutter_bloc_starter/router/pending_route.dart';

/// The root route a resolved app state should show.
PageRouteInfo<void> routeForAppState(AppState state) => switch (state) {
  .authenticated => const HomeRoute(),
  .onboarding => const ProfileSetupRoute(),
  .sessionExpired => SessionExpiredRoute(),
  .unauthenticated || .checking => const WelcomeRoute(),
};

/// Turns app auth states into navigation without discarding the stack on expiry.
class AppStateNavigator({
  required final RootStackRouter _router,
  required final PendingRoute _pending,
}) {
  bool _expiryPresented = false;

  void onStateChanged(AppState previous, AppState current) {
    if (current == AppState.checking) return;

    if (current == AppState.sessionExpired) {
      if (_expiryPresented) return;
      _expiryPresented = true;
      unawaited(_router.push(SessionExpiredRoute()));
      return;
    }

    if (current == AppState.authenticated &&
        (previous == AppState.sessionExpired || _expiryPresented)) {
      _expiryPresented = false;
      unawaited(_returnToTheInterruptedPage());
      return;
    }

    if (current == AppState.unauthenticated && previous == AppState.authenticated) {
      _pending.clear();
    }

    _expiryPresented = false;
    unawaited(_show(routeForAppState(current)));
  }

  /// Replaces the stack with [route], reopening the page sign-in interrupted.
  Future<void> _show(PageRouteInfo<void> route) async {
    final interrupted = route is HomeRoute ? _pending.take() : null;
    await _router.replaceAll([route]);
    if (interrupted != null) await _router.pushPath(interrupted);
  }

  Future<void> _returnToTheInterruptedPage() async {
    final interrupted = _pending.take();
    _router.popUntil(
      (route) =>
          route.settings.name != SessionExpiredRoute.name &&
          route.settings.name != SignInRoute.name,
    );
    if (interrupted != null) await _router.pushPath(interrupted);
  }
}
