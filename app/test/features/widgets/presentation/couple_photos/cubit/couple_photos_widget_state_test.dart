import 'dart:typed_data';

import 'package:flutter_bloc_starter/features/widgets/presentation/couple_photos/cubit/couple_photos_widget_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final preview = Uint8List.fromList([1, 2, 3]);

  test('clearLocalPreview drops the preview', () {
    final state = CouplePhotosWidgetState(localPreview: preview);

    expect(state.copyWith(clearLocalPreview: true).localPreview, isNull);
  });

  test('changing the preview theme keeps the local preview', () {
    final state = CouplePhotosWidgetState(localPreview: preview);

    final updated = state.copyWith(isDarkPreview: true);

    expect(updated.localPreview, preview);
    expect(updated.isDarkPreview, isTrue);
  });
}
