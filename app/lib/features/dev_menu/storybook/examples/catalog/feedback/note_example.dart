import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode noteExample = WidgetbookComponent(
  name: 'Note',
  useCases: [
    WidgetbookUseCase(
      name: 'Privacy and explanation',
      builder: (context) => const GalleryPage(
        title: 'Note',
        children: [
          GallerySection(
            title: 'Privacy',
            children: [
              GallerySurface(
                child: BaseNote(text: 'Only you see this until you choose to share it.'),
              ),
            ],
          ),
          GallerySection(
            title: 'Explanation',
            children: [
              GallerySurface(
                child: BaseNote(
                  icon: AppIcons.lightbulb,
                  text: 'A slip is one good thing, written in a single line.',
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
