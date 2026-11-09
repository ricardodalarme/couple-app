import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode skeletonExample = WidgetbookComponent(
  name: 'Skeleton',
  useCases: [
    WidgetbookUseCase(
      name: 'Enabled and disabled',
      builder: (context) => GalleryPage(
        title: 'Skeleton',
        children: [
          GallerySection(
            title: 'Enabled',
            children: [
              GallerySurface(
                child: Skeletonizer(
                  child: BaseListGroup(
                    children: [
                      BaseListTile(
                        title: 'Weekly summary',
                        subtitle: 'A look back at your week',
                        icon: AppIcons.bookmark,
                        showsChevron: true,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          GallerySection(
            title: 'Disabled',
            children: [
              GallerySurface(
                child: Skeletonizer(
                  enabled: false,
                  child: BaseListGroup(
                    children: [
                      BaseListTile(
                        title: 'Weekly summary',
                        subtitle: 'A look back at your week',
                        icon: AppIcons.bookmark,
                        showsChevron: true,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
