import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/examples/catalog/foundations/foundation_widgets.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode segmentedExample = WidgetbookComponent(
  name: 'Segmented',
  useCases: [
    WidgetbookUseCase(
      name: 'Three options and selected variants',
      builder: (_) => const _SegmentedDemo(),
    ),
  ],
);

class const _SegmentedDemo() extends StatefulWidget {
  @override
  State<_SegmentedDemo> createState() => _SegmentedDemoState();
}

class _SegmentedDemoState() extends State<_SegmentedDemo> {
  int _period = 1;

  @override
  Widget build(BuildContext context) {
    return GalleryPage(
      title: 'Segmented',
      children: [
        GallerySection(
          title: 'Three options · interactive',
          children: [
            GallerySurface(
              child: BaseSegmented(
                segments: const ['Week', 'Month', 'Year'],
                selectedIndex: _period,
                semanticLabel: 'Period',
                onSelectionChanged: (index) => setState(() => _period = index),
              ),
            ),
          ],
        ),
        const GallerySection(
          title: 'Selected variants',
          children: [
            GallerySurface(
              child: BaseSegmented(
                segments: ['Mine', 'Ours', 'Shared'],
                selectedIndex: 0,
                onSelectionChanged: noopIndex,
              ),
            ),
            SizedBox(height: AppSpace.s12),
            GallerySurface(
              child: BaseSegmented(
                segments: ['Mine', 'Ours', 'Shared'],
                selectedIndex: 2,
                onSelectionChanged: noopIndex,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
