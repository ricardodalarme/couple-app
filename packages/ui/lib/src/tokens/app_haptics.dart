import 'package:flutter/services.dart';

/// Tactile feedback tokens.
///
/// Light when saving a slip, sending or reacting; selection when changing a
/// chip, segment, option or passing a slider mark. Never on errors.
abstract final class AppHaptics() {
  static Future<void> light() => HapticFeedback.lightImpact();

  static Future<void> selection() => HapticFeedback.selectionClick();
}
