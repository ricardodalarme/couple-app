import 'package:design_system/design_system_l10n.dart';
import 'package:design_system/src/theme/app_theme.dart';
import 'package:design_system/src/tokens/tokens.dart';
import 'package:flutter/widgets.dart';

const int _dotCount = 3;
const double _minOpacity = .3;
const double _maxOpacity = .9;
const List<double> _staticOpacities = [.9, .6, .3];

/// Three dots that pulse in sequence while work is in flight.
class const BaseLoadingDots({
  final Color? color,
  final double dotSize = 6,
  final double gap = 5,
  final String? semanticLabel,
  super.key,
}) extends StatefulWidget {
  @override
  State<BaseLoadingDots> createState() => _BaseLoadingDotsState();
}

class _BaseLoadingDotsState() extends State<BaseLoadingDots> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: AppMotion.slow);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (context.reduceMotion) {
      _controller.stop();
    } else if (!_controller.isAnimating) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? context.colors.accentLabel;
    final isStatic = context.reduceMotion;

    final dots = AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int index = 0; index < _dotCount; index++) ...[
              if (index > 0) SizedBox(width: widget.gap),
              _Dot(
                color: color,
                size: widget.dotSize,
                opacity: isStatic
                    ? _staticOpacities[index]
                    : _animatedOpacity(_controller.value, index),
              ),
            ],
          ],
        );
      },
    );

    final label = widget.semanticLabel ?? context.designSystemL10nOrBase.common.loading;

    return Semantics(
      liveRegion: true,
      label: label,
      child: ExcludeSemantics(child: dots),
    );
  }

  double _animatedOpacity(double progress, int index) {
    final phase = (progress + index / _dotCount) % 1;
    final wave = phase < .5 ? phase * 2 : (1 - phase) * 2;

    return _minOpacity + (_maxOpacity - _minOpacity) * wave;
  }
}

class const _Dot({
  required final Color color,
  required final double size,
  required final double opacity,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color.withValues(alpha: opacity),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
