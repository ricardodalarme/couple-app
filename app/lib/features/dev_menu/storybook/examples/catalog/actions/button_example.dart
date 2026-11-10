import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode buttonExample = WidgetbookComponent(
  name: 'BaseButton',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Five weights and states',
      builder: (context) {
        final isLoading = context.knobs.boolean(label: 'Loading');
        final isDisabled = context.knobs.boolean(label: 'Disabled');
        final showsIcon = context.knobs.boolean(label: 'Icon', initialValue: true);

        return GalleryPage(
          title: 'Button',
          children: <Widget>[
            GallerySection(
              title: 'Primary · one per screen',
              children: <Widget>[
                GallerySurface(
                  child: BaseButton.primary(
                    text: 'Answer',
                    onPressed: () {},
                    isLoading: isLoading,
                    isEnabled: !isDisabled,
                    icon: showsIcon ? AppIcons.chevron_right : null,
                  ),
                ),
                const SizedBox(height: AppSpace.s12),
                GallerySurface(
                  child: BaseButton.primary(text: 'Disabled', onPressed: () {}, isEnabled: false),
                ),
              ],
            ),
            GallerySection(
              title: 'Secondary · width by content',
              children: <Widget>[
                GalleryRow(
                  children: <Widget>[
                    BaseButton.secondary(text: 'Edit', onPressed: () {}),
                    BaseButton.secondary(text: 'Save', onPressed: () {}),
                    const BaseButton.secondary(text: 'Disabled', onPressed: null, isEnabled: false),
                  ],
                ),
              ],
            ),
            GallerySection(
              title: 'Text and destructive · no fill or border',
              children: <Widget>[
                GalleryRow(
                  children: <Widget>[
                    BaseButton.text(text: 'Not now', onPressed: () {}),
                    const BaseButton.text(text: 'Disabled', onPressed: null, isEnabled: false),
                    BaseButton.destructive(text: 'Delete', onPressed: () {}),
                    const BaseButton.destructive(text: 'Delete', onPressed: null, isEnabled: false),
                  ],
                ),
              ],
            ),
            GallerySection(
              title: 'Compact · inside a card or banner',
              children: <Widget>[
                GalleryRow(
                  children: <Widget>[
                    BaseButton.compact(text: 'Open', onPressed: () {}),
                    const BaseButton.compact(text: 'Disabled', onPressed: null, isEnabled: false),
                    BaseButton.compact(text: 'Loading', onPressed: () {}, isLoading: true),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    ),
  ],
);
