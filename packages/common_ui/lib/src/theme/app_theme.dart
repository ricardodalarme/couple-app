import 'package:common_ui/src/theme/typography.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show ThemeData;

abstract final class AppTheme {
  static const _extensions = [Typography()];

  static final light = ThemeData(brightness: Brightness.light, extensions: _extensions);
  static final dark = ThemeData(brightness: Brightness.dark, extensions: _extensions);
}
