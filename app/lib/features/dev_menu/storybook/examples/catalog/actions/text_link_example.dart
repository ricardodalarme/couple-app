import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode textLinkExample = WidgetbookComponent(
  name: 'BaseTextLink',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Action and informational',
      builder: (context) => GalleryPage(
        title: 'Text link',
        children: <Widget>[
          GallerySection(
            title: 'Action',
            children: <Widget>[
              GalleryRow(
                children: <Widget>[
                  BaseTextLink(text: 'See all', onPressed: () {}),
                  BaseTextLink(text: 'Try again', onPressed: () {}),
                ],
              ),
            ],
          ),
          const GallerySection(
            title: 'Informational · no touch',
            children: <Widget>[
              GalleryRow(
                children: <Widget>[
                  BaseTextLink(text: 'Only you see this', isInformational: true),
                  BaseTextLink(text: 'Dates', isInformational: true),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
