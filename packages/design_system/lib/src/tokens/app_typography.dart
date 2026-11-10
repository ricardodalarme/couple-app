import 'package:design_system/src/tokens/app_palette.dart';
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show ThemeExtension;

/// The type scale, one [TextStyle] per token.
///
/// Sizes follow the system text scale up to 200%.
class const AppTypography({
  required final TextStyle display,
  required final TextStyle titleXl,
  required final TextStyle titleLg,
  required final TextStyle question,
  required final TextStyle titleMd,
  required final TextStyle titleSm,
  required final TextStyle titleXs,
  required final TextStyle bodyLg,
  required final TextStyle body,
  required final TextStyle bodySm,
  required final TextStyle caption,
  required final TextStyle label,
  required final TextStyle micro,
  required final TextStyle tab,
  required final TextStyle hand,
}) extends ThemeExtension<AppTypography> {
  static const system = AppTypography(
    display: TextStyle(
      color: AppPalette.neutral900,
      fontSize: 34,
      height: 38 / 34,
      fontWeight: FontWeight.w600,
      letterSpacing: -1.2,
    ),
    titleXl: TextStyle(
      fontSize: 30,
      height: 36 / 30,
      fontWeight: FontWeight.w600,
      letterSpacing: -.9,
    ),
    titleLg: TextStyle(
      color: AppPalette.neutral900,
      fontSize: 28,
      height: 32 / 28,
      fontWeight: FontWeight.w600,
      letterSpacing: -.85,
    ),
    question: TextStyle(
      color: AppPalette.neutral900,
      fontSize: 26,
      height: 32 / 26,
      fontWeight: FontWeight.w600,
      letterSpacing: -.65,
    ),
    titleMd: TextStyle(
      color: AppPalette.neutral900,
      fontSize: 23,
      height: 28 / 23,
      fontWeight: FontWeight.w600,
      letterSpacing: -.55,
    ),
    titleSm: TextStyle(
      color: AppPalette.neutral900,
      fontSize: 17,
      height: 22 / 17,
      fontWeight: FontWeight.w500,
      letterSpacing: -.25,
    ),
    titleXs: TextStyle(
      color: AppPalette.neutral900,
      fontSize: 16,
      height: 21 / 16,
      fontWeight: FontWeight.w600,
      letterSpacing: -.25,
    ),
    bodyLg: TextStyle(
      color: AppPalette.neutral900,
      fontSize: 20,
      height: 28 / 20,
      fontWeight: FontWeight.w500,
      letterSpacing: -.3,
    ),
    body: TextStyle(
      color: AppPalette.neutral900,
      fontSize: 16,
      height: 22 / 16,
      fontWeight: FontWeight.w500,
      letterSpacing: -.2,
    ),
    bodySm: TextStyle(
      color: AppPalette.neutral900,
      fontSize: 15,
      height: 21 / 15,
      fontWeight: FontWeight.w400,
      letterSpacing: -.15,
    ),
    caption: TextStyle(
      color: AppPalette.neutral900,
      fontSize: 13.5,
      height: 19 / 13.5,
      fontWeight: FontWeight.w400,
    ),
    label: TextStyle(
      color: AppPalette.neutral900,
      fontSize: 13,
      height: 16 / 13,
      fontWeight: FontWeight.w600,
      letterSpacing: .13,
    ),
    micro: TextStyle(
      color: AppPalette.neutral900,
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w500,
    ),
    tab: TextStyle(
      color: AppPalette.neutral900,
      fontSize: 10.5,
      height: 13 / 10.5,
      fontWeight: FontWeight.w500,
    ),
    hand: TextStyle(
      color: AppPalette.neutral900,
      fontFamily: 'Caveat',
      fontSize: 25,
      height: 29 / 25,
      fontWeight: FontWeight.w600,
      fontVariations: [FontVariation('wght', 600)],
    ),
  );

  @override
  AppTypography copyWith({
    TextStyle? display,
    TextStyle? titleXl,
    TextStyle? titleLg,
    TextStyle? question,
    TextStyle? titleMd,
    TextStyle? titleSm,
    TextStyle? titleXs,
    TextStyle? bodyLg,
    TextStyle? body,
    TextStyle? bodySm,
    TextStyle? caption,
    TextStyle? label,
    TextStyle? micro,
    TextStyle? tab,
    TextStyle? hand,
  }) {
    return AppTypography(
      display: display ?? this.display,
      titleXl: titleXl ?? this.titleXl,
      titleLg: titleLg ?? this.titleLg,
      question: question ?? this.question,
      titleMd: titleMd ?? this.titleMd,
      titleSm: titleSm ?? this.titleSm,
      titleXs: titleXs ?? this.titleXs,
      bodyLg: bodyLg ?? this.bodyLg,
      body: body ?? this.body,
      bodySm: bodySm ?? this.bodySm,
      caption: caption ?? this.caption,
      label: label ?? this.label,
      micro: micro ?? this.micro,
      tab: tab ?? this.tab,
      hand: hand ?? this.hand,
    );
  }

  @override
  AppTypography lerp(covariant AppTypography? other, double t) {
    if (other == null) return this;

    return AppTypography(
      display: TextStyle.lerp(display, other.display, t)!,
      titleXl: TextStyle.lerp(titleXl, other.titleXl, t)!,
      titleLg: TextStyle.lerp(titleLg, other.titleLg, t)!,
      question: TextStyle.lerp(question, other.question, t)!,
      titleMd: TextStyle.lerp(titleMd, other.titleMd, t)!,
      titleSm: TextStyle.lerp(titleSm, other.titleSm, t)!,
      titleXs: TextStyle.lerp(titleXs, other.titleXs, t)!,
      bodyLg: TextStyle.lerp(bodyLg, other.bodyLg, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      bodySm: TextStyle.lerp(bodySm, other.bodySm, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
      label: TextStyle.lerp(label, other.label, t)!,
      micro: TextStyle.lerp(micro, other.micro, t)!,
      tab: TextStyle.lerp(tab, other.tab, t)!,
      hand: TextStyle.lerp(hand, other.hand, t)!,
    );
  }
}
