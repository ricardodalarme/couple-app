import 'package:design_system/src/tokens/app_colors.dart';
import 'package:design_system/src/tokens/app_palette.dart';
import 'package:flutter/widgets.dart';

/// Fixed category roles used by list cards, tags and calendar rows.
enum AppCategory() {
  idea,
  dates,
  invite,

  /// The theme's own accent.
  card,
}

extension AppCategoryColors on AppCategory {
  /// Label and icon colour for the category.
  Color labelColor(AppColors colors) => switch (this) {
    .idea => AppPalette.ideaLabel,
    .dates => AppPalette.datesLabel,
    .invite => AppPalette.inviteLabel,
    .card => colors.accentLabel,
  };

  /// Corner wash behind the card content.
  Color washColor(AppColors colors) => switch (this) {
    .idea => AppPalette.ideaWash,
    .dates => AppPalette.datesWash,
    .invite => AppPalette.inviteWash,
    .card => colors.washStrong,
  };
}

/// Fixed system status roles, never used for content.
enum AppStatus() {
  error,
  warning,
  info,
  safety,
}

extension AppStatusColors on AppStatus {
  /// Text and icon colour.
  Color inkColor(AppColors colors) => switch (this) {
    .error => AppPalette.errorInk,
    .warning => AppPalette.warningInk,
    .info => colors.accentLabel,
    .safety => AppPalette.safetyInk,
  };

  /// Background colour.
  Color surfaceColor(AppColors colors) => switch (this) {
    .error => AppPalette.errorSurface,
    .warning => AppPalette.warningSurface,
    .info => colors.accentSoft,
    .safety => AppPalette.safetySurface,
  };
}
