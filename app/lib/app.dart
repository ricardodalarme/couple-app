import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/app/presentation/widgets/app_status_wrapper_widget.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/observers/analytics_router_observer.dart';
import 'package:flutter_bloc_starter/router/observers/log_router_observer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      child: ThemeModeProvider(
        child: Builder(
          builder: (context) => BaseApp.router(
            onGenerateTitle: (context) => context.l10n.common.appName,
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
