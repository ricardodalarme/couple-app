import 'package:flutter/widgets.dart';

/// Motion tokens. Short and calm; every duration collapses to a 150 ms fade
/// when the system asks to reduce motion.
abstract final class AppMotion() {
  static const Duration fast = Duration(milliseconds: 120);
  static const Duration base = Duration(milliseconds: 220);
  static const Duration slow = Duration(milliseconds: 360);
  static const Duration reduced = Duration(milliseconds: 150);
  static const Duration stagger = Duration(milliseconds: 80);
  static const Duration squiggleDraw = Duration(milliseconds: 400);

  static const Curve baseCurve = Cubic(.2, 0, 0, 1);
  static const Curve fastCurve = Cubic(.16, 1, .3, 1);

  /// Spring used when a slip lands on the week and notes arrive.
  static const double springStiffness = 300;
  static const double springDamping = 24;

  /// The press scale used by every tappable surface.
  static const double pressedScale = .97;
}

extension AppMotionContext on BuildContext {
  /// Whether the platform asks for reduced motion.
  bool get reduceMotion => MediaQuery.maybeDisableAnimationsOf(this) ?? false;

  /// [duration], or the standard fade when reduced motion is on.
  Duration motionDuration(Duration duration) => reduceMotion ? AppMotion.reduced : duration;

  /// Scale for a pressed surface, or 1 when animation should be skipped.
  double get pressScale => reduceMotion ? 1 : AppMotion.pressedScale;
}
