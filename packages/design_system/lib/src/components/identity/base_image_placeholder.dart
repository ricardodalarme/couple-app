import 'package:design_system/design_system.dart';

/// The frame proportions an image placeholder can take.
enum BaseImagePlaceholderRatio() {
  square,
  fourByThree,
  sixteenByNine,
}

/// What [BaseImagePlaceholder] shows for the image at that moment.
enum BaseImagePlaceholderStatus() {
  empty,
  loading,
  failure,
}

/// A framed slot for a photo or illustration.
///
/// Shows a skeleton, a retry mark or [icon] depending on [status].
class const BaseImagePlaceholder({
  final BaseImagePlaceholderRatio ratio = BaseImagePlaceholderRatio.square,
  final BaseImagePlaceholderStatus status = BaseImagePlaceholderStatus.empty,
  final IconData icon = AppIcons.image,
  final VoidCallback? onRetry,
  final String? semanticLabel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final frame = ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: AspectRatio(aspectRatio: _aspectRatio, child: _body(context)),
    );

    if (status == BaseImagePlaceholderStatus.failure && onRetry != null) {
      return AppPressable(
        onTap: onRetry,
        borderRadius: BorderRadius.circular(AppRadius.md),
        semanticLabel: semanticLabel,
        enforceMinTapTarget: true,
        child: frame,
      );
    }
    if (semanticLabel == null) return frame;

    return Semantics(label: semanticLabel, image: true, child: frame);
  }

  Widget _body(BuildContext context) {
    final colors = context.colors;

    return switch (status) {
      .empty => ColoredBox(
        color: colors.accentSoft,
        child: Center(
          child: AppIcon(icon: icon, size: AppIconSize.lg, color: colors.accentHighlight),
        ),
      ),
      .loading => const Skeletonizer(
        containersColor: AppPalette.neutral100,
        child: SizedBox.expand(child: ColoredBox(color: AppPalette.neutral100)),
      ),
      .failure => ColoredBox(
        color: AppStatus.safety.surfaceColor(colors),
        child: Center(
          child: AppIcon(icon: AppIcons.image, size: AppIconSize.lg, color: colors.textSecondary),
        ),
      ),
    };
  }

  double get _aspectRatio => switch (ratio) {
    .square => 1,
    .fourByThree => 4 / 3,
    .sixteenByNine => 16 / 9,
  };
}
