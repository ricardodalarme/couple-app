import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

const double _placeholderWidth = AppSpace.s120 + AppSpace.s20;

final WidgetbookNode imagePlaceholderExample = WidgetbookComponent(
  name: 'BaseImagePlaceholder',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Empty, loading and failure',
      builder: (context) => GalleryPage(
        title: 'Image placeholder',
        children: <Widget>[
          GallerySection(
            title: 'States',
            children: <Widget>[
              GalleryRow(
                children: <Widget>[
                  const GalleryItem(
                    label: 'empty',
                    child: SizedBox(width: _placeholderWidth, child: BaseImagePlaceholder()),
                  ),
                  const GalleryItem(
                    label: 'loading',
                    child: SizedBox(
                      width: _placeholderWidth,
                      child: BaseImagePlaceholder(status: BaseImagePlaceholderStatus.loading),
                    ),
                  ),
                  GalleryItem(
                    label: 'failure · tap to retry',
                    child: SizedBox(
                      width: _placeholderWidth,
                      child: BaseImagePlaceholder(
                        status: BaseImagePlaceholderStatus.failure,
                        onRetry: () {},
                        semanticLabel: 'Image failed to load. Try again.',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const GallerySection(
            title: 'Ratios · square, 4:3 and 16:9',
            children: <Widget>[
              GalleryRow(
                children: <Widget>[
                  SizedBox(width: _placeholderWidth, child: BaseImagePlaceholder()),
                  SizedBox(
                    width: _placeholderWidth,
                    child: BaseImagePlaceholder(
                      ratio: BaseImagePlaceholderRatio.fourByThree,
                      icon: AppIcons.map_pin,
                    ),
                  ),
                  SizedBox(
                    width: _placeholderWidth,
                    child: BaseImagePlaceholder(
                      ratio: BaseImagePlaceholderRatio.sixteenByNine,
                      icon: AppIcons.sun,
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
