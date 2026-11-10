import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

const double _swatchWidth = AppSpace.s120 + AppSpace.s28;
const double _swatchHeight = AppSpace.s44 + AppSpace.s4;

final WidgetbookNode semanticColoursExample = WidgetbookComponent(
  name: 'Semantic colours',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'All roles and theme ramps',
      builder: (context) {
        final colors = context.colors;

        return GalleryPage(
          title: 'Colour tokens',
          children: <Widget>[
            GallerySection(
              title: 'Current theme · ${colors.variant.name}',
              children: <Widget>[
                _swatches(context, <(String, Color)>[
                  ('bg.screen', colors.bgScreen),
                  ('bg.surface', colors.bgSurface),
                  ('bg.ring', colors.bgRing),
                  ('bg.tabBar', colors.bgTabBar),
                  ('border.default', colors.borderDefault),
                  ('border.selected', colors.borderSelected),
                  ('text.primary', colors.textPrimary),
                  ('text.secondary', colors.textSecondary),
                  ('text.placeholder', colors.textPlaceholder),
                  ('text.onAction', colors.textOnAction),
                  ('accent.highlight', colors.accentHighlight),
                  ('accent.label', colors.accentLabel),
                  ('accent.soft', colors.accentSoft),
                  ('accent.onSoft', colors.accentOnSoft),
                  ('wash.strong', colors.washStrong),
                  ('wash.light', colors.washLight),
                  ('action.primary', colors.actionPrimary),
                  ('action.pressed', colors.actionPrimaryPressed),
                  ('icon.default', colors.iconDefault),
                  ('icon.muted', colors.iconMuted),
                  ('scrim', colors.scrim),
                ]),
              ],
            ),
            GallerySection(
              title: 'Three theme ramps',
              children: <Widget>[
                for (final variant in AppThemeVariant.values) ...<Widget>[
                  Text('${variant.name} ramp', style: context.text.titleXs),
                  const SizedBox(height: AppSpace.s8),
                  _swatches(context, <(String, Color)>[
                    ('bg', AppColors.forVariant(variant).bgScreen),
                    ('border', AppColors.forVariant(variant).borderDefault),
                    ('soft', AppColors.forVariant(variant).accentSoft),
                    ('highlight', AppColors.forVariant(variant).accentHighlight),
                    ('label', AppColors.forVariant(variant).accentLabel),
                    ('onSoft', AppColors.forVariant(variant).accentOnSoft),
                    ('wash.strong', AppColors.forVariant(variant).washStrong),
                    ('wash.light', AppColors.forVariant(variant).washLight),
                  ]),
                  const SizedBox(height: AppSpace.s20),
                ],
              ],
            ),
            GallerySection(
              title: 'Category roles · fixed across themes',
              children: <Widget>[
                _swatches(context, const <(String, Color)>[
                  ('idea.label', AppPalette.ideaLabel),
                  ('idea.wash', AppPalette.ideaWash),
                  ('dates.label', AppPalette.datesLabel),
                  ('dates.wash', AppPalette.datesWash),
                  ('invite.label', AppPalette.inviteLabel),
                  ('invite.wash', AppPalette.inviteWash),
                ]),
              ],
            ),
            GallerySection(
              title: 'Status roles · never for couple content',
              children: <Widget>[
                _swatches(context, const <(String, Color)>[
                  ('status.error', AppPalette.errorInk),
                  ('status.error.bg', AppPalette.errorSurface),
                  ('status.warning', AppPalette.warningInk),
                  ('status.warning.bg', AppPalette.warningSurface),
                  ('status.safety', AppPalette.safetyInk),
                  ('status.safety.bg', AppPalette.safetySurface),
                ]),
              ],
            ),
          ],
        );
      },
    ),
  ],
);

Widget _swatches(BuildContext context, List<(String, Color)> entries) {
  final style = context.text.micro.copyWith(color: context.colors.textSecondary);

  return Wrap(
    spacing: AppSpace.s8,
    runSpacing: AppSpace.s8,
    children: <Widget>[
      for (final (name, color) in entries)
        SizedBox(
          width: _swatchWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: _swatchWidth,
                height: _swatchHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    border: Border.all(color: context.colors.borderDefault),
                  ),
                ),
              ),
              const SizedBox(height: AppSpace.s4),
              Text(name, style: style),
            ],
          ),
        ),
    ],
  );
}
