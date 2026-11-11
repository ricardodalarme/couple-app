import 'package:design_system/design_system.dart';

const double _labelWidth = 56;

/// One face and its label in a [MoodRow].
class const MoodRowOption({required final FaceKind face, required final String label});

/// A section header with a row of tappable faces and their labels.
class const MoodRow({
  required final String title,
  required final List<MoodRowOption> options,
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
                child: Center(
                  child: AppPressable(
                    onTap: () => onSelected(index),
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
                        SizedBox(
                          width: _labelWidth,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              options[index].label,
                              maxLines: 1,
                              style: context.text.tab.copyWith(color: colors.textSecondary),
                            ),
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
