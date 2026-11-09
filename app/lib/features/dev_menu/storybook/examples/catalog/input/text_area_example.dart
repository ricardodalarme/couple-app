import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

const _filledText = 'We walked home the long way and stopped at the bakery on the corner.';
const _counterText =
    'I keep thinking about the small things you do without being asked, like '
    'leaving the light on and remembering how I take my coffee.';
const _readOnlyText = 'The first thing I noticed was how easy the silence felt.';

final WidgetbookNode textAreaExample = WidgetbookComponent(
  name: 'Text area',
  useCases: [
    WidgetbookUseCase(
      name: 'Empty, filled, error, read-only, counter',
      builder: (_) => const GalleryPage(
        title: 'Text area',
        children: [
          GallerySection(
            title: 'Empty',
            children: [GallerySurface(child: BaseTextArea(hint: 'What made you smile today?'))],
          ),
          GallerySection(
            title: 'Filled',
            children: [
              GallerySurface(
                child: BaseTextArea(text: _filledText, hint: 'What made you smile today?'),
              ),
            ],
          ),
          GallerySection(
            title: 'Counter after 80%',
            children: [GallerySurface(child: BaseTextArea(text: _counterText))],
          ),
          GallerySection(
            title: 'Error',
            children: [
              GallerySurface(
                child: BaseTextArea(
                  hint: 'One line is enough.',
                  hasError: true,
                  errorText: 'Write a little more before saving.',
                ),
              ),
            ],
          ),
          GallerySection(
            title: 'Read-only',
            children: [
              GallerySurface(
                child: BaseTextArea(text: _readOnlyText, isReadOnly: true, showCounter: false),
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
