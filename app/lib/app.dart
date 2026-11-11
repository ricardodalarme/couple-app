import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/app/presentation/connectivity/cubit/connectivity_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/navigation/app_state_navigator.dart';
import 'package:flutter_bloc_starter/features/app/presentation/shell/app_shell.dart';
import 'package:flutter_bloc_starter/features/app/presentation/version/cubit/version_gate_cubit.dart';
import 'package:flutter_bloc_starter/features/safety/presentation/safe_mode/cubit/safe_mode_cubit.dart';
import 'package:flutter_bloc_starter/features/safety/presentation/safe_mode/widgets/safe_mode_shield.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/discreet/cubit/discreet_mode_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/observers/analytics_router_observer.dart';
import 'package:flutter_bloc_starter/router/observers/log_router_observer.dart';

class const App({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final injector = AppInjector.instance;
    final appCubit = injector.get<AppCubit>();
    final appRouter = injector.get<RootStackRouter>();
    final navigatorObservers = <NavigatorObserver>[
      injector.get<LogRouterObserver>(),
      injector.get<AnalyticsRouterObserver>(),
    ];

    return TranslationProvider(
      child: AppThemeHost(
        initialVariant: _initialVariant(),
        child: BlocProvider(
          create: (context) => appCubit,
          child: _AppStateListener(
            cubit: appCubit,
            navigator: injector.get<AppStateNavigator>(),
            child: Builder(
              builder: (context) {
                final theme = AppTheme.light(AppThemeScope.of(context));
                return MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: injector.get<ConnectivityCubit>()..start()),
                    BlocProvider.value(value: injector.get<VersionGateCubit>()..check()),
                  ],
                  child: BlocProvider.value(
                    value: injector.get<DiscreetModeCubit>()..load(),
                    child: BlocProvider.value(
                      value: injector.get<SafeModeCubit>(),
                      child: SafeModeShield(
                        child: BaseApp.router(
                          theme: theme,
                          onGenerateTitle: (context) => context.l10n.common.appName,
                          routerConfig: appRouter.config(
                            navigatorObservers: () => navigatorObservers,
                            deepLinkBuilder: _deepLinkBuilder,
                          ),
                          locale: TranslationProvider.of(context).flutterLocale,
                          supportedLocales: AppLocaleUtils.supportedLocales,
                          builder: (context, child) =>
                              AppShell(child: child ?? const SizedBox.shrink()),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  AppThemeVariant _initialVariant() {
    final stored = AppInjector.instance.get<SettingsRepository>().get().themeVariant;

    return switch (stored) {
      'blue' => AppThemeVariant.blue,
      'neutral' => AppThemeVariant.neutral,
      _ => AppThemeVariant.rose,
    };
  }

  PageRouteInfo<void> _resolveRouteForState(AppState state) => routeForAppState(state);

  DeepLink _deepLinkBuilder(PlatformDeepLink deepLink) {
    final appCubit = AppInjector.instance.get<AppCubit>();
    return deepLink.initial ? DeepLink.single(_resolveRouteForState(appCubit.state)) : deepLink;
  }
}

class const _AppStateListener({
  required final AppCubit cubit,
  required final AppStateNavigator navigator,
  required final Widget child,
}) extends StatefulWidget {
  @override
  State<_AppStateListener> createState() => _AppStateListenerState();
}

class _AppStateListenerState() extends State<_AppStateListener> {
  StreamSubscription<AppState>? _subscription;
  late AppState _previous;

  @override
  void initState() {
    super.initState();
    _previous = widget.cubit.state;
    _subscription = widget.cubit.stream.listen(_onStateChanged);
  }

  void _onStateChanged(AppState current) {
    final previous = _previous;
    _previous = current;
    if (previous == current) return;

    widget.navigator.onStateChanged(previous, current);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
