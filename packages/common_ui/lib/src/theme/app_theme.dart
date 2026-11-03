import 'package:common_ui/src/theme/palette.dart';
import 'package:common_ui/src/theme/typography.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show ColorScheme, ThemeData;

abstract final class AppTheme() {
  static const _typography = Typography();
  static const _lightPalette = Palette.light();
  static const _darkPalette = Palette.dark();

  static final light = ThemeData(
    brightness: Brightness.light,
    extensions: const [_lightPalette, _typography],
    colorScheme: _getThemeColorScheme(_lightPalette, Brightness.light),
  );
  static final dark = ThemeData(
    brightness: Brightness.dark,
    extensions: const [_darkPalette, _typography],
    colorScheme: _getThemeColorScheme(_darkPalette, Brightness.dark),
  );

  static ColorScheme _getThemeColorScheme(Palette palette, Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: palette.primary,
      onPrimary: palette.onPrimary,
      secondary: palette.secondary,
      onSecondary: palette.onSecondary,
      error: palette.error,
      onError: palette.onError,
      surface: palette.container,
      onSurface: palette.onContainer,
    );
  }
}
