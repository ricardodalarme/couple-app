import 'dart:math' as math;

import 'package:flutter/widgets.dart';

/// The text sizes offered in the app preferences.
enum AppTextScale(final double factor) {
  small(.9),
  medium(1),
  large(1.15),
  extraLarge(1.3);

  static AppTextScale fromFactor(double factor) =>
      values.firstWhere((value) => (value.factor - factor).abs() < .001, orElse: () => medium);
}

const double minTextScaleFactor = .8;
const double maxTextScaleFactor = 2;

/// Multiplies a system scaler by the app choice without flattening nonlinear scaling.
final class const AppTextScaler({required final TextScaler system, required final double appScale})
    extends TextScaler {
  @override
  double scale(double fontSize) {
    final systemSize = system.scale(fontSize);
    final lower = appScale < 1 ? fontSize * minTextScaleFactor : systemSize;
    final upper = math.max(systemSize, fontSize * maxTextScaleFactor);

    return math.max(lower, math.min(upper, systemSize * appScale));
  }

  @override
  double get textScaleFactor => scale(1);

  @override
  bool operator ==(Object other) =>
      other is AppTextScaler && other.system == system && other.appScale == appScale;

  @override
  int get hashCode => Object.hash(system, appScale);

  @override
  String toString() => 'AppTextScaler($system, ${appScale}x)';
}
