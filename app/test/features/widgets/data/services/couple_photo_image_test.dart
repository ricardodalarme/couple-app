import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter_bloc_starter/features/widgets/data/services/couple_photo_image.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<Uint8List> syntheticPng(int width, int height) async {
    final recorder = ui.PictureRecorder();
    ui.Canvas(recorder).drawRect(
      ui.Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
      ui.Paint()..color = const ui.Color(0xFF336699),
    );
    final image = await recorder.endRecording().toImage(width, height);
    final data = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    return data!.buffer.asUint8List();
  }

  Future<(int width, int height)> dimensions(Uint8List bytes) async {
    final codec = await ui.instantiateImageCodec(bytes);
    final frame = await codec.getNextFrame();
    final size = (frame.image.width, frame.image.height);
    frame.image.dispose();
    codec.dispose();
    return size;
  }

  test('caps the long edge of a large photo', () async {
    final resized = await CouplePhotoImage.downscalePng(await syntheticPng(2400, 1200));

    expect(resized, isNotNull);
    expect(await dimensions(resized!), (1280, 640));
  });

  test('keeps a photo that already fits inside the cap', () async {
    final resized = await CouplePhotoImage.downscalePng(await syntheticPng(400, 200));

    expect(resized, isNotNull);
    expect(await dimensions(resized!), (400, 200));
  });

  test('returns null for bytes that are not an image', () async {
    final resized = await CouplePhotoImage.downscalePng(Uint8List.fromList([1, 2, 3]));

    expect(resized, isNull);
  });
}
