import 'package:material_ui/material_ui.dart';
import 'package:ui/ui.dart';

const double _primaryHeight = 50;

/// A centred decision that never closes on an outside tap.
///
/// The title is centred, the support text stops at four lines and the actions
/// stack full width with a 10 gap. When [isDestructive] is true the primary
/// action keeps its filled shape but takes the status error colour; the cancel
/// action stays a text button.
class const BaseDialog({
  required final String title,
  required final String primaryText,
  required final VoidCallback? onPrimary,
  final String? text,
  final String? secondaryText,
  final VoidCallback? onSecondary,
  final bool isDestructive = false,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final body = text;
    final secondary = secondaryText;

    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: title,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.bgSurface,
          borderRadius: BorderRadius.circular(AppRadius.dialog),
          border: AppBorders.hair(colors.borderDefault),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpace.s22,
            AppSpace.s26,
            AppSpace.s22,
            AppSpace.s20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.text.titleSm.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colors.textPrimary,
                ),
              ),
              if (body != null)
                Padding(
                  padding: const EdgeInsets.only(top: AppSpace.s8),
                  child: Text(
                    body,
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: context.text.bodySm.copyWith(color: colors.textSecondary),
                  ),
                ),
              const SizedBox(height: AppSpace.s18),
              if (isDestructive)
                _DestructivePrimary(text: primaryText, onPressed: onPrimary)
              else
                BaseButton.primary(text: primaryText, onPressed: onPrimary),
              if (secondary != null) ...[
                const SizedBox(height: AppSpace.s10),
                BaseButton.text(text: secondary, onPressed: onSecondary, isFullWidth: true),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// Shows a [BaseDialog] centred over the app and resolves with its result.
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String primaryText,
    String? text,
    T? primaryResult,
    String? secondaryText,
    T? secondaryResult,
    bool isDestructive = false,
  }) => _showBaseDialog<T>(
    context: context,
    title: title,
    primaryText: primaryText,
    text: text,
    primaryResult: primaryResult,
    secondaryText: secondaryText,
    secondaryResult: secondaryResult,
    isDestructive: isDestructive,
  );
}

Future<T?> _showBaseDialog<T>({
  required BuildContext context,
  required String title,
  required String primaryText,
  String? text,
  T? primaryResult,
  String? secondaryText,
  T? secondaryResult,
  bool isDestructive = false,
}) {
  final localizations = Localizations.of<MaterialLocalizations>(context, MaterialLocalizations);

  return Navigator.of(context, rootNavigator: true).push<T>(
    _BaseDialogRoute<T>(
      barrierColorValue: context.colors.scrim,
      barrierLabelValue: localizations?.modalBarrierDismissLabel ?? title,
      transition: context.motionDuration(AppMotion.base),
      isReducedMotion: context.reduceMotion,
      builder: (dialogContext) => BaseDialog(
        title: title,
        text: text,
        primaryText: primaryText,
        isDestructive: isDestructive,
        secondaryText: secondaryText,
        onPrimary: () => Navigator.of(dialogContext).pop(primaryResult),
        onSecondary: secondaryText == null
            ? null
            : () => Navigator.of(dialogContext).pop(secondaryResult),
      ),
    ),
  );
}

class _BaseDialogRoute<T>({
  required final WidgetBuilder builder,
  required final Color barrierColorValue,
  required final String barrierLabelValue,
  required final Duration transition,
  required final bool isReducedMotion,
}) extends PopupRoute<T> {
  @override
  bool get barrierDismissible => false;

  @override
  Color? get barrierColor => barrierColorValue;

  @override
  String? get barrierLabel => barrierLabelValue;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => transition;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: DefaultTextStyle(
        style: context.text.body,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.s28, vertical: AppSpace.s24),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: AppSpace.maxContentWidth),
                child: builder(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final fade = CurvedAnimation(parent: animation, curve: AppMotion.fastCurve);

    if (isReducedMotion) return FadeTransition(opacity: fade, child: child);

    return FadeTransition(
      opacity: fade,
      child: ScaleTransition(
        scale: Tween<double>(
          begin: .96,
          end: 1,
        ).chain(CurveTween(curve: AppMotion.baseCurve)).animate(animation),
        child: child,
      ),
    );
  }
}

class const _DestructivePrimary({
  required final String text,
  required final VoidCallback? onPressed,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AppPressable(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppPalette.errorInk,
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: _primaryHeight),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.s20),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: context.text.body.copyWith(color: colors.textOnAction),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
