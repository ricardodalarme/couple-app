import 'package:material_ui/material_ui.dart';
import 'package:ui/ui.dart';

/// Button height in the confirmation spec.
const double _buttonHeight = 50;

/// A sheet-style confirmation surface for irreversible actions.
///
/// The destructive variant keeps the surface white and only turns the confirm
/// verb to the status error ink: there is no success colour and no red fill.
class const BaseConfirmSheet({
  required final String title,
  required final String text,
  required final String confirmText,
  required final VoidCallback onConfirm,
  final String cancelText = 'Cancel',
  final bool isDestructive = false,
  final VoidCallback? onCancel,
  super.key,
}) extends StatelessWidget {
  /// Shows [BaseConfirmSheet] over the app and resolves to the person's choice.
  ///
  /// Returns `true` when the confirm verb is pressed, `false` on cancel or when
  /// the barrier is tapped. The optional [onConfirm] runs before the surface
  /// closes, for callers that prefer a callback over awaiting the result.
  static Future<bool> show({
    required BuildContext context,
    required String title,
    required String text,
    required String confirmText,
    VoidCallback? onConfirm,
    String cancelText = 'Cancel',
    bool isDestructive = false,
  }) => _showBaseConfirmSheet(
    context: context,
    title: title,
    text: text,
    confirmText: confirmText,
    onConfirm: onConfirm,
    cancelText: cancelText,
    isDestructive: isDestructive,
  );

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.ring,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpace.s20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: context.text.titleSm.copyWith(
                fontWeight: FontWeight.w600,
                color: colors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpace.s6),
            Text(text, style: context.text.caption.copyWith(color: colors.textSecondary)),
            const SizedBox(height: AppSpace.s18),
            _DialogAction(
              text: confirmText,
              onTap: onConfirm,
              background: isDestructive ? colors.bgSurface : colors.actionPrimary,
              foreground: isDestructive ? AppPalette.errorInk : colors.textOnAction,
              hasBorder: isDestructive,
            ),
            const SizedBox(height: AppSpace.s10),
            _DialogAction(
              text: cancelText,
              onTap: onCancel,
              background: colors.bgSurface,
              foreground: colors.textPrimary,
              hasBorder: true,
            ),
          ],
        ),
      ),
    );
  }
}

class const _DialogAction({
  required final String text,
  required final VoidCallback? onTap,
  required final Color background,
  required final Color foreground,
  required final bool hasBorder,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppPressable(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      enforceMinTapTarget: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: hasBorder ? AppBorders.hair(context.colors.borderDefault) : null,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: _buttonHeight),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.s20),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: context.text.body.copyWith(color: foreground),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> _showBaseConfirmSheet({
  required BuildContext context,
  required String title,
  required String text,
  required String confirmText,
  VoidCallback? onConfirm,
  String cancelText = 'Cancel',
  bool isDestructive = false,
}) async {
  final theme = Theme.of(context);
  final localizations = Localizations.of<MaterialLocalizations>(context, MaterialLocalizations);
  final barrierLabel = localizations?.modalBarrierDismissLabel ?? '';

  final result = await showGeneralDialog<bool>(
    context: context,
    barrierDismissible: true,
    barrierLabel: barrierLabel,
    barrierColor: context.colors.scrim,
    transitionDuration: context.motionDuration(AppMotion.base),
    pageBuilder: (dialogContext, animation, secondaryAnimation) => Theme(
      data: theme,
      child: Dialog(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: AppSpace.screenMargin,
          vertical: AppSpace.s24,
        ),
        child: BaseConfirmSheet(
          title: title,
          text: text,
          confirmText: confirmText,
          cancelText: cancelText,
          isDestructive: isDestructive,
          onConfirm: () {
            onConfirm?.call();
            Navigator.of(dialogContext).pop(true);
          },
          onCancel: () => Navigator.of(dialogContext).pop(false),
        ),
      ),
    ),
    transitionBuilder: (transitionContext, animation, secondaryAnimation, child) {
      if (transitionContext.reduceMotion) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: AppMotion.fastCurve),
          child: child,
        );
      }

      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: AppMotion.fastCurve),
        child: ScaleTransition(
          scale: Tween<double>(
            begin: .96,
            end: 1,
          ).chain(CurveTween(curve: AppMotion.baseCurve)).animate(animation),
          child: child,
        ),
      );
    },
  );

  return result ?? false;
}
