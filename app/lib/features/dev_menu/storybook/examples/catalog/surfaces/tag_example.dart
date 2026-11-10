import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode tagExample = WidgetbookComponent(
  name: 'BaseTag',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Topic tags',
      builder: (context) => const GalleryPage(
        title: 'Tag',
        children: <Widget>[
          GalleryRow(
            children: <Widget>[
              BaseTag(text: 'Little habits'),
              BaseTag(text: 'Smiles'),
              BaseTag(text: 'Only yours'),
            ],
          ),
        ],
      ),
    ),
  ],
);
