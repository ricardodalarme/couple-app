import 'package:design_system/design_system.dart';

/// One face and its label in a [MoodRow].
class const MoodRowOption({required final FaceKind face, required final String label});

/// A section header with a row of tappable faces and their labels.
class const MoodRow({
  required final String title,
  required final List<MoodRowOption> options,
  required final ValueChanged<int> onSelected,
  final String? supportText,
  final String? actionLabel,
  final int? selectedIndex,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final action = actionLabel;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(title, style: context.text.titleSm)),
            if (action != null)
              Text(action, style: context.text.bodySm.copyWith(color: colors.textSecondary)),
          ],
        ),
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
                  semanticLabel: options[index].label,
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BaseFace(
                          kind: options[index].face,
                          size: FaceSize.large,
                          selected: selectedIndex == index,
                        ),
                        const SizedBox(height: AppSpace.s6),
                        Text(
                          options[index].label,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: context.text.micro.copyWith(
                            color: selectedIndex == index
                                ? colors.textPrimary
                                : colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
