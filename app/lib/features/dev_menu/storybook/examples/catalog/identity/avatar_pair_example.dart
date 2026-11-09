import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode avatarPairExample = WidgetbookComponent(
  name: 'BaseAvatarPair',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'With and without a partner, 40 and 64',
      builder: (context) => GalleryPage(
        title: 'Avatar pair',
        children: <Widget>[
          GallerySection(
            title: 'With partner',
            children: <Widget>[
              GalleryRow(
                children: <Widget>[
                  BaseAvatarPair(
                    selfInitials: 'R',
                    partnerInitials: 'M',
                    onTap: () {},
                    semanticLabel: 'You and Marina',
                  ),
                  const BaseAvatarPair(selfInitials: 'R', partnerInitials: 'M', size: 64),
                ],
              ),
            ],
          ),
          GallerySection(
            title: 'Without partner · second slot invites',
            children: <Widget>[
              GalleryRow(
                children: <Widget>[
                  BaseAvatarPair(
                    selfInitials: 'R',
                    onTap: () {},
                    semanticLabel: 'Invite your person',
                  ),
                  const BaseAvatarPair(selfInitials: 'R', size: 64),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
