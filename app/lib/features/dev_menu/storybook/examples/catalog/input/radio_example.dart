import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode radioExample = WidgetbookComponent(
  name: 'Radio',
  useCases: [
    WidgetbookUseCase(
      name: 'Off, on and inside a row',
      builder: (context) => GalleryPage(
        title: 'Radio',
        children: [
          const GallerySection(
            title: 'States',
            children: [
              GalleryRow(
                children: [
                  BaseRadio(isSelected: false, semanticLabel: 'Not selected'),
                  BaseRadio(isSelected: true, semanticLabel: 'Selected'),
                ],
              ),
            ],
          ),
          GallerySection(
            title: 'Inside a row',
            children: [
              Row(
                children: [
                  const BaseRadio(isSelected: true, semanticLabel: 'Weekly'),
                  const SizedBox(width: AppSpace.s10),
                  Text('Every week', style: context.text.body),
                ],
              ),
              const SizedBox(height: AppSpace.s12),
              Row(
                children: [
                  const BaseRadio(isSelected: false, semanticLabel: 'Monthly'),
                  const SizedBox(width: AppSpace.s10),
                  Text('Every month', style: context.text.body),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
