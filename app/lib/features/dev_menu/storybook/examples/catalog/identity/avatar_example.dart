import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode avatarExample = WidgetbookComponent(
  name: 'BaseAvatar',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Sizes, own, partner and empty',
      builder: (context) => GalleryPage(
        title: 'Avatar',
        children: <Widget>[
          const GallerySection(
            title: 'Own · 24, 40 and 64',
            children: <Widget>[
              GalleryRow(
                children: <Widget>[
                  GalleryItem(
                    label: '24',
                    child: BaseAvatar(initials: 'R', size: 24, semanticLabel: 'You'),
                  ),
                  GalleryItem(
                    label: '40',
                    child: BaseAvatar(initials: 'R', semanticLabel: 'You'),
                  ),
                  GalleryItem(
                    label: '64',
                    child: BaseAvatar(initials: 'R', size: 64, semanticLabel: 'You'),
                  ),
                ],
              ),
            ],
          ),
          const GallerySection(
            title: 'Partner',
            children: <Widget>[
              GalleryRow(
                children: <Widget>[
                  GalleryItem(
                    label: '24',
                    child: BaseAvatar(
                      initials: 'M',
                      size: 24,
                      isPartner: true,
                      semanticLabel: 'Marina',
                    ),
                  ),
                  GalleryItem(
                    label: '40',
                    child: BaseAvatar(initials: 'M', isPartner: true, semanticLabel: 'Marina'),
                  ),
                  GalleryItem(
                    label: '64',
                    child: BaseAvatar(
                      initials: 'M',
                      size: 64,
                      isPartner: true,
                      semanticLabel: 'Marina',
                    ),
                  ),
                ],
              ),
            ],
          ),
          GallerySection(
            title: 'Empty · dashed outline with a plus',
            children: <Widget>[
              GalleryRow(
                children: <Widget>[
                  BaseAvatar(isEmpty: true, onTap: () {}, semanticLabel: 'Add a photo'),
                  const BaseAvatar(isEmpty: true, size: 64),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
