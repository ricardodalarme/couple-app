import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode toastExample = WidgetbookComponent(
  name: 'Toast',
  useCases: [
    WidgetbookUseCase(
      name: 'With and without undo',
      builder: (context) => GalleryPage(
        title: 'Toast',
        children: [
          GallerySection(
            title: 'With undo',
            children: [
              GallerySurface(
                child: BaseToast(message: 'Slip saved', actionLabel: 'Undo', onAction: () {}),
              ),
            ],
          ),
          GallerySection(
            title: 'Without undo',
            children: [
              GallerySurface(
                child: BaseToast(message: 'Copied to clipboard', onDismissed: () {}),
              ),
            ],
          ),
          GallerySection(
            title: 'Error',
            children: [
              GallerySurface(
                child: BaseToast(
                  message: 'Could not send',
                  variant: BaseToastVariant.error,
                  actionLabel: 'Try again',
                  onAction: () {},
                ),
              ),
              const SizedBox(height: AppSpace.s10),
              const GallerySurface(
                child: BaseToast(
                  message: 'Something went wrong. Try later.',
                  variant: BaseToastVariant.error,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
