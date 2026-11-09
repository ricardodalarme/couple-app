import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode checkboxExample = WidgetbookComponent(
  name: 'Checkbox',
  useCases: [
    WidgetbookUseCase(
      name: 'Off, on, mixed and inside a row',
      builder: (context) => GalleryPage(
        title: 'Checkbox',
        children: [
          const GallerySection(
            title: 'States',
            children: [
              GalleryRow(
                children: [
                  BaseCheckbox(value: false, semanticLabel: 'Off'),
                  BaseCheckbox(value: true, semanticLabel: 'On'),
                  BaseCheckbox(value: false, isIndeterminate: true, semanticLabel: 'Mixed'),
                ],
              ),
            ],
          ),
          GallerySection(
            title: 'Inside a row',
            children: [
              Row(
                children: [
                  const BaseCheckbox(value: true, label: 'Accept the terms'),
                  const SizedBox(width: AppSpace.s12),
                  Text('Accept the terms', style: context.text.body),
                ],
              ),
              const SizedBox(height: AppSpace.s12),
              Row(
                children: [
                  const BaseCheckbox(
                    value: true,
                    isIndeterminate: true,
                    semanticLabel: 'Some reminders selected',
                  ),
                  const SizedBox(width: AppSpace.s10),
                  Text('Some reminders selected', style: context.text.body),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
