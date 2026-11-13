import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode surfaceCardExample = WidgetbookComponent(
  name: 'BaseSurfaceCard',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'With and without privacy note, title and body',
      builder: (context) => GalleryPage(
        title: 'Surface card',
        children: <Widget>[
          GallerySection(
            title: 'Privacy note, title, support and body',
            children: <Widget>[
              GallerySurface(
                child: BaseSurfaceCard(
                  privacyNote: 'Only you see this.',
                  title: 'This week',
                  supportText: 'Three slips and a card.',
                  child: Text(
                    'Sunday, 18:00',
                    style: context.text.body.copyWith(color: context.colors.textSecondary),
                  ),
                ),
              ),
            ],
          ),
          GallerySection(
            title: 'Title only',
            children: <Widget>[
              GallerySurface(
                child: BaseSurfaceCard(
                  title: 'Your plan',
                  child: Text(
                    'Free forever for two people.',
                    style: context.text.body.copyWith(color: context.colors.textSecondary),
                  ),
                ),
              ),
            ],
          ),
          const GallerySection(
            title: 'Body only',
            children: <Widget>[
              GallerySurface(
                child: BaseSurfaceCard(child: Text('A neutral container with no header.')),
              ),
            ],
          ),
          GallerySection(
            title: 'Ring style',
            children: <Widget>[
              GallerySurface(
                child: BaseSurfaceCard(
                  style: .ring,
                  title: 'This week',
                  supportText: 'A soft ring shadow replaces the hairline border.',
                  child: Text(
                    'Sunday, 18:00',
                    style: context.text.body.copyWith(color: context.colors.textSecondary),
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
