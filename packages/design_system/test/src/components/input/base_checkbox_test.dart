import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/widget_host.dart';

Widget _gallery() {
  return Row(
    children: [
      BaseCheckbox(value: true, label: 'Remember me', onChanged: (_) {}),
      const SizedBox(width: AppSpace.s16),
      const BaseCheckbox(value: false, isIndeterminate: true, label: 'Mixed'),
    ],
  );
}

void main() {
  for (final variant in AppThemeVariant.values) {
    for (final scale in [1.0, 2.0]) {
      testWidgets('checkboxes render in ${variant.name} at ${scale}x', (tester) async {
        await tester.pumpWidget(inputHost(_gallery(), variant: variant, textScale: scale));
        await tester.pump();

        expect(find.byType(BaseCheckbox), findsNWidgets(2));
        expect(tester.takeException(), isNull);
      });
    }
  }

  testWidgets('checkbox reports taps on its whole row', (tester) async {
    bool? checked;

    await tester.pumpWidget(
      inputHost(
        BaseCheckbox(
          value: false,
          label: 'I accept the terms',
          onChanged: (value) => checked = value,
        ),
        variant: AppThemeVariant.neutral,
      ),
    );

    await tester.tap(find.text('I accept the terms'));
    await tester.pump();

    expect(checked, isTrue);
    expect(tester.takeException(), isNull);
  });

  testWidgets('indeterminate checkbox resolves to checked on tap', (tester) async {
    bool? checked;

    await tester.pumpWidget(
      inputHost(
        BaseCheckbox(
          value: false,
          isIndeterminate: true,
          label: 'Select all',
          onChanged: (value) => checked = value,
        ),
        variant: AppThemeVariant.rose,
      ),
    );

    await tester.tap(find.text('Select all'));
    await tester.pump();

    expect(checked, isTrue);
  });
}
