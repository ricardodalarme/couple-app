import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

const double _radiusBoxSide = AppSpace.s44 + AppSpace.s26;
const double _shadowBoxSide = AppSpace.s44 + AppSpace.s44 + AppSpace.s2;

final WidgetbookNode tokensExample = WidgetbookComponent(
  name: 'Tokens',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'Spacing, radii, shadows, layers and motion',
      builder: (context) {
        const spaces = <(String, double)>[
          ('space.2', AppSpace.s2),
          ('space.4', AppSpace.s4),
          ('space.6', AppSpace.s6),
          ('space.8', AppSpace.s8),
          ('space.10', AppSpace.s10),
          ('space.12', AppSpace.s12),
          ('space.14', AppSpace.s14),
          ('space.16', AppSpace.s16),
          ('space.18', AppSpace.s18),
          ('space.20', AppSpace.s20),
          ('space.22', AppSpace.s22),
          ('space.24', AppSpace.s24),
          ('space.26', AppSpace.s26),
          ('space.28', AppSpace.s28),
          ('space.34', AppSpace.s34),
          ('space.44', AppSpace.s44),
          ('space.120', AppSpace.s120),
        ];
        const semanticSpaces = <(String, double)>[
          ('screen.margin', AppSpace.screenMargin),
          ('screen.top', AppSpace.screenTop),
          ('section.gap', AppSpace.sectionGap),
          ('card.gap', AppSpace.cardGap),
          ('footer.bottom', AppSpace.footerBottom),
          ('scroll.tail', AppSpace.scrollTail),
          ('max.content', AppSpace.maxContentWidth),
          ('tabBar.height', AppSpace.tabBarHeight),
          ('min.width', AppSpace.minWidth),
          ('compact.width', AppSpace.compactWidth),
        ];
        const radii = <(String, double)>[
          ('radius.xs', AppRadius.xs),
          ('radius.sm', AppRadius.sm),
          ('radius.md', AppRadius.md),
          ('radius.lg', AppRadius.lg),
          ('radius.xl', AppRadius.xl),
          ('radius.xxl', AppRadius.xxl),
          ('radius.card', AppRadius.card),
          ('radius.ring', AppRadius.ring),
          ('radius.sheet', AppRadius.sheet),
          ('radius.dialog', AppRadius.dialog),
          ('radius.pill', AppRadius.pill),
        ];
        const shadows = <(String, List<BoxShadow>)>[
          ('shadow.ring', AppShadows.ring),
          ('shadow.face', AppShadows.face),
          ('shadow.paper', AppShadows.paper),
          ('shadow.selected', AppShadows.selected),
          ('shadow.knob', AppShadows.knob),
        ];
        const layers = <(String, int)>[
          ('layer.content', AppLayer.content),
          ('layer.bar', AppLayer.bar),
          ('layer.banner', AppLayer.banner),
          ('layer.scrim', AppLayer.scrim),
          ('layer.overlay', AppLayer.overlay),
          ('layer.toast', AppLayer.toast),
        ];
        final labelStyle = context.text.micro.copyWith(color: context.colors.textSecondary);
        final valueStyle = context.text.micro.copyWith(color: context.colors.textPlaceholder);
        final motionStyle = context.text.bodySm.copyWith(color: context.colors.textSecondary);

        return GalleryPage(
          title: 'Tokens',
          children: <Widget>[
            GallerySection(
              title: 'Spacing scale',
              children: <Widget>[
                for (final (name, value) in spaces) _spacingRow(context, name, value),
              ],
            ),
            GallerySection(
              title: 'Semantic spacing',
              children: <Widget>[
                for (final (name, value) in semanticSpaces)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpace.s6),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: AppSpace.s120,
                          child: Text(name, style: labelStyle),
                        ),
                        Text(value.toStringAsFixed(0), style: valueStyle),
                      ],
                    ),
                  ),
              ],
            ),
            GallerySection(
              title: 'Radii · including sheet and dialog',
              children: <Widget>[
                GalleryRow(
                  children: <Widget>[
                    for (final (name, value) in radii)
                      GalleryItem(
                        label: name,
                        child: SizedBox(
                          width: _radiusBoxSide,
                          height: _radiusBoxSide,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: context.colors.bgSurface,
                              borderRadius: BorderRadius.circular(value),
                              border: Border.all(color: context.colors.borderDefault),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            GallerySection(
              title: 'Shadows · ring, face, paper, selected, knob',
              children: <Widget>[
                GalleryRow(
                  children: <Widget>[
                    for (final (name, value) in shadows)
                      GalleryItem(
                        label: name,
                        child: SizedBox(
                          width: _shadowBoxSide,
                          height: _shadowBoxSide,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: context.colors.bgSurface,
                              borderRadius: BorderRadius.circular(AppRadius.xl),
                              boxShadow: value,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            GallerySection(
              title: 'Layers · six stacking steps',
              children: <Widget>[
                for (final (name, value) in layers)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpace.s6),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: AppSpace.s120,
                          child: Text(name, style: labelStyle),
                        ),
                        Text('$value', style: valueStyle),
                      ],
                    ),
                  ),
              ],
            ),
            GallerySection(
              title: 'Motion',
              children: <Widget>[
                Text(
                  'fast 120 ms ease-out · base 220 ms cubic(0.2, 0, 0, 1) · '
                  'slow 360 ms · reduced 150 ms fade with rotations off',
                  style: motionStyle,
                ),
                const SizedBox(height: AppSpace.s8),
                Text(
                  'Press scale 0.97. Haptics: light on save, send and react; '
                  'selection on chip, segment, option and slider marks; never on error.',
                  style: motionStyle,
                ),
              ],
            ),
          ],
        );
      },
    ),
  ],
);

Widget _spacingRow(BuildContext context, String name, double value) {
  final labelStyle = context.text.micro.copyWith(color: context.colors.textSecondary);
  final valueStyle = context.text.micro.copyWith(color: context.colors.textPlaceholder);

  return Padding(
    padding: const EdgeInsets.only(bottom: AppSpace.s8),
    child: Row(
      children: <Widget>[
        SizedBox(
          width: AppSpace.s120,
          child: Text(name, style: labelStyle),
        ),
        SizedBox(
          width: AppSpace.s34,
          child: Text(value.toStringAsFixed(0), style: valueStyle),
        ),
        SizedBox(
          width: value.clamp(AppSpace.s2, AppSpace.s120),
          height: AppSpace.s8,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.colors.accentSoft,
              borderRadius: BorderRadius.circular(AppRadius.xs),
            ),
          ),
        ),
      ],
    ),
  );
}
