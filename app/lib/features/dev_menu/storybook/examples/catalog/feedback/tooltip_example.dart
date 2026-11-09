import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode tooltipExample = WidgetbookComponent(
  name: 'BaseTooltip',
  useCases: [
    WidgetbookUseCase(
      name: 'Tap and long press',
      builder: (context) => const GalleryPage(
        title: 'Tooltip',
        children: [
          GallerySection(
            title: 'Wraps any control',
            children: [
              GalleryRow(
                children: [
                  BaseTooltip(
                    message: 'Notifications',
                    trigger: BaseTooltipTrigger.tap,
                    child: BaseRoundButton(
                      icon: AppIcons.bell,
                      semanticLabel: 'Notifications',
                      onPressed: _noop,
                    ),
                  ),
                  BaseTooltip(
                    message: 'Settings',
                    child: BaseRoundButton(
                      icon: AppIcons.settings,
                      semanticLabel: 'Settings',
                      onPressed: _noop,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);

void _noop() {}
