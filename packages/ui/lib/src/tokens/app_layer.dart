/// Stacking order used by overlays and fixed chrome.
abstract final class AppLayer() {
  static const int content = 0;
  static const int bar = 10;
  static const int banner = 20;
  static const int scrim = 30;
  static const int overlay = 40;
  static const int toast = 50;
}
