import 'package:common_ui/src/theme/typography.dart';
import 'package:flutter/material.dart' show ColorScheme, Theme;
import 'package:flutter/widgets.dart';

extension ThemeExtension on BuildContext {
  Typography get typography => Theme.of(this).extension<Typography>()!;
  ColorScheme get colors => Theme.of(this).colorScheme;
}
