import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

void _noop() {}

Widget _gallery() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(width: 96, child: BaseImagePlaceholder(semanticLabel: 'Photo')),
      SizedBox(height: AppSpace.s12),
      SizedBox(
        width: 128,
        child: BaseImagePlaceholder(
          ratio: BaseImagePlaceholderRatio.fourByThree,
          status: BaseImagePlaceholderStatus.loading,
          semanticLabel: 'Loading photo',
        ),
      ),
      SizedBox(height: AppSpace.s12),
      SizedBox(
        width: 170,
        child: BaseImagePlaceholder(
          ratio: BaseImagePlaceholderRatio.sixteenByNine,
          status: BaseImagePlaceholderStatus.failure,
          onRetry: _noop,
          semanticLabel: 'Photo could not load. Try again',
        ),
      ),
    ],
  );
}

void main() {
  for (final variant in AppThemeVariant.values) {
    for (final scale in const [1.0, 2.0]) {
      testWidgets('image placeholders render in ${variant.name} at ${scale}x text', (tester) async {
        await tester.pumpWidget(galleryHost(_gallery(), variant: variant, textScale: scale));
        await tester.pump();

        expect(find.byType(BaseImagePlaceholder), findsNWidgets(3));
        expect(tester.takeException(), isNull);

        await tester.pumpWidget(const SizedBox.shrink());
        await tester.pump();
      });
    }
  }
}
