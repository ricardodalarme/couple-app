import 'package:common_ui/src/theme/palette.dart';
import 'package:common_ui/src/theme/typography.dart';
import 'package:flutter/material.dart' show Theme;
import 'package:flutter/widgets.dart';

extension ThemeExtension on BuildContext {
  Typography get typography => Theme.of(this).extension<Typography>()!;
  Palette get palette => Theme.of(this).extension<Palette>()!;
}
