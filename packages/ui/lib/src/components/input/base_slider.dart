import 'package:flutter/services.dart';
import 'package:ui/ui.dart';

const double _trackHeight = 4;
const double _knobSize = 28;
const double _knobRadius = _knobSize / 2;
const double _touchHeight = 44;
const double _markSize = 6;
const double _bubbleHeight = 28;
const double _bubbleMinWidth = 32;
const double _bubblePadding = 8;
const double _bubbleGap = 6;
const double _endLabelGap = 8;
const double _keyboardDivisions = 20;

/// A 4pt slider with a 28pt knob and a 44pt touch band.
///
/// Continuous by default; pass [divisions] to snap and paint five to seven
/// dots. The bubble above the knob appears while dragging. Marks produce
/// `AppHaptics.selection()` and the keyboard arrows adjust by one step. The
/// control never carries a good/bad judgement: only the action and neutral
/// track roles are used.
class const BaseSlider({
  required final double value,
  required final ValueChanged<double> onChanged,
  final double min = 0,
  final double max = 1,
  final int? divisions,
  final String? startLabel,
  final String? endLabel,
  final String? semanticLabel,
  final String Function(double value)? valueFormatter,
  final ValueChanged<double>? onChangeStart,
  final ValueChanged<double>? onChangeEnd,
  final bool isEnabled = true,
  super.key,
}) extends StatefulWidget {
  @override
  State<BaseSlider> createState() => _BaseSliderState();
}

class _BaseSliderState() extends State<BaseSlider> {
  final FocusNode _focusNode = FocusNode();
  bool _isDragging = false;
  double? _dragValue;
  int? _lastMark;

  double get _range => widget.max > widget.min ? widget.max - widget.min : 1;
  int get _divisionCount => widget.divisions?.clamp(1, 6) ?? 0;

  double get _currentValue => _isDragging ? (_dragValue ?? widget.value) : widget.value;

  double get _fraction => ((_currentValue - widget.min) / _range).clamp(0.0, 1.0);

  String get _currentLabel => _format(_currentValue);

  String _format(double value) {
    final custom = widget.valueFormatter;
    if (custom != null) return custom(value);

    return value == value.roundToDouble() ? value.round().toString() : value.toStringAsFixed(1);
  }

  double _snap(double fraction) {
    final divisions = _divisionCount;
    if (divisions == 0) return widget.min + _range * fraction;

    final index = (fraction * divisions).round().clamp(0, divisions);
    return widget.min + _range * index / divisions;
  }

  void _emit(double next, {required bool fromDrag}) {
    final divisions = _divisionCount;
    final markIndex = divisions == 0 ? null : ((next - widget.min) / _range * divisions).round();

    if (fromDrag && markIndex != null && markIndex != _lastMark) {
      _lastMark = markIndex;
      AppHaptics.selection();
    }

    widget.onChanged(next.clamp(widget.min, widget.max));
  }

  void _updateFromPosition(double dx, double width) {
    final usable = width - _knobSize;
    if (usable <= 0) return;

    final fraction = ((dx - _knobRadius) / usable).clamp(0.0, 1.0);
    final next = _snap(fraction);
    setState(() => _dragValue = next);
    _emit(next, fromDrag: true);
  }

  void _stepBy(int direction) {
    final divisions = _divisionCount;
    final step = divisions == 0 ? _range / _keyboardDivisions : _range / divisions;
    final next = (_currentValue + step * direction).clamp(widget.min, widget.max);
    _emit(_snap((next - widget.min) / _range), fromDrag: true);
  }

  KeyEventResult _handleKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;

