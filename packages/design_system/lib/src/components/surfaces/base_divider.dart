import 'dart:math' as math;

import 'package:design_system/design_system.dart';

const double _inset = AppSpace.s16;
const double _dash = 4;
const double _labelGap = AppSpace.s12;
const double _labelWidthFactor = .5;

/// A horizontal rule with an optional centred label.
///
/// [isDashed] draws a dash; [isInset] indents the line for list groups.
class const BaseDivider({
  final String? label,
  final bool isDashed = false,
  final bool isInset = false,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    Widget content;
    if (label == null) {
      content = _line(colors);
    } else {
      content = LayoutBuilder(
        builder: (context, constraints) {
          final available = constraints.hasBoundedWidth
              ? constraints.maxWidth
              : MediaQuery.sizeOf(context).width;

          return Row(
            children: [
              Expanded(child: _line(colors)),
              const SizedBox(width: _labelGap),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: available * _labelWidthFactor),
                child: Text(
                  label!,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: context.text.caption.copyWith(color: colors.textSecondary),
                ),
              ),
              const SizedBox(width: _labelGap),
              Expanded(child: _line(colors)),
            ],
          );
        },
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isInset ? _inset : 0),
      child: content,
    );
  }

  Widget _line(AppColors colors) {
    if (!isDashed) {
      return Container(height: AppBorder.hair, color: colors.borderDefault);
    }

    return SizedBox(
      height: AppBorder.hair,
      child: CustomPaint(painter: _DashedLinePainter(color: colors.borderDefault)),
    );
  }
}

class const _DashedLinePainter({required final Color color}) extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = AppBorder.hair
      ..strokeCap = StrokeCap.round;

    var x = 0.0;
    while (x < size.width) {
      canvas.drawLine(
        Offset(x, size.height / 2),
        Offset(math.min(x + _dash, size.width), size.height / 2),
        paint,
      );
      x += _dash * 2;
    }
  }

  @override
  bool shouldRepaint(_DashedLinePainter oldDelegate) => oldDelegate.color != color;
}
