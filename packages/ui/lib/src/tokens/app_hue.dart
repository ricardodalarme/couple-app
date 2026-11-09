import 'package:flutter/widgets.dart';
import 'package:ui/src/tokens/app_colors.dart' show AppColors;
import 'package:ui/src/tokens/tokens.dart' show AppColors;
import 'package:ui/ui.dart' show AppColors;

/// The primitive hue ramp behind each theme. Three layers, always:
/// primitives here, semantic roles in [AppColors], component tokens last.
abstract final class AppHue() {
  // Rose.
  static const Color roseBg = Color(0xFFFBF7F8);
  static const Color roseBorder = Color(0xFFF0E4E7);
  static const Color roseSoft = Color(0xFFFBE3E9);
  static const Color roseHighlight = Color(0xFFE8577A);
  static const Color roseLabel = Color(0xFFC93A60);
  static const Color roseOnSoft = Color(0xFFAD2C52);
  static const Color roseWashStrong = Color(0xCCFAD4DE);
  static const Color roseWashLight = Color(0xB3FDF0F3);

  // Blue.
  static const Color blueBg = Color(0xFFF6F9FC);
  static const Color blueBorder = Color(0xFFE2EAF3);
  static const Color blueSoft = Color(0xFFE1EDFB);
  static const Color blueHighlight = Color(0xFF3C86DA);
  static const Color blueLabel = Color(0xFF2470C2);
  static const Color blueOnSoft = Color(0xFF1F63AE);
  static const Color blueWashStrong = Color(0xD9CEE2FA);
  static const Color blueWashLight = Color(0xB3EEF4FD);

  // Neutral.
  static const Color neutralBg = Color(0xFFF8F8F5);
  static const Color neutralBorder = Color(0xFFE8E7E1);
  static const Color neutralSoft = Color(0xFFE2F0E7);
  static const Color neutralHighlight = Color(0xFF3A8E68);
  static const Color neutralLabel = Color(0xFF287752);
  static const Color neutralOnSoft = Color(0xFF22694A);
  static const Color neutralWashStrong = Color(0xD9D6ECDE);
  static const Color neutralWashLight = Color(0xB3F1F7F2);
}
