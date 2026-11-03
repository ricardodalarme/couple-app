import 'package:flutter/animation.dart';

/// Shared easing curves for the design system.
abstract final class Easings() {
  /// standard — for most in-place state changes.
  static const Curve standard = Curves.easeOutCubic;

  /// decelerate — entrances and reveals.
  static const Curve decelerate = Curves.easeOut;

  /// accelerate — exits and dismissals.
  static const Curve accelerate = Curves.easeIn;

  /// emphasized — selection and hero transitions.
  static const Curve emphasized = Curves.easeInOutCubicEmphasized;
}
