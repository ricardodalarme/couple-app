import 'package:design_system/design_system.dart';

/// One face and its label in a [BaseMoodRow].
class const BaseMoodRowOption({required final FaceKind face, required final String label});

/// A section header with a row of tappable faces and their labels.
class const BaseMoodRow({
  required final String title,
  required final List<BaseMoodRowOption> options,
  required final ValueChanged<int> onSelected,
  final String? supportText,
  final int? selectedIndex,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.text.titleSm),
        if (supportText != null) ...[
          const SizedBox(height: AppSpace.s4),
          Text(supportText!, style: context.text.caption.copyWith(color: colors.textSecondary)),
        ],
        const SizedBox(height: AppSpace.s14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var index = 0; index < options.length; index++)
              Expanded(
                child: AppPressable(
                  onTap: () => onSelected(index),
                  isSemanticButton: true,
                  semanticLabel: options[index].label,
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BaseFace(
                        kind: options[index].face,
                        size: FaceSize.small,
                        selected: selectedIndex == index,
                      ),
                      const SizedBox(height: AppSpace.s6),
                      Text(
                        options[index].label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: context.text.caption.copyWith(color: colors.textSecondary),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
