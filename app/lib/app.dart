import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';
import 'package:flutter_bloc_starter/router/observers/analytics_router_observer.dart';
import 'package:flutter_bloc_starter/router/observers/log_router_observer.dart';
import 'package:flutter_bloc_starter/theme/app_theme_bridge.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ui/ui.dart' show AppThemeHost, AppThemeScope, AppThemeVariant;

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
          child: BlocListener<AppCubit, AppState>(
            bloc: appCubit,
            listenWhen: (previous, current) => previous != current,
            listener: (_, state) => _onAppStateChanged(state),
            child: Builder(
              builder: (context) {
                final theme = AppThemeBridge.light(AppThemeScope.of(context));
                return BaseApp.router(
                  theme: theme,
                  darkTheme: theme,
                  onGenerateTitle: (context) => context.l10n.common.appName,
                  routerConfig: appRouter.config(
                    navigatorObservers: () => navigatorObservers,
                    deepLinkBuilder: _deepLinkBuilder,
                  ),
                  locale: TranslationProvider.of(context).flutterLocale,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  supportedLocales: AppLocaleUtils.supportedLocales,
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

  PageRouteInfo<void> _resolveRouteForState(AppState state) => switch (state) {
    .onboarding => const OnboardingRoute(),
    .authenticated => const HomeRoute(),
    .unauthenticated => const LoginRoute(),
  };

  DeepLink _deepLinkBuilder(PlatformDeepLink deepLink) {
    final appCubit = AppInjector.instance.get<AppCubit>();
    return deepLink.initial ? DeepLink.single(_resolveRouteForState(appCubit.state)) : deepLink;
  }

  void _onAppStateChanged(AppState state) {
    final appRouter = AppInjector.instance.get<RootStackRouter>();
    final resolvedRoute = _resolveRouteForState(state);
    appRouter.replaceAll([resolvedRoute]);
  }
}
