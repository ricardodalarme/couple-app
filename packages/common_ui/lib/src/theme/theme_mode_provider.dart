import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter/widgets.dart';

class ThemeModeProvider extends StatefulWidget {
  const ThemeModeProvider({required this.child, super.key});

  final Widget child;

  static InheritedThemeProvider of(BuildContext context) {
    final InheritedThemeProvider? result = context
        .dependOnInheritedWidgetOfExactType<InheritedThemeProvider>();
    assert(result != null, 'No ThemeProvider found in context');
    return result!;
  }

  @override
  State<ThemeModeProvider> createState() => _ThemeModeProviderState();
}

class _ThemeModeProviderState extends State<ThemeModeProvider> {
  ThemeMode _themeMode = ThemeMode.system;

  void _setThemeMode(ThemeMode mode) {
    if (_themeMode != mode) {
      setState(() => _themeMode = mode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InheritedThemeProvider(
      themeMode: _themeMode,
      setThemeMode: _setThemeMode,
      child: widget.child,
    );
  }
}

class InheritedThemeProvider extends InheritedWidget {
  const InheritedThemeProvider({
    required this.themeMode,
    required this.setThemeMode,
    required super.child,
    super.key,
  });

  final ThemeMode themeMode;
  final void Function(ThemeMode) setThemeMode;

  @override
  bool updateShouldNotify(InheritedThemeProvider oldWidget) {
    return themeMode != oldWidget.themeMode;
  }
}
