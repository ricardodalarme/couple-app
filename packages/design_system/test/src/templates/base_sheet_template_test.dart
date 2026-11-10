import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/widget_host.dart';

void main() {
  testWidgets('sheet template renders in every theme at 100% and 200%', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    for (final variant in AppThemeVariant.values) {
      for (final scale in [1.0, 2.0]) {
        await tester.pumpWidget(
          themedHost(
            const BaseSheetTemplate(
              title: 'Choose one',
              subtitle: 'It stays private.',
              child: Text('Choice'),
            ),
            variant: variant,
            textScale: scale,
          ),
        );
        await tester.pump();

        expect(
          tester.takeException(),
          isNull,
          reason: 'BaseSheetTemplate in ${variant.name} at ${scale}x',
        );
      }
    }
  });
}
