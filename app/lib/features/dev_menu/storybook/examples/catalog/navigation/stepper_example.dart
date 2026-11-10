import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode stepperExample = WidgetbookComponent(
  name: 'BaseStepper',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Step 1 of 3 and step 3 of 5',
      builder: (context) => const GalleryPage(
        title: 'Step indicator',
        children: <Widget>[
          GalleryItem(
            label: 'Step 1 of 3',
            child: BaseStepper(count: 3, currentIndex: 0, semanticLabel: 'Step 1 of 3'),
          ),
          SizedBox(height: AppSpace.s16),
          GalleryItem(
            label: 'Step 3 of 5',
            child: BaseStepper(count: 5, currentIndex: 2, semanticLabel: 'Step 3 of 5'),
          ),
        ],
      ),
    ),
  ],
);
