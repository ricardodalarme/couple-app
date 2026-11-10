import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode optionTileExample = WidgetbookComponent(
  name: 'Option tile',
  useCases: [
    WidgetbookUseCase(
      name: 'Radio, checkbox, selected and support',
      builder: (context) => GalleryPage(
        title: 'Option tile',
        children: [
          GallerySection(
            title: 'Radio · unselected',
            children: [
              GallerySurface(
                child: BaseOptionTile(
                  title: 'Every day',
                  support: 'A reminder at the same time each day.',
                  leading: const BaseIconTile(icon: AppIcons.bell),
                  onTap: () {},
                ),
              ),
            ],
          ),
          GallerySection(
            title: 'Radio · selected',
            children: [
              GallerySurface(
                child: BaseOptionTile(
                  title: 'Every week',
                  support: 'A reminder on the day you choose.',
                  leading: const BaseIconTile(icon: AppIcons.calendar),
                  isSelected: true,
                  onTap: () {},
                ),
              ),
            ],
          ),
          GallerySection(
            title: 'Checkbox · selected with support',
            children: [
              GallerySurface(
                child: BaseOptionTile(
                  title: 'Share with your partner',
                  support: 'They can read this answer after you send it.',
                  control: BaseOptionTileControl.checkbox,
                  isSelected: true,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
