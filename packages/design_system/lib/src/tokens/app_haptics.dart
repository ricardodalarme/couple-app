import 'package:flutter/services.dart';

/// Light for confirming an action; selection for changing a value. Never on
/// errors.
abstract final class AppHaptics() {
  static Future<void> light() => HapticFeedback.lightImpact();

  static Future<void> selection() => HapticFeedback.selectionClick();
}
