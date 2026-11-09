import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode choiceChipExample = WidgetbookComponent(
  name: 'Choice chip',
  useCases: [
    WidgetbookUseCase(
      name: 'Unselected, selected and wrap',
      builder: (_) => const _ChoiceChipDemo(),
    ),
  ],
);

class const _ChoiceChipDemo() extends StatefulWidget {
  @override
  State<_ChoiceChipDemo> createState() => _ChoiceChipDemoState();
}

class _ChoiceChipDemoState() extends State<_ChoiceChipDemo> {
  final Set<String> _selected = {'Small thing', 'Ritual'};

  @override
  Widget build(BuildContext context) {
    const labels = ['Small thing', 'Big thing', 'Ritual', 'Idea', 'Date', 'Memory'];

    return GalleryPage(
      title: 'Choice chip',
      children: [
        GallerySection(
          title: 'Unselected',
          children: [
            Wrap(
              spacing: AppSpace.s8,
              runSpacing: AppSpace.s8,
              children: [
                for (final label in ['Small thing', 'Big thing'])
                  BaseChoiceChip(label: label, onTap: () {}),
              ],
            ),
          ],
        ),
        GallerySection(
          title: 'Selected and wrapping',
          children: [
            Wrap(
              spacing: AppSpace.s8,
              runSpacing: AppSpace.s8,
              children: [
                for (final label in labels)
                  BaseChoiceChip(
                    label: label,
                    isSelected: _selected.contains(label),
                    onTap: () => setState(() {
                      if (!_selected.add(label)) _selected.remove(label);
                    }),
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
