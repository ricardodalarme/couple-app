import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show Theme;
import 'package:ui/src/theme/app_theme.dart';
import 'package:ui/src/tokens/tokens.dart';

/// Holds the theme the person picked and rebuilds the app when it changes.
///
/// Onboarding and Settings call [AppThemeScope.set] through a descendant;
/// nothing else needs to know how the theme is stored.
class const AppThemeHost({
  required final AppThemeVariant initialVariant,
  required final Widget child,
  super.key,
}) extends StatefulWidget {
  @override
  State<AppThemeHost> createState() => _AppThemeHostState();
}

class _AppThemeHostState() extends State<AppThemeHost> {
  late AppThemeVariant _variant;

  @override
  void initState() {
    super.initState();
    _variant = widget.initialVariant;
  }

  void _setVariant(AppThemeVariant variant) {
    if (_variant != variant) setState(() => _variant = variant);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.light(_variant),
      child: AppThemeScope(variant: _variant, onChanged: _setVariant, child: widget.child),
    );
  }
}

/// The active theme variant, readable from any descendant.
class const AppThemeScope({
  required final AppThemeVariant variant,
  required final ValueChanged<AppThemeVariant> onChanged,
  required super.child,
  super.key,
}) extends InheritedWidget {
  /// The current variant, defaulting to pink outside a host.
  static AppThemeVariant of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppThemeScope>()?.variant ?? AppThemeVariant.rose;

  /// Switches the theme. Safe to call when no host is above.
  static void set(BuildContext context, AppThemeVariant variant) {
    context.dependOnInheritedWidgetOfExactType<AppThemeScope>()?.onChanged(variant);
  }

  @override
  bool updateShouldNotify(AppThemeScope oldWidget) => variant != oldWidget.variant;
}

/// Applies one theme variant to a subtree without owning the choice.
class const AppThemed({
  required final AppThemeVariant variant,
  required final Widget child,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Theme(data: AppTheme.light(variant), child: child);
}
