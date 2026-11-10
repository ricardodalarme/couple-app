import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode sectionHeaderExample = WidgetbookComponent(
  name: 'Section header',
  useCases: [
    WidgetbookUseCase(
      name: 'Title, label and lock',
      builder: (context) => GalleryPage(
        title: 'Section header',
        children: [
          GallerySection(
            title: 'Title with link',
            children: [
              GallerySurface(
                child: BaseSectionHeader(
                  title: 'Your week',
                  actionLabel: 'See all',
                  onAction: () {},
                ),
              ),
            ],
          ),
          const GallerySection(
            title: 'Label',
            children: [GallerySurface(child: BaseSectionHeader(title: 'Account', isLabel: true))],
          ),
          const GallerySection(
            title: 'Lock',
            children: [
              GallerySurface(
                child: BaseSectionHeader(
                  title: 'Only you see this',
                  showsLock: true,
                  isLabel: true,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
