import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter/widgets.dart';

class const ThemeModeProvider({required final Widget child, super.key}) extends StatefulWidget {
  static InheritedThemeProvider of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<InheritedThemeProvider>();
    assert(result != null, 'No ThemeProvider found in context');
    return result!;
  }

  static InheritedThemeProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedThemeProvider>();
  }

  @override
  State<ThemeModeProvider> createState() => _ThemeModeProviderState();
}

class _ThemeModeProviderState() extends State<ThemeModeProvider> {
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

class const InheritedThemeProvider({
  required final ThemeMode themeMode,
  required final void Function(ThemeMode) setThemeMode,
  required super.child,
  super.key,
}) extends InheritedWidget {
  @override
  bool updateShouldNotify(InheritedThemeProvider oldWidget) {
    return themeMode != oldWidget.themeMode;
  }
}
