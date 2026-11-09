import 'dart:math' as math;

import 'package:ui/ui.dart';

/// Top padding of the empty state in the feedback spec.
const double _paddingTop = 40;

/// Corner radius of the dashed empty-state surface in the feedback spec.
const double _radius = 24;

/// A centred invitation shown when a collection has nothing in it yet.
///
/// The copy is always the caller's; the face, title and supporting line are the
/// whole visual, so the tone stays inviting rather than reproachful.
class const BaseEmptyState({
  required final String title,
  required final String text,
  final String? actionText,
  final VoidCallback? onAction,
  final bool isSecondaryAction = false,
  final FaceKind face = FaceKind.smile,
  final String? faceLabel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final action = actionText;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.bgScreen,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: CustomPaint(
        foregroundPainter: _DashedBorderPainter(color: colors.borderDefault, radius: _radius),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(AppSpace.s24, _paddingTop, AppSpace.s24, AppSpace.s28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BaseFace(kind: face, size: FaceSize.showcase, semanticLabel: faceLabel),
              const SizedBox(height: AppSpace.s10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.text.titleSm.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpace.s10),
              Text(
                text,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.text.bodySm.copyWith(color: colors.textSecondary),
              ),
              if (action != null) ...[
                const SizedBox(height: AppSpace.s18),
                _EmptyStateAction(text: action, onTap: onAction, isSecondary: isSecondaryAction),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class const _EmptyStateAction({
  required final String text,
  required final VoidCallback? onTap,
  required final bool isSecondary,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AppPressable(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      enforceMinTapTarget: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSecondary ? colors.bgSurface : colors.actionPrimary,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: isSecondary ? AppBorders.hair(colors.borderDefault) : null,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: AppSpace.s44),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.s18),
            child: Center(
              widthFactor: 1,
              heightFactor: 1,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: context.text.bodySm.copyWith(
                  fontWeight: FontWeight.w500,
                  color: isSecondary ? colors.textPrimary : colors.textOnAction,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class const _DashedBorderPainter({required final Color color, required final double radius})
    extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = AppBorder.dashed;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          (Offset.zero & size).deflate(AppBorder.dashed / 2),
          Radius.circular(radius),
        ),
      );
    final dash = AppBorder.dashPattern[0];
    final gap = AppBorder.dashPattern[1];

    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final end = math.min(distance + dash, metric.length);
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance = end + gap;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorderPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.radius != radius;
}
