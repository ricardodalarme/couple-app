import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode featureCardExample = WidgetbookComponent(
  name: 'BaseFeatureCard',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Default, answered and loading, with the frame',
      builder: (context) {
        final face = context.knobs.object.dropdown<FaceKind>(
          label: 'Face',
          options: FaceKind.values,
          initialOption: FaceKind.affectionate,
        );

        return GalleryPage(
          title: 'Feature card',
          children: <Widget>[
            GallerySection(
              title: 'Default',
              children: <Widget>[
                GallerySurface(
                  child: BaseFeatureCard(
                    tag: 'Little habits',
                    question: 'What small habit of Marina makes you smile?',
                    highlightedWord: 'smile',
                    face: face,
                    supportText: 'One line is enough. 30 seconds.',
                    actionText: 'Answer',
                    onAction: () {},
                    privacyNote: 'Only you see this until the card leaves.',
                  ),
                ),
              ],
            ),
            GallerySection(
              title: 'Answered',
              children: <Widget>[
                GallerySurface(
                  child: BaseFeatureCard(
                    tag: 'Little habits',
                    question: 'What small habit of Marina makes you smile?',
                    highlightedWord: 'smile',
                    face: FaceKind.smile,
                    actionText: 'See the answers',
                    onAction: () {},
                    isAnswered: true,
                  ),
                ),
              ],
            ),
            GallerySection(
              title: 'Loading',
              children: <Widget>[
                GallerySurface(
                  child: BaseFeatureCard(
                    tag: 'Little habits',
                    question: 'What small habit of Marina makes you smile?',
                    highlightedWord: 'smile',
                    face: FaceKind.affectionate,
                    actionText: 'Answer',
                    onAction: () {},
                    isLoading: true,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    ),
  ],
);
