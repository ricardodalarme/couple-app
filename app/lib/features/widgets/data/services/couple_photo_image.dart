import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

/// Decodes and shrinks a couple photo before it reaches the native widget cache.
abstract final class CouplePhotoImage() {
  static const int maxLongEdge = 1280;

  /// Caps the long edge of [bytes] at [maxLongEdge] and returns PNG bytes.
  ///
  /// Returns null when [bytes] is not a decodable image.
  static Future<Uint8List?> downscalePng(Uint8List bytes, {int maxLongEdge = maxLongEdge}) async {
    if (bytes.isEmpty) return null;

    ui.Codec? sourceCodec;
    ui.Codec? resizedCodec;
    ui.Image? source;
    ui.Image? resized;
    try {
      sourceCodec = await ui.instantiateImageCodec(bytes);
      final frame = await sourceCodec.getNextFrame();
      source = frame.image;
      final longEdge = source.width > source.height ? source.width : source.height;

      if (longEdge <= maxLongEdge) {
        return await _pngBytes(source);
      }

      final scale = maxLongEdge / longEdge;
      final targetWidth = math.max(1, (source.width * scale).round());
      final targetHeight = math.max(1, (source.height * scale).round());
      resizedCodec = await ui.instantiateImageCodec(
        bytes,
        targetWidth: targetWidth,
        targetHeight: targetHeight,
      );
      final resizedFrame = await resizedCodec.getNextFrame();
      resized = resizedFrame.image;
      return await _pngBytes(resized);
    } on Object {
      return null;
    } finally {
      source?.dispose();
      resized?.dispose();
      sourceCodec?.dispose();
      resizedCodec?.dispose();
    }
  }

  static Future<Uint8List?> _pngBytes(ui.Image image) async {
    final data = await image.toByteData(format: ui.ImageByteFormat.png);
    return data?.buffer.asUint8List();
  }
}
