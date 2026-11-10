import 'package:design_system/design_system.dart';
import 'package:material_ui/material_ui.dart';

/// The visual weight of a [BaseButton].
enum BaseButtonVariant() {
  /// The single strong action of a screen.
  primary,

  /// The action beside the primary one.
  secondary,

  /// A quiet action with no fill or border.
  text,

  /// A quiet action that removes or destroys something.
  destructive,

  /// A small dark action inside a card or banner.
  compact,
}

const double _regularHeight = 50;
const double _compactHeight = 40;

/// A labelled action with five weights and full interaction states.
class const BaseButton({
  required final String text,
  required final VoidCallback? onPressed,
  final BaseButtonVariant variant = .primary,
  final bool isLoading = false,
  final bool isEnabled = true,
  final IconData? icon,
  final bool isFullWidth = true,
  super.key,
}) extends StatefulWidget {
  /// The one strong action of a screen. Full width by default.
  const new primary({
    required String text,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isEnabled = true,
    IconData? icon,
    bool isFullWidth = true,
    Key? key,
  }) : this(
         text: text,
         onPressed: onPressed,
         variant: .primary,
         isLoading: isLoading,
         isEnabled: isEnabled,
         icon: icon,
         isFullWidth: isFullWidth,
         key: key,
       );

  /// The action beside the primary one. Sizes to its content by default.
  const new secondary({
    required String text,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isEnabled = true,
    IconData? icon,
    bool isFullWidth = false,
    Key? key,
  }) : this(
         text: text,
         onPressed: onPressed,
         variant: .secondary,
         isLoading: isLoading,
         isEnabled: isEnabled,
         icon: icon,
         isFullWidth: isFullWidth,
         key: key,
       );

  /// A quiet action with no fill or border.
  const new text({
    required String text,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isEnabled = true,
    IconData? icon,
    bool isFullWidth = false,
    Key? key,
  }) : this(
         text: text,
         onPressed: onPressed,
         variant: .text,
         isLoading: isLoading,
         isEnabled: isEnabled,
         icon: icon,
         isFullWidth: isFullWidth,
         key: key,
       );

  /// A quiet action that removes something, in the status error ink.
  const new destructive({
    required String text,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isEnabled = true,
    IconData? icon,
    bool isFullWidth = false,
    Key? key,
  }) : this(
         text: text,
         onPressed: onPressed,
         variant: .destructive,
         isLoading: isLoading,
         isEnabled: isEnabled,
         icon: icon,
         isFullWidth: isFullWidth,
         key: key,
       );

  /// A small dark action inside a card or banner. Sizes to its content.
  const new compact({
    required String text,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isEnabled = true,
    IconData? icon,
    bool isFullWidth = false,
    Key? key,
  }) : this(
         text: text,
         onPressed: onPressed,
         variant: .compact,
         isLoading: isLoading,
         isEnabled: isEnabled,
         icon: icon,
         isFullWidth: isFullWidth,
         key: key,
       );

  @override
  State<BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState() extends State<BaseButton> {
  bool _isPressed = false;

  bool get _isInteractive => widget.isEnabled && !widget.isLoading && widget.onPressed != null;

  bool get _isAvailable => widget.isEnabled && (widget.isLoading || widget.onPressed != null);

  void _setPressed(bool value) {
    if (!_isInteractive || _isPressed == value) return;
    setState(() => _isPressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isCompact = widget.variant == .compact;
    final foreground = _foreground(colors);
    final style = (isCompact ? context.text.bodySm : context.text.body).copyWith(color: foreground);

    return Listener(
      onPointerDown: (_) => _setPressed(true),
      onPointerUp: (_) => _setPressed(false),
      onPointerCancel: (_) => _setPressed(false),
      child: AppPressable(
        onTap: _isInteractive ? widget.onPressed : null,
        isEnabled: _isAvailable,
        semanticLabel: widget.isLoading ? widget.text : null,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        enforceMinTapTarget: isCompact,
        child: AnimatedContainer(
          duration: context.motionDuration(AppMotion.fast),
          width: widget.isFullWidth ? double.infinity : null,
          constraints: BoxConstraints(minHeight: isCompact ? _compactHeight : _regularHeight),
          padding: EdgeInsets.symmetric(horizontal: _sidePadding),
          decoration: BoxDecoration(
            color: _background(colors),
            border: widget.variant == .secondary ? AppBorders.hair(colors.borderDefault) : null,
            borderRadius: BorderRadius.circular(AppRadius.pill),
          ),
          child: widget.isLoading
              ? Center(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: ExcludeSemantics(child: BaseLoadingDots(color: foreground)),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(widget.text, style: style, textAlign: TextAlign.center),
                    ),
                    if (widget.icon != null) ...[
                      const SizedBox(width: AppSpace.s8),
                      AppIcon(icon: widget.icon!, size: AppIconSize.sm, color: foreground),
                    ],
                  ],
                ),
        ),
      ),
    );
  }

  double get _sidePadding => switch (widget.variant) {
    .primary => AppSpace.s24,
    .secondary => AppSpace.s20,
    .text || .destructive => AppSpace.s12,
    .compact => AppSpace.s18,
  };

  Color _foreground(AppColors colors) => switch (widget.variant) {
    .primary || .compact => colors.textOnAction,
    .secondary || .text => colors.textPrimary,
    .destructive => AppPalette.errorInk,
  };

  Color _background(AppColors colors) {
    if (_isPressed) {
      return switch (widget.variant) {
        .primary || .compact => colors.actionPrimaryPressed,
        .secondary || .text || .destructive => AppPalette.safetySurface,
      };
    }

    return switch (widget.variant) {
      .primary || .compact => colors.actionPrimary,
      .secondary => colors.bgSurface,
      .text || .destructive => Colors.transparent,
    };
  }
}
