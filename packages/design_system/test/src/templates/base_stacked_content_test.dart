import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/widget_host.dart';

void main() {
  testWidgets('stacked template renders in every theme at 100% and 200%', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    for (final variant in AppThemeVariant.values) {
      for (final scale in [1.0, 2.0]) {
        await tester.pumpTemplate(
          const BaseStackedContent(
            body: Text('Body'),
            footer: SizedBox(height: 50, child: Text('Footer')),
          ),
          appBar: const BaseAppBar(title: 'Header'),
          variant: variant,
          textScale: scale,
        );
        await tester.pump();

        expect(
          tester.takeException(),
          isNull,
          reason: 'BaseStackedContent in ${variant.name} at ${scale}x',
        );
      }
    }
  });
}
