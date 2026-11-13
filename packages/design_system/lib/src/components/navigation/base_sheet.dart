import 'dart:math' as math;

import 'package:design_system/design_system.dart';
import 'package:material_ui/material_ui.dart';

const double _maxHeightFactor = .9;
const double _grabberWidth = 36;
const double _grabberHeight = 5;
const double _dismissDistance = 140;
const double _dismissVelocity = 700;

/// The sheet surface: grabber, optional header, scrollable body and fixed action.
///
/// It grows to at most 90% of the screen height, or the height left above the
/// software keyboard when one is open; the body scrolls. The title, close
/// button and body are separate semantics elements.
class const BaseSheet({
  required final Widget child,
  final String? title,
  final String? subtitle,
  final Widget? primaryAction,
  final VoidCallback? onClose,
  final String? closeSemanticLabel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final sheetTitle = title;
    final sheetSubtitle = subtitle;
    final action = primaryAction;
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final aboveKeyboard = math
        .max(0, screenHeight - MediaQuery.viewInsetsOf(context).bottom)
        .toDouble();
    final maxHeight = math.min(screenHeight * _maxHeightFactor, aboveKeyboard);

    final hasHeader = sheetTitle != null || sheetSubtitle != null || onClose != null;

    final surface = Material(
      color: colors.bgSurface,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.sheet)),
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: AppSpace.s20),
              child: Center(
                child: SizedBox(
                  key: ValueKey('baseSheetGrabber'),
                  width: _grabberWidth,
                  height: _grabberHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppPalette.neutral150,
                      borderRadius: BorderRadius.all(Radius.circular(AppRadius.xs)),
                    ),
                  ),
                ),
              ),
            ),
            if (hasHeader)
              Padding(
                padding: EdgeInsets.fromLTRB(
                  AppSpace.s20,
                  AppSpace.s16,
                  onClose == null ? AppSpace.s20 : AppSpace.s8,
                  0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (sheetTitle != null)
                            Text(
                              sheetTitle,
                              style: context.text.titleSm.copyWith(
                                color: colors.textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (sheetSubtitle != null)
                            Padding(
                              padding: EdgeInsets.only(top: sheetTitle == null ? 0 : AppSpace.s4),
                              child: Text(
                                sheetSubtitle,
                                style: context.text.caption.copyWith(color: colors.textSecondary),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (onClose != null)
                      BaseRoundButton(
                        icon: AppIcons.close,
                        onPressed: onClose,
                        semanticLabel: closeSemanticLabel,
                      ),
                  ],
                ),
              ),
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  AppSpace.s20,
                  hasHeader ? AppSpace.s12 : AppSpace.s16,
                  AppSpace.s20,
                  action == null ? AppSpace.s20 + bottomInset : 0,
                ),
                child: child,
              ),
            ),
            if (action != null)
              Padding(
                padding: EdgeInsets.fromLTRB(
                  AppSpace.s20,
                  AppSpace.s16,
                  AppSpace.s20,
                  AppSpace.s20 + bottomInset,
                ),
                child: action,
              ),
          ],
        ),
      ),
    );

    return Semantics(container: true, explicitChildNodes: true, child: surface);
  }

  /// Shows a [BaseSheet] and resolves with its result.
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    String? subtitle,
    Widget? primaryAction,
    bool isDismissible = true,
  }) {
    final colors = context.colors;
    final localizations = Localizations.of<MaterialLocalizations>(context, MaterialLocalizations);
    final isReducedMotion = context.reduceMotion;

    return Navigator.of(context, rootNavigator: true).push<T>(
      _BaseSheetRoute<T>(
        barrierColorValue: colors.scrim,
        barrierLabelValue: localizations?.modalBarrierDismissLabel ?? '',
        isDismissible: isDismissible,
        transition: context.motionDuration(AppMotion.base),
        isReducedMotion: isReducedMotion,
        builder: (sheetContext) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(sheetContext).bottom),
              child: _DraggableSheet(
                canDismiss: isDismissible,
                child: BaseSheet(
                  title: title,
                  subtitle: subtitle,
                  primaryAction: primaryAction,
                  onClose: isDismissible ? () => Navigator.of(sheetContext).maybePop() : null,
                  closeSemanticLabel: localizations?.closeButtonTooltip,
                  child: child,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _BaseSheetRoute<T>({
  required final WidgetBuilder builder,
  required final Color barrierColorValue,
  required final String barrierLabelValue,
  required final bool isDismissible,
  required final Duration transition,
  required final bool isReducedMotion,
}) extends PopupRoute<T> {
  @override
  bool get barrierDismissible => isDismissible;

  @override
  Color? get barrierColor => barrierColorValue;

  @override
  String? get barrierLabel => barrierLabelValue;

  @override
  Duration get transitionDuration => transition;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (isReducedMotion) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: AppMotion.fastCurve),
        child: child,
      );
    }

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).chain(CurveTween(curve: AppMotion.baseCurve)).animate(animation),
      child: child,
    );
  }
}

class const _DraggableSheet({required final Widget child, required final bool canDismiss})
    extends StatefulWidget {
  @override
  State<_DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState() extends State<_DraggableSheet> with SingleTickerProviderStateMixin {
  late final AnimationController _settle;
  double _offset = 0;
  double _settleFrom = 0;

  double get _currentOffset => _settle.isAnimating ? _settleFrom * (1 - _settle.value) : _offset;

  @override
  void initState() {
    super.initState();
    _settle = AnimationController(vsync: this, duration: AppMotion.base);
  }

  @override
  void dispose() {
    _settle.dispose();
    super.dispose();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (!widget.canDismiss) return;
    final current = _currentOffset;
    _settle.stop();
    final next = current + details.delta.dy;
    if (next <= 0) return;
    setState(() => _offset = next);
  }

  void _handleDragEnd(DragEndDetails details) {
    if (!widget.canDismiss) return;
    final velocity = details.velocity.pixelsPerSecond.dy;
    if (_offset > _dismissDistance || velocity > _dismissVelocity) {
      Navigator.of(context).maybePop();
      return;
    }
    _settleFrom = _offset;
    _offset = 0;
    _settle.duration = context.motionDuration(AppMotion.base);
    _settle.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _settle,
      builder: (context, child) {
        return Transform.translate(offset: Offset(0, _currentOffset), child: child);
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onVerticalDragUpdate: _handleDragUpdate,
        onVerticalDragEnd: _handleDragEnd,
        child: widget.child,
      ),
    );
  }
}
