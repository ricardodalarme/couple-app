import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/app/presentation/connectivity/cubit/connectivity_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/shell/app_shell.dart';
import 'package:flutter_bloc_starter/features/app/presentation/version/cubit/version_gate_cubit.dart';
import 'package:flutter_bloc_starter/features/safety/presentation/safe_mode/cubit/safe_mode_cubit.dart';
import 'package:flutter_bloc_starter/features/safety/presentation/safe_mode/widgets/safe_mode_shield.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/discreet/cubit/discreet_mode_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/preferences/cubit/app_preferences_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/preferences/widgets/app_preferences_media.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';
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
      child: BlocProvider.value(
        value: injector.get<AppPreferencesCubit>(),
        child: Builder(
          builder: (context) {
            final settings = context.select((AppPreferencesCubit cubit) => cubit.state.settings);
            return AppThemeHost(
              initialVariant: _initialVariant(),
              highContrast: settings.highContrast,
              child: BlocProvider(
                create: (context) => appCubit,
                child: BlocListener<AppCubit, AppState>(
                  bloc: appCubit,
                  listenWhen: (previous, current) => previous != current,
                  listener: (_, state) => _onAppStateChanged(state),
                  child: Builder(
                    builder: (context) {
                      final theme = AppTheme.light(
                        AppThemeScope.of(context),
                        highContrast: settings.highContrast,
                      );
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
                                builder: (context, child) => AppPreferencesMedia(
                                  settings: settings,
                                  child: AppShell(child: child ?? const SizedBox.shrink()),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
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

  PageRouteInfo<void> _resolveRouteForState(AppState state) => switch (state) {
    .authenticated => const HomeRoute(),
    .onboarding => const ProfileSetupRoute(),
    .unauthenticated || .checking => const WelcomeRoute(),
  };

  DeepLink _deepLinkBuilder(PlatformDeepLink deepLink) {
    final appCubit = AppInjector.instance.get<AppCubit>();
    return deepLink.initial ? DeepLink.single(_resolveRouteForState(appCubit.state)) : deepLink;
  }

  void _onAppStateChanged(AppState state) {
    if (state == AppState.checking) return;

    final appRouter = AppInjector.instance.get<RootStackRouter>();
    final resolvedRoute = _resolveRouteForState(state);
    appRouter.replaceAll([resolvedRoute]);
  }
}
