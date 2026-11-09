import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

/// Switches the gallery between the three documented themes.
///
/// Light only: dark tokens exist in the document as a proposal, but no dark
/// screen has been designed.
class DesignSystemThemeAddon() extends ThemeAddon<AppThemeVariant> {
  this
    : super(
        themes: const [
          WidgetbookTheme(name: 'Soft pink', data: AppThemeVariant.rose),
          WidgetbookTheme(name: 'Soft blue', data: AppThemeVariant.blue),
          WidgetbookTheme(name: 'Neutral', data: AppThemeVariant.neutral),
        ],
        themeBuilder: (context, variant, child) => AppThemed(variant: variant, child: child),
      );
}
