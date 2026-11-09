import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode iconTileExample = WidgetbookComponent(
  name: 'BaseIconTile',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Sizes, variants and tap',
      builder: (context) => GalleryPage(
        title: 'Icon tile',
        children: <Widget>[
          const GallerySection(
            title: 'Sizes · 32, 40 and 48',
            children: <Widget>[
              GalleryRow(
                children: <Widget>[
                  GalleryItem(
                    label: 'small',
                    child: BaseIconTile(icon: AppIcons.mail, size: BaseIconTileSize.small),
                  ),
                  GalleryItem(
                    label: 'medium',
                    child: BaseIconTile(icon: AppIcons.mail),
                  ),
                  GalleryItem(
                    label: 'large',
                    child: BaseIconTile(icon: AppIcons.mail, size: BaseIconTileSize.large),
                  ),
                ],
              ),
            ],
          ),
          const GallerySection(
            title: 'Variants',
            children: <Widget>[
              GalleryRow(
                children: <Widget>[
                  GalleryItem(
                    label: 'accent',
                    child: BaseIconTile(icon: AppIcons.lock),
                  ),
                  GalleryItem(
                    label: 'neutral',
                    child: BaseIconTile(icon: AppIcons.lock, variant: BaseIconTileVariant.neutral),
                  ),
                ],
              ),
            ],
          ),
          GallerySection(
            title: 'Tap target',
            children: <Widget>[
              GalleryRow(
                children: <Widget>[
                  BaseIconTile(icon: AppIcons.plus, onTap: () {}, semanticLabel: 'Add a slip'),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
