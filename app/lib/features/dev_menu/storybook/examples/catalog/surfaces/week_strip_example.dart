import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode weekStripExample = WidgetbookComponent(
  name: 'BaseWeekStrip',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Empty, some and full',
      builder: (context) => GalleryPage(
        title: 'Week strip',
        children: <Widget>[
          GallerySection(
            title: 'Filled slots',
            children: <Widget>[
              for (final count in [0, 3, 7]) ...[
                GalleryItem(
                  label: '$count of 7',
                  child: GallerySurface(
                    child: BaseWeekStrip(
                      title: '$count slips this week',
                      supportText: 'Your Sunday card comes from these.',
                      filledCount: count,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpace.cardGap),
              ],
            ],
          ),
        ],
      ),
    ),
  ],
);
