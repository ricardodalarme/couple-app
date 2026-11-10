import 'package:design_system/src/theme/app_theme.dart';
import 'package:design_system/src/tokens/tokens.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// A tappable surface with the system's press scale, 44pt target, focus ring
/// and disabled opacity.
class const AppPressable({
  required final Widget child,
  final VoidCallback? onTap,
  final VoidCallback? onLongPress,
  final bool isEnabled = true,
  final BorderRadius? borderRadius,
  final String? semanticLabel,
  final bool isSemanticButton = true,
  final bool enforceMinTapTarget = false,
  final bool scaleOnPress = true,
  final bool? isSelected,
  final bool isHaptic = false,
  super.key,
}) extends StatefulWidget {
  @override
  State<AppPressable> createState() => _AppPressableState();
}

class _AppPressableState() extends State<AppPressable> {
  bool _isPressed = false;
  bool _isFocused = false;

  bool get _isInteractive => widget.isEnabled && widget.onTap != null;

  void _setPressed(bool value) {
    if (!_isInteractive || _isPressed == value) return;
    setState(() => _isPressed = value);
  }

  void _handleTap() {
    if (!_isInteractive) return;
    if (widget.isHaptic) HapticFeedback.lightImpact();
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    Widget content = AnimatedScale(
      scale: _isPressed && widget.scaleOnPress ? context.pressScale : 1,
      duration: context.motionDuration(AppMotion.fast),
      curve: AppMotion.fastCurve,
      child: widget.child,
    );

    if (widget.enforceMinTapTarget) {
      content = ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: AppIconSize.touch,
          minHeight: AppIconSize.touch,
        ),
        child: Center(widthFactor: 1, heightFactor: 1, child: content),
      );
    }

    content = Stack(
      clipBehavior: Clip.none,
      children: [
        content,
        if (_isFocused)
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(
                painter: _FocusRingPainter(
                  color: colors.accentLabel,
                  radius: widget.borderRadius?.topLeft.x ?? AppRadius.md,
                ),
              ),
            ),
          ),
      ],
    );

    return Semantics(
      label: widget.semanticLabel,
      button: widget.isSemanticButton,
      enabled: widget.isEnabled,
      selected: widget.isSelected,
      child: FocusableActionDetector(
        enabled: widget.isEnabled,
        onShowFocusHighlight: (value) {
          if (_isFocused != value) setState(() => _isFocused = value);
        },
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) {
              _handleTap();
              return null;
            },
          ),
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (_) => _setPressed(true),
          onTapUp: (_) => _setPressed(false),
          onTapCancel: () => _setPressed(false),
          onTap: _isInteractive ? _handleTap : null,
          onLongPress: widget.isEnabled ? widget.onLongPress : null,
          child: AnimatedOpacity(
            opacity: widget.isEnabled ? 1 : .4,
            duration: context.motionDuration(AppMotion.fast),
            child: content,
          ),
        ),
      ),
    );
  }
}

class const _FocusRingPainter({required final Color color, required final double radius})
    extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(-2, -2, size.width + 4, size.height + 4);
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(radius + 2)),
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(_FocusRingPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.radius != radius;
}
