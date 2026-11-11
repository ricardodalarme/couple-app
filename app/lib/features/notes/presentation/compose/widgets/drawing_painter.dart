import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/cubit/drawing_stroke.dart';

/// The inks a drawing can use; fixed so the partner sees the same colors in any theme.
const List<Color> drawingPens = [
  AppPalette.neutral900,
  AppPalette.ideaLabel,
  AppPalette.datesLabel,
  AppPalette.inviteLabel,
];

const Color drawingPaper = AppPalette.neutral0;
const double _exportSize = 640;
const double _strokeFraction = 0.012;

/// Paints [strokes] on a square paper that fills the canvas it is given.
class const DrawingPainter({required final List<DrawingStroke> strokes}) extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final side = size.shortestSide;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = side * _strokeFraction;

    for (final stroke in strokes) {
      paint.color = drawingPens[stroke.penIndex.clamp(0, drawingPens.length - 1)];
      final points = [
        for (final point in stroke.points) Offset(point.dx * size.width, point.dy * size.height),
      ];
      if (points.length == 1) {
        canvas.drawCircle(points.first, paint.strokeWidth / 2, paint..style = PaintingStyle.fill);
        paint.style = PaintingStyle.stroke;
        continue;
      }
      final path = Path()..moveTo(points.first.dx, points.first.dy);
      for (final point in points.skip(1)) {
        path.lineTo(point.dx, point.dy);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => oldDelegate.strokes != strokes;
}

/// Renders [strokes] on white paper to a PNG of [_exportSize] pixels a side.
Future<Uint8List> renderDrawingPng(List<DrawingStroke> strokes) async {
  const size = Size(_exportSize, _exportSize);
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder, Offset.zero & size)
    ..drawRect(Offset.zero & size, Paint()..color = drawingPaper);
  DrawingPainter(strokes: strokes).paint(canvas, size);
  final image = await recorder.endRecording().toImage(_exportSize.toInt(), _exportSize.toInt());
  final data = await image.toByteData(format: ui.ImageByteFormat.png);
  image.dispose();

  return data!.buffer.asUint8List();
}
