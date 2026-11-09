import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode appBarExample = WidgetbookComponent(
  name: 'BaseAppBar',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Plain, back, close, scrolled and stepper',
      builder: (context) => GalleryPage(
        title: 'App bar',
        children: <Widget>[
          const GallerySection(
            title: 'Plain',
            children: <Widget>[GallerySurface(child: BaseAppBar(title: 'Today'))],
          ),
          GallerySection(
            title: 'With back',
            children: <Widget>[
              GallerySurface(
                child: BaseAppBar(title: 'Choose a colour', onBack: () {}),
              ),
            ],
          ),
          GallerySection(
            title: 'With close',
            children: <Widget>[
              GallerySurface(
                child: BaseAppBar(
                  title: 'Write a slip',
                  subtitle: 'Only you see this',
                  onClose: () {},
                ),
              ),
            ],
          ),
          GallerySection(
            title: 'Scrolled · 94% surface and bottom border',
            children: <Widget>[
              GallerySurface(
                child: BaseAppBar(
                  title: 'Settings',
                  subtitle: 'Scrolled',
                  onBack: () {},
                  hasScrolled: true,
                ),
              ),
            ],
          ),
          GallerySection(
            title: 'With stepper',
            children: <Widget>[
              GallerySurface(
                child: BaseAppBar(
                  title: 'Who is it for?',
                  onBack: () {},
                  stepIndicator: const BaseStepper(
                    count: 5,
                    currentIndex: 1,
                    semanticLabel: 'Step 2 of 5',
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
