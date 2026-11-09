import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart'
    show GlobalMaterialLocalizations, MaterialApp, ThemeData, ThemeMode;
import 'package:ui/src/theme/app_theme.dart';

/// The root app shell.
///
/// Installs [MaterialApp] or [MaterialApp.router] and provides the fallback
/// [DefaultTextStyle] from the active theme, so text outside a Material surface
/// never falls back to Flutter's yellow underline style.
class const BaseApp({
  required final ThemeData theme,
  final Widget? home,
  final RouterConfig<Object>? routerConfig,
  final ThemeData? darkTheme,
  final ThemeMode themeMode = ThemeMode.light,
  final String Function(BuildContext)? onGenerateTitle,
  final Locale? locale,
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      GlobalMaterialLocalizations.delegates,
  final Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
  final Widget Function(BuildContext, Widget?)? builder,
  final bool debugShowCheckedModeBanner = false,
  super.key,
}) extends StatelessWidget {
  /// A [BaseApp] routed with [MaterialApp.router].
  const new router({
    required RouterConfig<Object> routerConfig,
    required ThemeData theme,
    ThemeData? darkTheme,
    ThemeMode themeMode = ThemeMode.light,
    String Function(BuildContext)? onGenerateTitle,
    Locale? locale,
    Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
        GlobalMaterialLocalizations.delegates,
    Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
    Widget Function(BuildContext, Widget?)? builder,
    bool debugShowCheckedModeBanner = false,
    Key? key,
  }) : this(
         routerConfig: routerConfig,
         theme: theme,
         darkTheme: darkTheme,
         themeMode: themeMode,
         onGenerateTitle: onGenerateTitle,
         locale: locale,
         localizationsDelegates: localizationsDelegates,
         supportedLocales: supportedLocales,
         builder: builder,
         debugShowCheckedModeBanner: debugShowCheckedModeBanner,
         key: key,
       );

  @override
  Widget build(BuildContext context) {
    assert(
      (home == null) != (routerConfig == null),
      'BaseApp needs exactly one of home or routerConfig.',
    );

    final resolvedDarkTheme = darkTheme ?? theme;
    Widget defaultBuilder(BuildContext context, Widget? child) {
      final content = builder?.call(context, child) ?? child ?? const SizedBox.shrink();

      return DefaultTextStyle(style: context.text.body, child: content);
    }

    if (routerConfig case final config?) {
      return MaterialApp.router(
        theme: theme,
        darkTheme: resolvedDarkTheme,
        themeMode: themeMode,
        onGenerateTitle: onGenerateTitle,
        routerConfig: config,
        locale: locale,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        builder: defaultBuilder,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      );
    }

    return MaterialApp(
      theme: theme,
      darkTheme: resolvedDarkTheme,
      themeMode: themeMode,
      onGenerateTitle: onGenerateTitle,
      home: home,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      builder: defaultBuilder,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
    );
  }
}
