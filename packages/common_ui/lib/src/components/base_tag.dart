import 'package:common_ui/src/extensions/build_context_extension.dart';
import 'package:common_ui/src/theme/palette.dart';
import 'package:common_ui/src/tokens/borders.dart';
import 'package:common_ui/src/tokens/spacings.dart';
import 'package:flutter/widgets.dart';

/// Accent variant for a [BaseTag].
enum BaseTagVariant() {
  primary,
  secondary,
  success,
  error,
  neutral,
}

/// The fill emphasis of a [BaseTag].
///
/// [soft] tints the background and keeps the label on the foreground color;
/// [solid] fills the shape with the accent and switches to an on-accent label.
enum BaseTagEmphasis() {
  soft,
  solid,
}

/// A compact, uppercase label marking a category or status.
class const BaseTag(
  final String label, {
  final BaseTagVariant variant = BaseTagVariant.primary,
  final BaseTagEmphasis emphasis = BaseTagEmphasis.soft,
  super.key,
}) extends StatelessWidget {
  static const double _softBackgroundOpacity = 0.1;
  static const double _softBorderOpacity = 0.25;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final accent = _accentColor(palette);
    final isSolid = emphasis == BaseTagEmphasis.solid;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: isSolid ? accent : accent.withValues(alpha: _softBackgroundOpacity),
        borderRadius: BorderRadius.circular(Borders.xlarge),
        border: isSolid ? null : Border.all(color: accent.withValues(alpha: _softBorderOpacity)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacings.small, vertical: Spacings.xsmall),
        child: Text(
          label.toUpperCase(),
          style: context.typography.labelSmall.copyWith(
            color: isSolid ? _solidForeground(palette) : palette.onBackground,
          ),
        ),
      ),
    );
  }

  Color _accentColor(Palette palette) => switch (variant) {
    BaseTagVariant.primary => palette.primary,
    BaseTagVariant.secondary => palette.secondary,
    BaseTagVariant.success => palette.success,
    BaseTagVariant.error => palette.error,
    BaseTagVariant.neutral => palette.onBackground,
  };

  Color _solidForeground(Palette palette) => switch (variant) {
    BaseTagVariant.primary => palette.onPrimary,
    BaseTagVariant.secondary => palette.onSecondary,
    BaseTagVariant.success => palette.onSuccess,
    BaseTagVariant.error => palette.onError,
    BaseTagVariant.neutral => palette.background,
  };
}
