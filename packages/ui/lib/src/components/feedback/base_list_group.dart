import 'package:ui/ui.dart';

/// Key prefix of the hairline between two rows of a [BaseListGroup].
///
/// Each divider ends with its row index so the keys stay unique among the
/// group's children.
const String baseListGroupDividerKeyPrefix = 'baseListGroupDivider';

/// Rows joined on a white card, with a hairline between each pair and an
/// optional explanation underneath.
class const BaseListGroup({required final List<Widget> children, final String? footer, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final note = footer;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: AppBorders.hair(colors.borderDefault),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var index = 0; index < children.length; index++) ...[
              if (index > 0)
                Padding(
                  key: ValueKey('$baseListGroupDividerKeyPrefix$index'),
                  padding: const EdgeInsets.only(left: AppSpace.s16),
                  child: SizedBox(
                    height: AppBorder.hair,
                    child: ColoredBox(color: colors.borderDefault),
                  ),
                ),
              children[index],
            ],
            if (note != null)
              DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.bgScreen,
                  border: Border(top: BorderSide(color: colors.borderDefault)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpace.s16,
                    vertical: AppSpace.s10,
                  ),
                  child: Text(
                    note,
                    style: context.text.caption.copyWith(color: colors.textSecondary),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
