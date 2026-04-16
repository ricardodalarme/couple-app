import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' show MaterialApp;

class BaseApp extends StatelessWidget {
  const BaseApp({
    this.home,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.onGenerateTitle,
    this.locale,
    this.localizationsDelegates,
    this.builder,
    super.key,
  }) : routerConfig = null;

  const BaseApp.router({
    required this.routerConfig,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.onGenerateTitle,
    this.locale,
    this.localizationsDelegates,
    this.builder,
    super.key,
  }) : home = null;

  final Widget? home;
  final String Function(BuildContext)? onGenerateTitle;
  final RouterConfig<Object>? routerConfig;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final Widget Function(BuildContext, Widget?)? builder;

  Widget _buildMaterialApp(ThemeMode? themeMode) {
    if (routerConfig != null) {
      return MaterialApp.router(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeMode,
        onGenerateTitle: onGenerateTitle,
        routerConfig: routerConfig,
        locale: locale,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        builder: builder,
        debugShowCheckedModeBanner: false,
      );
    }

    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      onGenerateTitle: onGenerateTitle,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      builder: builder,
      home: home,
      debugShowCheckedModeBanner: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ThemeModeProvider.maybeOf(context)?.themeMode;

    return _buildMaterialApp(themeMode);
  }
}
