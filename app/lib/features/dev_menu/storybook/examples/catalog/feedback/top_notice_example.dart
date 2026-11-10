import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode topNoticeExample = WidgetbookComponent(
  name: 'Top notice',
  useCases: [
    WidgetbookUseCase(
      name: 'Warning, error and info',
      builder: (context) => const GalleryPage(
        title: 'Top notice',
        children: [
          GallerySection(
            title: 'Warning',
            children: [
              GallerySurface(child: BaseTopNotice(text: 'No connection. Your slips keep saving.')),
            ],
          ),
          GallerySection(
            title: 'Error',
            children: [
              GallerySurface(
                child: BaseTopNotice(
                  text: 'That did not send. Try again in a moment.',
                  icon: AppIcons.bell,
                  tone: BaseBannerTone.error,
                ),
              ),
            ],
          ),
          GallerySection(
            title: 'Info',
            children: [
              GallerySurface(
                child: BaseTopNotice(
                  text: 'Notifications are off.',
                  icon: AppIcons.bell_off,
                  tone: BaseBannerTone.info,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    WidgetbookUseCase(
      name: 'Dismissible',
      builder: (context) => GalleryPage(
        title: 'Top notice · dismissible',
        children: [
          GallerySurface(
            child: BaseTopNotice(
              text: 'Notifications are off.',
              icon: AppIcons.bell_off,
              tone: BaseBannerTone.info,
              onDismiss: () {},
            ),
          ),
        ],
      ),
    ),
  ],
);
