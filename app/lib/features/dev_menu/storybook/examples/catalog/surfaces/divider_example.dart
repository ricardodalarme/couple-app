import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode dividerExample = WidgetbookComponent(
  name: 'BaseDivider',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Solid, dashed, labelled and inset',
      builder: (context) => GalleryPage(
        title: 'Divider',
        children: <Widget>[
          GallerySurface(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colors.bgSurface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(color: context.colors.borderDefault),
              ),
              child: const Padding(
                padding: EdgeInsets.all(AppSpace.s16),
                child: Column(
                  children: <Widget>[
                    BaseDivider(),
                    SizedBox(height: AppSpace.s16),
                    BaseDivider(isDashed: true),
                    SizedBox(height: AppSpace.s16),
                    BaseDivider(label: 'or'),
                    SizedBox(height: AppSpace.s16),
                    BaseDivider(isInset: true),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ],
);
