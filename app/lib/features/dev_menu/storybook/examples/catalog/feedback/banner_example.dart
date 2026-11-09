import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode bannerExample = WidgetbookComponent(
  name: 'Banner',
  useCases: [
    WidgetbookUseCase(
      name: 'Info, warning, error, safety, plain, action and dismiss',
      builder: (context) => GalleryPage(
        title: 'Banner',
        children: [
          for (final variant in BaseBannerVariant.values)
            GallerySection(
              title: variant.name,
              children: [
                GallerySurface(
                  child: BaseBanner(
                    variant: variant,
                    title: _bannerTitle(variant),
                    text: _bannerText(variant),
                    actionLabel: 'Review',
                    onAction: () {},
                    onDismiss: () {},
                  ),
                ),
              ],
            ),
        ],
      ),
    ),
  ],
);

String _bannerTitle(BaseBannerVariant variant) => switch (variant) {
  BaseBannerVariant.info => 'A small update',
  BaseBannerVariant.warning => 'Check your reminder',
  BaseBannerVariant.error => 'Something did not send',
  BaseBannerVariant.safety => 'Your safety settings',
  BaseBannerVariant.plain => 'A quiet note',
};

String _bannerText(BaseBannerVariant variant) => switch (variant) {
  BaseBannerVariant.info => 'There is a new way to revisit your first week.',
  BaseBannerVariant.warning => 'Notifications are off on this device.',
  BaseBannerVariant.error => 'We could not reach the server. Your draft is safe.',
  BaseBannerVariant.safety => 'You can review who sees your answers at any time.',
  BaseBannerVariant.plain => 'This note stays inside the card and scrolls with it.',
};
