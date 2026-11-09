import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode loadingDotsExample = WidgetbookComponent(
  name: 'BaseLoadingDots',
  useCases: [
    WidgetbookUseCase(
      name: 'Sizes and colors',
      builder: (context) => const GalleryPage(
        title: 'Loading dots',
        children: [
          GallerySection(
            title: 'Sizes',
            children: [
              GalleryRow(
                children: [
                  GalleryItem(label: '6 default', child: BaseLoadingDots()),
                  GalleryItem(label: '4 small', child: BaseLoadingDots(dotSize: 4, gap: 4)),
                  GalleryItem(label: '8 large', child: BaseLoadingDots(dotSize: 8, gap: 6)),
                ],
              ),
            ],
          ),
          GallerySection(
            title: 'On dark',
            children: [
              GallerySurface(
                child: ColoredBox(
                  color: AppPalette.neutral900,
                  child: Padding(
                    padding: EdgeInsets.all(AppSpace.s16),
                    child: BaseLoadingDots(color: AppPalette.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
