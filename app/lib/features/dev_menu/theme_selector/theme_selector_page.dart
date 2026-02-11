import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart';

class ThemeSelectorPage extends StatelessWidget {
  const ThemeSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final InheritedThemeProvider themeProvider = ThemeModeProvider.of(context);
    final ThemeMode currentThemeMode = themeProvider.themeMode;

    return BaseView(
      title: 'Theme Selector',
      body: RadioGroup(
        groupValue: currentThemeMode,
        onChanged: (mode) => themeProvider.setThemeMode(mode!),
        child: ListView(
          children: ThemeMode.values
              .map((mode) => RadioListTile<ThemeMode>(value: mode, title: Text(mode.name)))
              .toList(),
        ),
      ),
    );
  }
}
