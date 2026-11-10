import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The root route a resolved app state should show.
PageRouteInfo<void> routeForAppState(AppState state) => switch (state) {
  .authenticated => const HomeRoute(),
  .onboarding => const ProfileSetupRoute(),
  .sessionExpired => SessionExpiredRoute(),
  .unauthenticated || .checking => const WelcomeRoute(),
};

/// Turns app auth states into navigation without discarding the stack on expiry.
class AppStateNavigator({required final RootStackRouter _router}) {
  bool _expiryPresented = false;

  void onStateChanged(AppState previous, AppState current) {
    if (current == AppState.checking) return;

    if (current == AppState.sessionExpired) {
      if (_expiryPresented) return;
      _expiryPresented = true;
      _router.push(SessionExpiredRoute());
      return;
    }

    if (current == AppState.authenticated &&
        (previous == AppState.sessionExpired || _expiryPresented)) {
      _expiryPresented = false;
      _router.popUntil(
        (route) =>
            route.settings.name != SessionExpiredRoute.name &&
            route.settings.name != SignInRoute.name,
      );
      return;
    }

    _expiryPresented = false;
    _router.replaceAll([routeForAppState(current)]);
  }
}
