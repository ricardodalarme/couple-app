import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode typographyExample = WidgetbookComponent(
  name: 'Typography',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Fifteen tokens and highlighted word',
      builder: (context) {
        final text = context.text;
        final rows = <(String, TextStyle, String)>[
          ('display', text.display, '34 / 38 · 600'),
          ('title.xl', text.titleXl, '30 / 36 · 600'),
          ('title.lg', text.titleLg, '28 / 32 · 600'),
          ('question', text.question, '26 / 32 · 600'),
          ('title.md', text.titleMd, '23 / 28 · 600'),
          ('title.sm', text.titleSm, '17 / 22 · 500'),
          ('title.xs', text.titleXs, '16 / 21 · 600'),
          ('body.lg', text.bodyLg, '20 / 28 · 500'),
          ('body', text.body, '16 / 22 · 500'),
          ('body.sm', text.bodySm, '15 / 21 · 400'),
          ('caption', text.caption, '13.5 / 19 · 400'),
          ('label', text.label, '13 / 16 · 600 · uppercase'),
          ('micro', text.micro, '12 / 16 · 500'),
          ('tab', text.tab, '10.5 / 13 · 500'),
          ('hand', text.hand, '25 / 29 · Caveat 600'),
        ];

        return GalleryPage(
          title: 'Typography',
          children: <Widget>[
            GallerySection(
              title: 'System font · SF Pro on iOS, Roboto on Android',
              children: <Widget>[
                for (final (name, style, spec) in rows)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpace.s16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              name,
                              style: text.micro.copyWith(color: context.colors.textSecondary),
                            ),
                            const SizedBox(width: AppSpace.s8),
                            Text(
                              spec,
                              style: text.micro.copyWith(color: context.colors.textPlaceholder),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpace.s4),
                        Text(
                          name == 'hand'
                              ? 'You made me laugh in the kitchen.'
                              : 'A quiet thing for you',
                          style: style.copyWith(color: context.colors.textPrimary),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            GallerySection(
              title: 'Highlighted word · one per screen, 24pt and up',
              children: <Widget>[
                AppHighlightedText(
                  text: 'What made you smile today?',
                  highlight: 'smile',
                  style: text.question.copyWith(color: context.colors.textPrimary),
                ),
              ],
            ),
          ],
        );
      },
    ),
  ],
);
