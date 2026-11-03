import 'package:common_ui/src/theme/palette.dart';
import 'package:common_ui/src/theme/typography.dart';
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show Theme;

extension BuildContextExtension on BuildContext {
  Typography get typography => Theme.of(this).extension<Typography>()!;
  Palette get palette => Theme.of(this).extension<Palette>()!;
}
