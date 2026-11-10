import 'package:design_system/src/tokens/app_hue.dart';
import 'package:design_system/src/tokens/app_palette.dart';
import 'package:design_system/src/tokens/app_theme_variant.dart';
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show ThemeExtension;

/// Semantic colour roles, one set per theme.
///
/// Components read these roles or the fixed roles in `AppPalette`, never raw hex.
class const AppColors({
  required final AppThemeVariant variant,
  required final Color bgScreen,
  required final Color bgSurface,
  required final Color bgRing,
  required final Color bgTabBar,
  required final Color borderDefault,
  required final Color borderSelected,
  required final Color textPrimary,
  required final Color textSecondary,
  required final Color textPlaceholder,
  required final Color textOnAction,
  required final Color accentHighlight,
  required final Color accentLabel,
  required final Color accentSoft,
  required final Color accentOnSoft,
  required final Color washStrong,
  required final Color washLight,
  required final Color actionPrimary,
  required final Color actionPrimaryPressed,
  required final Color iconDefault,
  required final Color iconMuted,
  required final Color scrim,
}) extends ThemeExtension<AppColors> {
  static const rose = AppColors(
    variant: AppThemeVariant.rose,
    bgScreen: AppHue.roseBg,
    bgSurface: AppPalette.white,
    bgRing: AppPalette.ringSurface,
    bgTabBar: AppPalette.tabBarSurface,
    borderDefault: AppHue.roseBorder,
    borderSelected: AppPalette.neutral800,
    textPrimary: AppPalette.neutral900,
    textSecondary: AppPalette.neutral600,
    textPlaceholder: AppPalette.neutral400,
    textOnAction: AppPalette.white,
    accentHighlight: AppHue.roseHighlight,
    accentLabel: AppHue.roseLabel,
    accentSoft: AppHue.roseSoft,
    accentOnSoft: AppHue.roseOnSoft,
    washStrong: AppHue.roseWashStrong,
    washLight: AppHue.roseWashLight,
    actionPrimary: AppPalette.neutral800,
    actionPrimaryPressed: AppPalette.pressedAction,
    iconDefault: AppPalette.neutral900,
    iconMuted: AppPalette.neutral500,
    scrim: AppPalette.scrim,
  );

  static const blue = AppColors(
    variant: AppThemeVariant.blue,
    bgScreen: AppHue.blueBg,
    bgSurface: AppPalette.white,
    bgRing: AppPalette.ringSurface,
    bgTabBar: AppPalette.tabBarSurface,
    borderDefault: AppHue.blueBorder,
    borderSelected: AppPalette.neutral800,
    textPrimary: AppPalette.neutral900,
    textSecondary: AppPalette.neutral600,
    textPlaceholder: AppPalette.neutral400,
    textOnAction: AppPalette.white,
    accentHighlight: AppHue.blueHighlight,
    accentLabel: AppHue.blueLabel,
    accentSoft: AppHue.blueSoft,
    accentOnSoft: AppHue.blueOnSoft,
    washStrong: AppHue.blueWashStrong,
    washLight: AppHue.blueWashLight,
    actionPrimary: AppPalette.neutral800,
    actionPrimaryPressed: AppPalette.pressedAction,
    iconDefault: AppPalette.neutral900,
    iconMuted: AppPalette.neutral500,
    scrim: AppPalette.scrim,
  );

  static const neutral = AppColors(
    variant: AppThemeVariant.neutral,
    bgScreen: AppHue.neutralBg,
    bgSurface: AppPalette.white,
    bgRing: AppPalette.ringSurface,
    bgTabBar: AppPalette.tabBarSurface,
    borderDefault: AppHue.neutralBorder,
    borderSelected: AppPalette.neutral800,
    textPrimary: AppPalette.neutral900,
    textSecondary: AppPalette.neutral600,
    textPlaceholder: AppPalette.neutral400,
    textOnAction: AppPalette.white,
    accentHighlight: AppHue.neutralHighlight,
    accentLabel: AppHue.neutralLabel,
    accentSoft: AppHue.neutralSoft,
    accentOnSoft: AppHue.neutralOnSoft,
    washStrong: AppHue.neutralWashStrong,
    washLight: AppHue.neutralWashLight,
    actionPrimary: AppPalette.neutral800,
    actionPrimaryPressed: AppPalette.pressedAction,
    iconDefault: AppPalette.neutral900,
    iconMuted: AppPalette.neutral500,
    scrim: AppPalette.scrim,
  );

  static AppColors forVariant(AppThemeVariant variant, {bool highContrast = false}) {
    final colors = switch (variant) {
      .rose => rose,
      .blue => blue,
      .neutral => neutral,
    };
    return highContrast ? colors.highContrast : colors;
  }

  /// Darker borders and secondary ink for the high-contrast switch.
  AppColors get highContrast => copyWith(
    borderDefault: AppPalette.neutral700,
    borderSelected: AppPalette.neutral900,
    textSecondary: AppPalette.neutral800,
    textPlaceholder: AppPalette.neutral600,
    iconMuted: AppPalette.neutral700,
  );

  @override
  AppColors copyWith({
    AppThemeVariant? variant,
    Color? bgScreen,
    Color? bgSurface,
    Color? bgRing,
    Color? bgTabBar,
    Color? borderDefault,
    Color? borderSelected,
    Color? textPrimary,
    Color? textSecondary,
    Color? textPlaceholder,
    Color? textOnAction,
    Color? accentHighlight,
    Color? accentLabel,
    Color? accentSoft,
    Color? accentOnSoft,
    Color? washStrong,
    Color? washLight,
    Color? actionPrimary,
    Color? actionPrimaryPressed,
    Color? iconDefault,
    Color? iconMuted,
    Color? scrim,
  }) {
    return AppColors(
      variant: variant ?? this.variant,
      bgScreen: bgScreen ?? this.bgScreen,
      bgSurface: bgSurface ?? this.bgSurface,
      bgRing: bgRing ?? this.bgRing,
      bgTabBar: bgTabBar ?? this.bgTabBar,
      borderDefault: borderDefault ?? this.borderDefault,
      borderSelected: borderSelected ?? this.borderSelected,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textPlaceholder: textPlaceholder ?? this.textPlaceholder,
      textOnAction: textOnAction ?? this.textOnAction,
      accentHighlight: accentHighlight ?? this.accentHighlight,
      accentLabel: accentLabel ?? this.accentLabel,
      accentSoft: accentSoft ?? this.accentSoft,
      accentOnSoft: accentOnSoft ?? this.accentOnSoft,
      washStrong: washStrong ?? this.washStrong,
      washLight: washLight ?? this.washLight,
      actionPrimary: actionPrimary ?? this.actionPrimary,
      actionPrimaryPressed: actionPrimaryPressed ?? this.actionPrimaryPressed,
      iconDefault: iconDefault ?? this.iconDefault,
      iconMuted: iconMuted ?? this.iconMuted,
      scrim: scrim ?? this.scrim,
    );
  }

  @override
  AppColors lerp(covariant AppColors? other, double t) {
    if (other == null) return this;

    return AppColors(
      variant: t < .5 ? variant : other.variant,
      bgScreen: Color.lerp(bgScreen, other.bgScreen, t)!,
      bgSurface: Color.lerp(bgSurface, other.bgSurface, t)!,
      bgRing: Color.lerp(bgRing, other.bgRing, t)!,
      bgTabBar: Color.lerp(bgTabBar, other.bgTabBar, t)!,
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t)!,
      borderSelected: Color.lerp(borderSelected, other.borderSelected, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textPlaceholder: Color.lerp(textPlaceholder, other.textPlaceholder, t)!,
      textOnAction: Color.lerp(textOnAction, other.textOnAction, t)!,
      accentHighlight: Color.lerp(accentHighlight, other.accentHighlight, t)!,
      accentLabel: Color.lerp(accentLabel, other.accentLabel, t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      accentOnSoft: Color.lerp(accentOnSoft, other.accentOnSoft, t)!,
      washStrong: Color.lerp(washStrong, other.washStrong, t)!,
      washLight: Color.lerp(washLight, other.washLight, t)!,
      actionPrimary: Color.lerp(actionPrimary, other.actionPrimary, t)!,
      actionPrimaryPressed: Color.lerp(actionPrimaryPressed, other.actionPrimaryPressed, t)!,
      iconDefault: Color.lerp(iconDefault, other.iconDefault, t)!,
      iconMuted: Color.lerp(iconMuted, other.iconMuted, t)!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
    );
  }
}
