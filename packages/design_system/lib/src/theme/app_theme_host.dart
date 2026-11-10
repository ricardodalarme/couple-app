import 'package:design_system/src/theme/app_theme.dart';
import 'package:design_system/src/tokens/tokens.dart';
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show Theme;

/// Holds the selected theme and rebuilds descendants when it changes.
///
/// Descendants switch it through [AppThemeScope.set].
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
  /// The current variant, defaulting to [AppThemeVariant.rose] outside a host.
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
