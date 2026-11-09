import 'package:flutter/widgets.dart';
import 'package:ui/src/theme/app_theme.dart';
import 'package:ui/src/tokens/tokens.dart';

/// The only gradient the system allows: two soft radial glows inside a card.
/// It never paints the screen background.
enum AppWash() {
  /// Highlight card: strong bottom-right, light top-left.
  hero,

  /// List card: one glow on the right, behind the face or trailing element.
  listRight,

  /// Received-card banner: one glow on the left, behind the envelope.
  receivedLeft,

  /// Sunday letter: strong top-right, light bottom-left.
  letter,
}

/// A card surface painted with a [AppWash] on top of its background.
class const AppWashSurface({
  required final AppWash wash,
  required final Widget child,
  final Color? background,
  final BorderRadius? borderRadius,
  final EdgeInsetsGeometry padding = EdgeInsets.zero,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    Widget surface = CustomPaint(
      painter: WashPainter(
        wash: wash,
        strong: colors.washStrong,
        light: colors.washLight,
        background: background ?? colors.bgSurface,
      ),
      child: Padding(padding: padding, child: child),
    );

    final radius = borderRadius;
    if (radius != null) surface = ClipRRect(borderRadius: radius, child: surface);

    return surface;
  }
}

/// Paints a card background plus the wash glows described in the document.
class const WashPainter({
  required final AppWash wash,
  required final Color strong,
  required final Color light,
  required final Color background,
}) extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = background);

    switch (wash) {
      case .hero:
        _glow(
          canvas,
          size,
          center: const Alignment(.8, .78),
          rx: 1.1,
          ry: .8,
          color: strong,
          stop: .62,
        );
        _glow(
          canvas,
          size,
          center: const Alignment(.12, .08),
          rx: .8,
          ry: .6,
          color: light,
          stop: .7,
        );
      case .listRight:
        _glow(
          canvas,
          size,
          center: Alignment.centerRight,
          rx: .9,
          ry: 1.2,
          color: strong,
          stop: .7,
        );
      case .receivedLeft:
        _glow(
          canvas,
          size,
          center: const Alignment(0, .5),
          rx: .9,
          ry: 1.4,
          color: strong,
          stop: .7,
        );
      case .letter:
        _glow(
          canvas,
          size,
          center: Alignment.centerRight,
          rx: 1.2,
          ry: .7,
          color: strong,
          stop: .6,
        );
        _glow(canvas, size, center: Alignment.bottomCenter, rx: .9, ry: .6, color: light, stop: .7);
    }
  }

  void _glow(
    Canvas canvas,
    Size size, {
    required Alignment center,
    required double rx,
    required double ry,
    required Color color,
    required double stop,
  }) {
    final radiusX = size.width * rx;
    final radiusY = size.height * ry;
    if (radiusX <= 0 || radiusY <= 0) return;

    final cx = size.width * (center.x + 1) / 2;
    final cy = size.height * (center.y + 1) / 2;

    final shader = RadialGradient(
      colors: [color, color.withValues(alpha: 0)],
      stops: [0, stop],
    ).createShader(Rect.fromCircle(center: Offset(cx, cy), radius: radiusX));

    final paint = Paint()..shader = shader;

    canvas
      ..save()
      ..translate(cx, cy)
      ..scale(1, radiusY / radiusX)
      ..translate(-cx, -cy)
      ..drawCircle(Offset(cx, cy), radiusX, paint)
      ..restore();
  }

  @override
  bool shouldRepaint(WashPainter oldDelegate) =>
      oldDelegate.wash != wash ||
      oldDelegate.strong != strong ||
      oldDelegate.light != light ||
      oldDelegate.background != background;
}

/// The 6pt white ring that wraps a card and gives it its glassy edge.
class const AppCardRing({required final Widget child, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.bgRing,
        borderRadius: BorderRadius.circular(AppRadius.ring),
        border: Border.all(color: colors.borderDefault),
        boxShadow: const [
          BoxShadow(
            color: AppPalette.shadowRing,
            offset: Offset(0, 10),
            blurRadius: 30,
            spreadRadius: -18,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpace.s6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.card),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.card),
              border: Border.all(color: AppPalette.innerGlow),
            ),
            position: DecorationPosition.foreground,
            child: child,
          ),
        ),
      ),
    );
  }
}
