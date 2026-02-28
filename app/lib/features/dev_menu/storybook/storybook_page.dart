import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:quickstart_flutter_bloc/features/dev_menu/storybook/examples/examples.dart';
import 'package:widgetbook/widgetbook.dart';

class StorybookPage extends StatelessWidget {
  const StorybookPage({super.key});

  static final List<WidgetbookTheme<ThemeData>> _themes = [
    WidgetbookTheme(name: 'Light', data: AppTheme.light),
    WidgetbookTheme(name: 'Dark', data: AppTheme.dark),
  ];

  static final List<WidgetbookAddon<dynamic>> _addons = [
    MaterialThemeAddon(themes: _themes),
    TextScaleAddon(),
    AlignmentAddon(),
  ];

  @override
  Widget build(BuildContext context) {
    final InheritedThemeProvider themeProvider = ThemeModeProvider.of(context);
    final ThemeMode currentThemeMode = themeProvider.themeMode;

    return BaseView(
      hasSafeArea: false,
      title: 'Storybook',
      body: Widgetbook(
        themeMode: currentThemeMode,
        appBuilder: (_, child) => Scaffold(body: child),
        addons: _addons,
        directories: examples,
        home: Center(child: Text('Welcome to Storybook!', style: context.typography.titleSmall)),
      ),
    );
  }
}
