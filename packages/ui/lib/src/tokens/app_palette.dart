import 'package:flutter/widgets.dart';

/// Raw colour values. Screens and components never read these directly; they
/// read semantic roles from the theme or a category/status role from here.
abstract final class AppPalette() {
  // Neutral primitives. Slightly warm grey, identical in every theme.
  static const Color neutral0 = Color(0xFFFFFFFF);
  static const Color neutral25 = Color(0xFFFAFAFA);
  static const Color neutral100 = Color(0xFFE9E5E6);
  static const Color neutral150 = Color(0xFFE3DEDF);
  static const Color neutral200 = Color(0xFFCFC9CB);
  static const Color neutral300 = Color(0xFFC2BCBE);
  static const Color neutral400 = Color(0xFFABA4A7);
  static const Color neutral500 = Color(0xFF8C8689);
  static const Color neutral600 = Color(0xFF736D70);
  static const Color neutral700 = Color(0xFF4A4547);
  static const Color neutral800 = Color(0xFF2B2828);
  static const Color neutral900 = Color(0xFF1F1D1E);

  // Shared surfaces and lines.
  static const Color white = Color(0xFFFFFFFF);
  static const Color ringSurface = Color(0xCCFFFFFF);
  static const Color tabBarSurface = Color(0xF0FFFFFF);
  static const Color innerGlow = Color(0xE6FFFFFF);
  static const Color scrim = Color(0x52000000);
  static const Color pressedAction = Color(0xFF141213);

  // Avatars without a photo. Fixed across themes.
  static const Color partnerAvatarSurface = Color(0xFFECE8E6);
  static const Color partnerAvatarInk = Color(0xFF5B524E);

  // Category roles. Fixed across themes.
  static const Color ideaLabel = Color(0xFFAE5219);
  static const Color ideaWash = Color(0xE6FDE5D0);
  static const Color datesLabel = Color(0xFF6E46BE);
  static const Color datesWash = Color(0xF2E9E0FC);
  static const Color inviteLabel = Color(0xFF23774F);
  static const Color inviteWash = Color(0xE6D6EEE0);

  // System status roles. Never used for the couple's content.
  static const Color errorInk = Color(0xFFB3261E);
  static const Color errorSurface = Color(0xFFFDECEA);
  static const Color warningInk = Color(0xFF8A5A00);
  static const Color warningSurface = Color(0xFFFFF4DC);
  static const Color safetyInk = Color(0xFF1F1D1E);
  static const Color safetySurface = Color(0xFFF3F1F2);

  // Drawing details.
  static const Color faceBorder = Color(0x0D000000);
  static const Color foldShadow = Color(0x0F000000);

  // Shadow inks.
  static const Color shadowRing = Color(0x1F000000);
  static const Color shadowFace = Color(0x0A000000);
  static const Color shadowPaper = Color(0x38000000);
  static const Color shadowSelected = Color(0x4D000000);
  static const Color shadowKnob = Color(0x29000000);
  static const Color drawingInk = Color(0xFF2A2627);
}
