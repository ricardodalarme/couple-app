import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../helpers/widget_host.dart';

void main() {
  testWidgets('tab template renders in every theme at 100% and 200%', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    for (final variant in AppThemeVariant.values) {
      for (final scale in [1.0, 2.0]) {
        await tester.pumpTemplate(
          const BaseTabContent(
            body: Text('Body'),
            tabBar: SizedBox(height: 84, child: Text('Tabs')),
          ),
          appBar: const BaseAppBar(title: 'Header'),
          variant: variant,
          textScale: scale,
        );
        await tester.pump();

        expect(
          tester.takeException(),
          isNull,
          reason: 'BaseTabContent in ${variant.name} at ${scale}x',
        );
      }
    }
  });
}