    if (event.logicalKey == LogicalKeyboardKey.arrowRight ||
        event.logicalKey == LogicalKeyboardKey.arrowUp) {
      _stepBy(1);
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft ||
        event.logicalKey == LogicalKeyboardKey.arrowDown) {
      _stepBy(-1);
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final divisions = _divisionCount;
    final fraction = _fraction;

    final control = Semantics(
      slider: true,
      enabled: widget.isEnabled,
      label: widget.semanticLabel,
      value: '$_currentLabel (${_format(widget.min)}–${_format(widget.max)})',
      increasedValue: _format(
        (_currentValue + _range / _keyboardDivisions).clamp(widget.min, widget.max),
      ),
      decreasedValue: _format(
        (_currentValue - _range / _keyboardDivisions).clamp(widget.min, widget.max),
      ),
      onIncrease: widget.isEnabled ? () => _stepBy(1) : null,
      onDecrease: widget.isEnabled ? () => _stepBy(-1) : null,
      child: ExcludeSemantics(
        child: Focus(
          focusNode: _focusNode,
          onKeyEvent: _handleKey,
          child: SizedBox(
            height: _touchHeight,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final usable = width - _knobSize;
                final knobLeft = usable * fraction;

                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTapDown: (details) {
                    _focusNode.requestFocus();
                    _updateFromPosition(details.localPosition.dx, width);
                  },
                  onHorizontalDragStart: (details) {
                    _focusNode.requestFocus();
                    setState(() {
                      _isDragging = true;
                      _dragValue = widget.value;
                      _lastMark = null;
                    });
                    widget.onChangeStart?.call(widget.value);
                    _updateFromPosition(details.localPosition.dx, width);
                  },
                  onHorizontalDragUpdate: (details) =>
                      _updateFromPosition(details.localPosition.dx, width),
                  onHorizontalDragEnd: (_) {
                    final endValue = _dragValue ?? widget.value;
                    setState(() {
                      _isDragging = false;
                      _dragValue = null;
                    });
                    _lastMark = null;
                    widget.onChangeEnd?.call(endValue);
                  },
                  onHorizontalDragCancel: () {
                    setState(() {
                      _isDragging = false;
                      _dragValue = null;
                    });
                    _lastMark = null;
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: _knobRadius,
                        right: _knobRadius,
                        top: (_touchHeight - _trackHeight) / 2,
                        child: Container(
                          height: _trackHeight,
                          decoration: BoxDecoration(
                            color: AppPalette.neutral150,
                            borderRadius: BorderRadius.circular(AppRadius.pill),
                          ),
                        ),
                      ),
                      Positioned(
                        left: _knobRadius,
                        top: (_touchHeight - _trackHeight) / 2,
                        width: (usable * fraction).clamp(0.0, usable),
                        height: _trackHeight,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: colors.actionPrimary,
                            borderRadius: BorderRadius.circular(AppRadius.pill),
                          ),
                        ),
                      ),
                      if (divisions > 0)
                        for (var index = 0; index <= divisions; index++)
                          Positioned(
                            left: _knobRadius + usable * index / divisions - _markSize / 2,
                            top: (_touchHeight - _markSize) / 2,
                            child: Container(
                              width: _markSize,
                              height: _markSize,
                              decoration: BoxDecoration(
                                color: index / divisions <= fraction
                                    ? colors.bgSurface
                                    : AppPalette.neutral200,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      Positioned(
                        left: knobLeft,
                        top: (_touchHeight - _knobSize) / 2,
                        child: Container(
                          width: _knobSize,
                          height: _knobSize,
                          decoration: BoxDecoration(
                            color: colors.bgSurface,
                            shape: BoxShape.circle,
                            border: Border.all(color: colors.borderDefault),
                            boxShadow: AppShadows.knob,
                          ),
                        ),
                      ),
                      if (_isDragging)
                        Positioned(
                          left: knobLeft + _knobRadius,
                          top: -(_bubbleHeight + _bubbleGap),
                          child: FractionalTranslation(
                            translation: const Offset(-.5, 0),
                            child: Container(
                              height: _bubbleHeight,
                              constraints: const BoxConstraints(minWidth: _bubbleMinWidth),
                              padding: const EdgeInsets.symmetric(horizontal: _bubblePadding),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: colors.actionPrimary,
                                borderRadius: BorderRadius.circular(AppRadius.pill),
                              ),
                              child: Text(
                                _currentLabel,
                                style: context.text.caption.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: colors.textOnAction,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );

    final slider = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        control,
        if (widget.startLabel != null || widget.endLabel != null) ...[
          const SizedBox(height: _endLabelGap),
          Row(
            children: [
              if (widget.startLabel case final label?)
                Text(label, style: context.text.micro.copyWith(color: colors.textSecondary))
              else
                const Spacer(),
              if (widget.endLabel case final label?)
                Text(label, style: context.text.micro.copyWith(color: colors.textSecondary)),
            ],
          ),
        ],
      ],
    );

    if (widget.isEnabled) return slider;

    return Opacity(opacity: .4, child: IgnorePointer(child: slider));
  }
}
