import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode bubbleExample = WidgetbookComponent(
  name: 'BaseBubble',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Own, other, typing, failure and time',
      builder: (context) => GalleryPage(
        title: 'Message bubble',
        children: <Widget>[
          GallerySurface(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const BaseBubble(
                  variant: BaseBubbleVariant.own,
                  text: 'I left the light on for you.',
                  time: '21:04',
                ),
                const SizedBox(height: AppSpace.s8),
                const BaseBubble(
                  text: 'I saw it. Thank you.',
                  time: '21:06',
                  semanticLabel: 'Message from Marina',
                ),
                const SizedBox(height: AppSpace.s8),
                const BaseBubble(variant: BaseBubbleVariant.typing),
                const SizedBox(height: AppSpace.s8),
                BaseBubble(
                  variant: BaseBubbleVariant.failure,
                  text: 'The message did not send.',
                  action: BaseTextLink(text: 'Try again', onPressed: () {}),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ],
);
