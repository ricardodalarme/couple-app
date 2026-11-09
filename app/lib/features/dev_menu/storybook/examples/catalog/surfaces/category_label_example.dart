import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

String _categoryName(AppCategory category) => switch (category) {
  .idea => 'Idea',
  .dates => 'Dates',
  .invite => 'Invite',
  .card => 'For you two',
};

final WidgetbookNode categoryLabelExample = WidgetbookComponent(
  name: 'BaseCategoryLabel',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'All categories',
      builder: (context) => GalleryPage(
        title: 'Category label',
        children: <Widget>[
          for (final category in AppCategory.values)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpace.s12),
              child: BaseCategoryLabel(text: _categoryName(category), category: category),
            ),
        ],
      ),
    ),
  ],
);
