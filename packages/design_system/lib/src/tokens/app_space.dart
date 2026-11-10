/// Spacing scale; off-grid values (6, 14, 18, 22) are for inside-component rhythm.
abstract final class AppSpace() {
  static const double s2 = 2;
  static const double s4 = 4;
  static const double s6 = 6;
  static const double s8 = 8;
  static const double s10 = 10;
  static const double s12 = 12;
  static const double s14 = 14;
  static const double s16 = 16;
  static const double s18 = 18;
  static const double s20 = 20;
  static const double s22 = 22;
  static const double s24 = 24;
  static const double s26 = 26;
  static const double s28 = 28;
  static const double s34 = 34;
  static const double s44 = 44;
  static const double s120 = 120;

  /// Lateral screen margin.
  static const double screenMargin = 20;

  /// Content starts this far below the safe area.
  static const double screenTop = 14;

  /// Gap between sections on a tab screen.
  static const double sectionGap = 28;

  /// Gap between stacked cards.
  static const double cardGap = 12;

  /// Fixed action footer distance from the bottom edge.
  static const double footerBottom = 34;

  /// Tail space so content scrolls clear of the tab bar.
  static const double scrollTail = 120;

  /// Single-column cap on tablets.
  static const double maxContentWidth = 560;

  /// Tab bar height including the safe area.
  static const double tabBarHeight = 84;

  /// Smallest supported window width.
  static const double minWidth = 320;

  /// Below this width chips wrap and footers stack their buttons.
  static const double compactWidth = 360;
}
