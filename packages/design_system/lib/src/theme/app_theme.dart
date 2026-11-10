import 'package:design_system/src/tokens/tokens.dart';
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show ColorScheme, Theme, ThemeData;

/// A theme produced by this package.
typedef AppThemeData = ThemeData;

/// Builds the three light themes.
abstract final class AppTheme() {
  static ThemeData light(AppThemeVariant variant, {bool highContrast = false}) {
    final colors = AppColors.forVariant(variant, highContrast: highContrast);

    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: colors.bgScreen,
      canvasColor: colors.bgScreen,
      extensions: [colors, AppTypography.system],
      colorScheme: ColorScheme.light(
        primary: colors.actionPrimary,
        onPrimary: colors.textOnAction,
        secondary: colors.accentLabel,
        onSecondary: colors.textOnAction,
        surface: colors.bgSurface,
        onSurface: colors.textPrimary,
        outline: colors.borderDefault,
      ),
    );
  }
}

extension AppThemeLookup on ThemeData {
  /// Semantic colours of the active theme.
  AppColors get colors => extension<AppColors>()!;

  /// Type scale of the active theme.
  AppTypography get type => extension<AppTypography>()!;
}

extension AppContextTheme on BuildContext {
  /// Semantic colour roles.
  AppColors get colors => Theme.of(this).colors;

  /// Type scale tokens.
  AppTypography get text => Theme.of(this).type;

  /// Screen margin, capped on wide screens by a centred single column.
  double get screenMargin => 20;

  /// Whether the window is wide enough to need a capped column.
  bool get isWide => MediaQuery.sizeOf(this).width > 600;
}
