import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode bannerExample = WidgetbookComponent(
  name: 'Banner',
  useCases: [
    WidgetbookUseCase(
      name: 'Info, warning, error, safety, plain, notice, action and dismiss',
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
  .info => 'A small update',
  .warning => 'Check your reminder',
  .error => 'Something did not send',
  .safety => 'Your safety settings',
  .plain => 'A quiet note',
  .notice => 'Reminders are off',
};

String _bannerText(BaseBannerVariant variant) => switch (variant) {
  .info => 'There is a new way to revisit your first week.',
  .warning => 'Notifications are off on this device.',
  .error => 'We could not reach the server. Your draft is safe.',
  .safety => 'You can review who sees your answers at any time.',
  .plain => 'This note stays inside the card and scrolls with it.',
  .notice => 'Turn them on in settings. Nothing is lost meanwhile.',
};
