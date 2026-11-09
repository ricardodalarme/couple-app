import 'package:flutter/widgets.dart';
import 'package:ui/src/theme/app_theme.dart';

/// The hand-drawn underline used under the one highlighted word on a screen.
///
/// Only valid on text at 24pt or larger; the wave stretches to the word width.
class const AppHighlightedText({
  required final String text,
  required final String highlight,
  required final TextStyle style,
  final TextAlign textAlign = TextAlign.start,
  final int? maxLines,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final index = text.indexOf(highlight);

    if (index < 0 || highlight.isEmpty) {
      return Text(
        text,
        style: style,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: maxLines == null ? null : TextOverflow.ellipsis,
      );
    }

    final before = text.substring(0, index);
    final after = text.substring(index + highlight.length);

    return Text.rich(
      TextSpan(
        style: style,
        children: [
          if (before.isNotEmpty) TextSpan(text: before),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Text(highlight, style: style.copyWith(color: colors.accentHighlight)),
                Positioned(
                  left: -2,
                  right: -2,
                  bottom: -7,
                  height: 9,
                  child: CustomPaint(painter: SquigglePainter(color: colors.accentHighlight)),
                ),
              ],
            ),
          ),
          if (after.isNotEmpty) TextSpan(text: after),
        ],
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
    );
  }
}

/// Paints the 100 × 9 wave from the document, stretched to the available width.
class const SquigglePainter({required final Color color}) extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round;

    canvas
      ..save()
      ..scale(size.width / 100, size.height / 9);
    final path = Path()
      ..moveTo(2, 6)
      ..cubicTo(14, 2, 22, 2, 32, 5)
      ..cubicTo(42, 8, 52, 8, 64, 4)
      ..cubicTo(76, 0, 86, 2, 98, 5);
    canvas
      ..drawPath(path, paint)
      ..restore();
  }

  @override
  bool shouldRepaint(SquigglePainter oldDelegate) => oldDelegate.color != color;
}
