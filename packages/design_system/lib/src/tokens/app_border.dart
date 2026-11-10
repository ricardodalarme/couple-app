import 'package:design_system/src/tokens/app_palette.dart';
import 'package:flutter/widgets.dart';

/// Border widths and dash rhythm.
abstract final class AppBorder() {
  static const double hair = 1;
  static const double inner = 1;
  static const double selected = 1.5;
  static const double dashed = 1.5;
  static const double focus = 2;
  static const double focusOffset = 2;
  static const double error = 1.5;

  static const List<double> dashPattern = [4, 3];
}

/// Border descriptions shared by cards, chips and secondary buttons.
abstract final class AppBorders() {
  /// Thin tinted edge used on cards, chips and secondary buttons.
  static BoxBorder hair(Color color) => Border.all(color: color);

  /// Selected option edge.
  static BoxBorder selected(Color color) => Border.all(color: color, width: 1.5);

  /// White inner glow of a card.
  static BoxBorder innerGlow() => Border.all(color: AppPalette.innerGlow);
}
