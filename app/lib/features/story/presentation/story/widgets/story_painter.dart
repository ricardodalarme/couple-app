import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/story/data/models/story_card.dart';

const double _exportWidth = 1080;
const double _exportHeight = 1920;

/// Labels drawn on the image, already in the person's language.
final class const StoryLabels({required final String days, required final String together})
    with Equatable {
  @override
  List<Object?> get props => [days, together];
}

/// Paints the shareable card on a 9:16 canvas; the same painter draws the preview and the PNG.
class const StoryPainter({required final StoryCard card, required final StoryLabels labels})
    extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final unit = size.width / 100;
    canvas.drawRect(
      Offset.zero & size,
      Paint()
        ..shader = ui.Gradient.linear(
          Offset.zero,
          Offset(0, size.height),
          [AppPalette.neutral25, AppPalette.ideaWash, AppPalette.datesWash],
          [0, .6, 1],
        ),
    );

    _text(
      canvas,
      size,
      '${card.daysTogether}',
      size.height * .38,
      unit * 26,
      AppPalette.neutral900,
    );
    _text(
      canvas,
      size,
      labels.days,
      size.height * .38 + unit * 30,
      unit * 7,
      AppPalette.neutral700,
    );
    _text(
      canvas,
      size,
      labels.together,
      size.height * .38 + unit * 40,
      unit * 7,
      AppPalette.neutral700,
    );

    final names = card.names;
    if (names != null && names.isNotEmpty) {
      _text(canvas, size, names, size.height * .2, unit * 8, AppPalette.neutral800);
    }
    final phrase = card.phrase;
    if (phrase != null && phrase.isNotEmpty) {
      _text(canvas, size, phrase, size.height * .72, unit * 6.5, AppPalette.neutral800);
    }
  }

  void _text(Canvas canvas, Size size, String text, double top, double fontSize, Color color) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.w600),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      maxLines: 3,
    )..layout(maxWidth: size.width * .84);
    painter.paint(canvas, Offset((size.width - painter.width) / 2, top));
  }

  @override
  bool shouldRepaint(StoryPainter oldDelegate) =>
      oldDelegate.card != card || oldDelegate.labels != labels;
}

/// Renders [card] to a PNG of 1080 by 1920 pixels.
Future<Uint8List> renderStoryPng(StoryCard card, StoryLabels labels) async {
  const size = Size(_exportWidth, _exportHeight);
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder, Offset.zero & size);
  StoryPainter(card: card, labels: labels).paint(canvas, size);
  final image = await recorder.endRecording().toImage(_exportWidth.toInt(), _exportHeight.toInt());
  final data = await image.toByteData(format: ui.ImageByteFormat.png);
  image.dispose();

  return data!.buffer.asUint8List();
}
