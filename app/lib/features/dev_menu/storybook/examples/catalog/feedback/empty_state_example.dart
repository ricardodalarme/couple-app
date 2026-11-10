import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode emptyStateExample = WidgetbookComponent(
  name: 'Empty state',
  useCases: [
    WidgetbookUseCase(
      name: 'Primary, secondary and error action',
      builder: (context) => GalleryPage(
        title: 'Empty state',
        children: [
          GallerySection(
            title: 'Primary action',
            children: [
              BaseEmptyState(
                title: 'No slips yet',
                text: 'A slip is one good thing, in a single line.',
                actionText: 'Write a slip',
                onAction: () {},
                faceLabel: 'Smile face',
              ),
            ],
          ),
          GallerySection(
            title: 'Secondary action',
            children: [
              BaseEmptyState(
                title: 'No memories yet',
                text: 'They appear after your first card.',
                isSecondaryAction: true,
                actionText: 'See how it works',
                onAction: () {},
              ),
            ],
          ),
          GallerySection(
            title: 'Error action',
            children: [
              BaseEmptyState(
                title: 'That did not load',
                text: 'Check your connection and try again.',
                actionText: 'Try again',
                onAction: () {},
                face: FaceKind.sad,
                faceLabel: 'Sad face',
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
