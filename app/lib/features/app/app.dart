import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' show MaterialApp;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quickstart_flutter_bloc/features/app/bloc/app_bloc.dart';
import 'package:quickstart_flutter_bloc/features/app/observers/router_observer.dart';
import 'package:quickstart_flutter_bloc/l10n/translations.g.dart';
import 'package:quickstart_flutter_bloc/routes/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppInjector.instance.get<RootStackRouter>();

    return BlocProvider(
      create: (_) => AppInjector.instance.get<AppBloc>(),
      child: TranslationProvider(
        child: Builder(
          builder: (context) => BlocListener<AppBloc, AppState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: _onStatusChanged,
            child: MaterialApp.router(
              onGenerateTitle: (context) => context.l10n.common.appName,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              routerConfig: appRouter.config(
                navigatorObservers: () => [
                  AppRouterObserver(),
                ],
              ),
              locale: TranslationProvider.of(context).flutterLocale,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: AppLocaleUtils.supportedLocales,
            ),
          ),
        ),
      ),
    );
  }

  void _onStatusChanged(BuildContext context, AppState state) {
    final appRouter = AppInjector.instance.get<RootStackRouter>();
    final isAuthenticated = state.status == AppStatus.authenticated;
    final newRoute = isAuthenticated ? const HomeRoute() : const LoginRoute();

    appRouter.replaceAll([newRoute]);
  }
}
