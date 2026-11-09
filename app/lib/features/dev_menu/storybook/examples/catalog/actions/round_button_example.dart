import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode roundButtonExample = WidgetbookComponent(
  name: 'BaseRoundButton',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Back, close, add and disabled',
      builder: (context) => GalleryPage(
        title: 'Round button',
        children: <Widget>[
          GalleryRow(
            children: <Widget>[
              BaseRoundButton(icon: AppIcons.chevron_left, onPressed: () {}, semanticLabel: 'Back'),
              BaseRoundButton(icon: AppIcons.close, onPressed: () {}, semanticLabel: 'Close'),
              BaseRoundButton(icon: AppIcons.plus, onPressed: () {}, semanticLabel: 'Add'),
              const BaseRoundButton(
                icon: AppIcons.chevron_left,
                onPressed: null,
                isEnabled: false,
                semanticLabel: 'Back',
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
