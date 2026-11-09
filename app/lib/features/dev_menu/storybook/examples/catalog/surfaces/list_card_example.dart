import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode listCardExample = WidgetbookComponent(
  name: 'BaseListCard',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Four categories and trailing variants',
      builder: (context) => GalleryPage(
        title: 'List card',
        children: <Widget>[
          GallerySection(
            title: 'All four categories',
            children: <Widget>[
              GalleryItem(
                label: 'Idea · face trailing',
                child: GallerySurface(
                  child: BaseListCard(
                    category: AppCategory.idea,
                    categoryLabel: 'Idea of the day',
                    title: 'Make coffee and take it to the balcony.',
                    supportText: 'Takes 10 minutes.',
                    face: FaceKind.smile,
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(height: AppSpace.cardGap),
              GalleryItem(
                label: 'Dates · icon tile trailing',
                child: GallerySurface(
                  child: BaseListCard(
                    category: AppCategory.dates,
                    categoryLabel: 'Anniversary',
                    title: 'The day you met.',
                    supportText: 'In 12 days',
                    trailing: const BaseIconTile(
                      icon: AppIcons.calendar,
                      size: BaseIconTileSize.small,
                      variant: BaseIconTileVariant.neutral,
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(height: AppSpace.cardGap),
              GalleryItem(
                label: 'Invite · compact button trailing',
                child: GallerySurface(
                  child: BaseListCard(
                    category: AppCategory.invite,
                    categoryLabel: 'Invite and private',
                    title: 'A question only you can see.',
                    supportText: 'Stays private.',
                    trailing: BaseButton.compact(text: 'Open', onPressed: () {}),
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(height: AppSpace.cardGap),
              GalleryItem(
                label: 'Card · no trailing widget',
                child: GallerySurface(
                  child: BaseListCard(
                    categoryLabel: 'For you two',
                    title: 'A card leaves every Sunday at 18:00.',
                    onTap: () {},
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
