import 'package:design_system/design_system.dart';

const int _slotCount = 7;
const List<double> _tilts = [-3, 2, -1.5, 3, -2, 1.5, -2.5];

/// A week of paper slips: [filledCount] drawn slips followed by empty slots.
///
/// Slots are not tied to weekdays; [filledCount] is capped at seven.
class const WeekCard({
  required final String title,
  required final int filledCount,
  final String? supportText,
  final String? semanticLabel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final filled = filledCount.clamp(0, _slotCount);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: context.text.titleSm),
              if (supportText != null) ...[
                const SizedBox(height: AppSpace.s4),
                Text(
                  supportText!,
                  style: context.text.caption.copyWith(color: colors.textSecondary),
                ),
              ],
              const SizedBox(height: AppSpace.s16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var index = 0; index < _slotCount; index++)
                    SizedBox(
                      width: 38,
                      height: 42,
                      child: Center(
                        child: index < filled
                            ? AppPaperSlip(
                                fill: colors.accentSoft,
                                ink: colors.accentLabel,
                                rotation: _tilts[index],
                              )
                            : DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(AppRadius.sm),
                                  border: AppBorders.hair(colors.borderDefault),
                                ),
                                child: const SizedBox(width: 30, height: 36),
                              ),
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
