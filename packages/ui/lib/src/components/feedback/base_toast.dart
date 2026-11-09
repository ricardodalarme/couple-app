import 'dart:async';

import 'package:ui/ui.dart';

/// Height of the pill in the feedback spec.
const double _toastHeight = 52;

/// The tone of a [BaseToast].
enum BaseToastVariant() {
  /// Confirmation with an optional undo action.
  neutral,

  /// A background failure, with an optional retry action.
  error,
}

/// A dark pill that confirms an action or reports a background failure.
class const BaseToast({
  required final String message,
  final BaseToastVariant variant = BaseToastVariant.neutral,
  final String? actionLabel,
  final VoidCallback? onAction,
  final VoidCallback? onDismissed,
  super.key,
}) extends StatefulWidget {
  static OverlayEntry? _activeEntry;

  /// Shows a toast over the app and returns a callback that removes it.
  static VoidCallback show(
    BuildContext context,
    String message, {
    BaseToastVariant variant = BaseToastVariant.neutral,
    String? actionLabel,
    VoidCallback? onAction,
    VoidCallback? onDismissed,
  }) {
    BaseToast._activeEntry?.remove();
    BaseToast._activeEntry = null;

    final overlay = Overlay.of(context, rootOverlay: true);
    late final OverlayEntry entry;

    void removeEntry() {
      if (entry.mounted) entry.remove();
      if (BaseToast._activeEntry == entry) BaseToast._activeEntry = null;
    }

    entry = OverlayEntry(
      builder: (context) => Positioned(
        left: AppSpace.screenMargin,
        right: AppSpace.screenMargin,
        bottom: AppSpace.footerBottom,
        child: SafeArea(
          top: false,
          child: BaseToast(
            message: message,
            variant: variant,
            actionLabel: actionLabel,
            onAction: onAction,
            onDismissed: () {
              onDismissed?.call();
              removeEntry();
            },
          ),
        ),
      ),
    );
    BaseToast._activeEntry = entry;

    overlay.insert(entry);

    return removeEntry;
  }

  @override
  State<BaseToast> createState() => _BaseToastState();
}

class _BaseToastState() extends State<BaseToast> with SingleTickerProviderStateMixin {
  static const Duration _undoLifetime = Duration(seconds: 30);
  static const Duration _plainLifetime = Duration(seconds: 4);
  static const Duration _errorLifetime = Duration(seconds: 6);
  static const double _progressOpacity = .3;

  late final AnimationController _progress;
  Timer? _timer;

  bool get _hasAction => widget.actionLabel != null && widget.onAction != null;

  Duration? get _lifetime => switch (widget.variant) {
    .neutral => _hasAction ? _undoLifetime : _plainLifetime,
    .error => _hasAction ? null : _errorLifetime,
  };

  @override
  void initState() {
    super.initState();
    _progress = AnimationController(vsync: this, duration: _undoLifetime);
    if (widget.variant == BaseToastVariant.neutral && _hasAction) _progress.forward();
    if (_lifetime case final lifetime?) _timer = Timer(lifetime, _notifyDismissed);
  }

  void _notifyDismissed() {
    if (mounted) widget.onDismissed?.call();
  }

  void _handleAction() {
    _timer?.cancel();
    widget.onAction?.call();
    _notifyDismissed();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _progress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final hasAction = _hasAction;
    final icon = switch (widget.variant) {
      .neutral => null,
      .error => AppIcons.warning,
    };
    final iconColor = switch (widget.variant) {
      .neutral => null,
      .error => AppPalette.errorSurface,
    };

    return Semantics(
      liveRegion: true,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.pill),
        child: Stack(
          children: [
            ColoredBox(
              color: colors.actionPrimary,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  icon == null ? AppSpace.s18 : AppSpace.s16,
                  AppSpace.s4,
                  hasAction ? AppSpace.s8 : AppSpace.s18,
                  AppSpace.s4,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: _toastHeight - AppSpace.s8),
                  child: Row(
                    children: [
                      if (icon != null) ...[
                        AppIcon(icon: icon, color: iconColor),
                        const SizedBox(width: AppSpace.s10),
                      ],
                      Expanded(
                        child: Text(
                          widget.message,
                          style: context.text.bodySm.copyWith(color: colors.textOnAction),
                        ),
                      ),
                      if (hasAction) ...[
                        const SizedBox(width: AppSpace.s12),
                        AppPressable(
                          onTap: _handleAction,
                          borderRadius: BorderRadius.circular(AppRadius.pill),
                          enforceMinTapTarget: true,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppSpace.s12),
                            child: Text(
                              widget.actionLabel!,
                              style: context.text.bodySm.copyWith(
                                color: colors.textOnAction,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            if (widget.variant == BaseToastVariant.neutral && hasAction)
              Positioned(
                left: AppSpace.s18,
                right: AppSpace.s18,
                bottom: AppSpace.s2,
                child: AnimatedBuilder(
                  animation: _progress,
                  builder: (context, _) => FractionallySizedBox(
                    widthFactor: 1 - _progress.value,
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: AppBorder.hair,
                      child: ColoredBox(
                        color: colors.textOnAction.withValues(alpha: _progressOpacity),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
