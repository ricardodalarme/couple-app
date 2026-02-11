import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart' show MaterialApp;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quickstart_flutter_bloc/features/app/presentation/widgets/app_status_wrapper_widget.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/router/observers/analytics_router_observer.dart';
import 'package:quickstart_flutter_bloc/router/observers/log_router_observer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final Injector injector = AppInjector.instance;
    final RootStackRouter appRouter = injector.get<RootStackRouter>();
    final List<NavigatorObserver> navigatorObservers = [
      injector.get<LogRouterObserver>(),
      injector.get<AnalyticsRouterObserver>(),
    ];

    return TranslationProvider(
      child: ThemeProvider(
        child: Builder(
          builder: (context) => MaterialApp.router(
            onGenerateTitle: (context) => context.l10n.common.appName,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeProvider.of(context).themeMode,
            routerConfig: appRouter.config(navigatorObservers: () => navigatorObservers),
            locale: TranslationProvider.of(context).flutterLocale,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: AppLocaleUtils.supportedLocales,
            builder: (_, child) => AppStatusWrapperWidget(child: child ?? const SizedBox.shrink()),
          ),
        ),
      ),
    );
  }
}
