import 'package:common_ui/common_ui.dart';

class ThemeSelectorPage extends StatelessWidget {
  const ThemeSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeModeProvider.of(context);
    final currentThemeMode = themeProvider.themeMode;

    return BaseView(
      title: 'Theme Selector',
      body: RadioGroup(
        groupValue: currentThemeMode,
        onChanged: (mode) => themeProvider.setThemeMode(mode!),
        child: ListView(
          children: ThemeMode.values
              .map((mode) => BaseRadioListTile(value: mode, title: mode.name))
              .toList(),
        ),
      ),
    );
  }
}
