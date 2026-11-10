import 'package:design_system/src/tokens/app_palette.dart';
import 'package:flutter/widgets.dart';

/// The only shadows in the system; none are coloured.
abstract final class AppShadows() {
  /// Card ring: y 10, blur 30, spread −18, black 12%.
  static const List<BoxShadow> ring = [
    BoxShadow(
      color: AppPalette.shadowRing,
      offset: Offset(0, 10),
      blurRadius: 30,
      spreadRadius: -18,
    ),
  ];

  /// Face circle: y 2, blur 8, black 4%.
  static const List<BoxShadow> face = [
    BoxShadow(color: AppPalette.shadowFace, offset: Offset(0, 2), blurRadius: 8),
  ];

  /// Paper note: y 12, blur 26, spread −18, black 22%.
  static const List<BoxShadow> paper = [
    BoxShadow(
      color: AppPalette.shadowPaper,
      offset: Offset(0, 12),
      blurRadius: 26,
      spreadRadius: -18,
    ),
  ];

  /// Slider and switch knob: y 4, blur 10, black 16%.
  static const List<BoxShadow> knob = [
    BoxShadow(color: AppPalette.shadowKnob, offset: Offset(0, 4), blurRadius: 10),
  ];

  /// Selected option: y 10, blur 24, spread −16, black 30%.
  static const List<BoxShadow> selected = [
    BoxShadow(
      color: AppPalette.shadowSelected,
      offset: Offset(0, 10),
      blurRadius: 24,
      spreadRadius: -16,
    ),
  ];
}
