import 'package:common_ui/common_ui.dart';
import 'package:ui/ui.dart' as ds;

/// Composes the design-system theme with the starter's legacy tokens.
///
/// Existing screens still read `context.palette` / `context.typography`; new
/// screens read `context.colors` / `context.text`. Both live in the same theme
/// while the app migrates screen by screen.
abstract final class AppThemeBridge() {
  static ds.AppThemeData light(ds.AppThemeVariant variant) {
    final theme = ds.AppTheme.light(variant);
    final colors = ds.AppColors.forVariant(variant);

    final palette = const Palette.light().copyWith(
      primary: colors.actionPrimary,
      onPrimary: colors.textOnAction,
      secondary: colors.accentLabel,
      onSecondary: colors.textOnAction,
      background: colors.bgScreen,
      onBackground: colors.textPrimary,
      container: colors.bgSurface,
      onContainer: colors.textPrimary,
      success: ds.AppPalette.inviteLabel,
      onSuccess: colors.textOnAction,
      error: ds.AppPalette.errorInk,
      onError: colors.textOnAction,
    );

    return theme.copyWith(
      scaffoldBackgroundColor: colors.bgScreen,
      extensions: [
        ds.AppColors.forVariant(variant),
        ds.AppTypography.system,
        palette,
        const Typography(),
      ],
    );
  }
}
