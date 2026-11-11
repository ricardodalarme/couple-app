import 'package:design_system/design_system.dart';

const int _dayCount = 7;
const List<double> _tilts = [-5, 2, -2, 4, -3, 1.5, -4];
const double _slotHeight = 44;
const double _emptyDot = 8;

/// A week of paper slips, keyed by weekday.
///
/// [dayCounts] and [dayLabels] have seven entries, Monday first. [todayIndex]
/// is the zero-based weekday of today, or null when no day is marked.
class const WeekCard({
  required final String title,
  required final List<int> dayCounts,
  required final List<String> dayLabels,
  final int? todayIndex,
  final String? supportText,
  final String? semanticLabel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Semantics(
      container: true,
      label: semanticLabel,
      child: AppCardRing(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpace.s18),
          decoration: BoxDecoration(
            color: colors.bgSurface,
            borderRadius: BorderRadius.circular(AppRadius.card),
            border: AppBorders.hair(colors.borderDefault),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: context.text.titleSm.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  if (supportText != null) ...[
                    const SizedBox(width: AppSpace.s8),
                    Flexible(
                      child: Text(
                        supportText!,
                        maxLines: 2,
                        textAlign: TextAlign.end,
                        style: context.text.caption.copyWith(color: colors.textSecondary),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: AppSpace.s16),
              Row(
                children: [
                  for (var index = 0; index < _dayCount; index++)
                    Expanded(
                      child: _Day(
                        label: dayLabels[index],
                        count: dayCounts[index],
                        isToday: todayIndex == index,
                        tilt: _tilts[index],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class const _Day({
  required final String label,
  required final int count,
  required final bool isToday,
  required final double tilt,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final labelColor = isToday ? colors.textPrimary : colors.textSecondary;
    final labelWeight = isToday ? FontWeight.w600 : FontWeight.w500;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: _slotHeight,
          child: Center(child: _marker(context)),
        ),
        const SizedBox(height: AppSpace.s6),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: context.text.micro.copyWith(color: labelColor, fontWeight: labelWeight),
        ),
      ],
    );
  }

  Widget _marker(BuildContext context) {
    if (isToday) {
      final colors = context.colors;

      return SizedBox(
        width: 34,
        height: 40,
        child: CustomPaint(
          foregroundPainter: DashedRoundedPainter(color: context.colors.accentLabel),
          child: Center(
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(color: colors.actionPrimary, shape: BoxShape.circle),
              child: Center(
                child: AppIcon(
                  icon: AppIcons.mail_filled,
                  size: AppIconSize.sm,
                  color: colors.textOnAction,
                ),
              ),
            ),
          ),
        ),
      );
    }

    if (count > 0) {
      final colors = context.colors;

      return AppPaperSlip(
        fill: colors.accentSoft,
        ink: colors.accentLabel,
        rotation: tilt,
        child: count > 1
            ? Text(
                '$count',
                style: context.text.micro.copyWith(
                  color: colors.accentLabel,
                  fontWeight: FontWeight.w600,
                ),
              )
            : AppIcon(icon: AppIcons.check, size: AppIconSize.sm, color: colors.accentLabel),
      );
    }

    return const SizedBox.square(
      dimension: _emptyDot,
      child: DecoratedBox(
        decoration: BoxDecoration(color: AppPalette.neutral150, shape: BoxShape.circle),
      ),
    );
  }
}
