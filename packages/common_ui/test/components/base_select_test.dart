import 'package:common_ui/src/components/base_select.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('BaseSelect', () {
    const options = [
      BaseSelectOption(value: 'a', label: 'Option A'),
      BaseSelectOption(value: 'b', label: 'Option B', subtitle: 'The second one'),
    ];

    testWidgets('renders the placeholder when nothing is selected', (tester) async {
      await tester.pumpApp(
        BaseSelect<String>(
          label: 'Choice',
          options: options,
          value: null,
          placeholder: 'Pick one',
          onChanged: (_) {},
        ),
      );
      await tester.pump();

      expect(find.text('Choice'), findsOneWidget);
      expect(find.text('Pick one'), findsOneWidget);
    });

    testWidgets('renders the selected label', (tester) async {
      await tester.pumpApp(
        BaseSelect<String>(label: 'Choice', options: options, value: 'b', onChanged: (_) {}),
      );
      await tester.pump();

      expect(find.text('Option B'), findsOneWidget);
    });

    testWidgets('picks an option from the sheet', (tester) async {
      String? picked;

      await tester.pumpApp(
        BaseSelect<String>(
          label: 'Choice',
          options: options,
          value: null,
          placeholder: 'Pick one',
          sheetTitle: 'Choose',
          onChanged: (value) => picked = value,
        ),
      );
      await tester.tap(find.text('Pick one'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Option A'));
      await tester.pumpAndSettle();

      expect(picked, 'a');
    });

    testWidgets('renders the error text', (tester) async {
      await tester.pumpApp(
        BaseSelect<String>(
          label: 'Choice',
          options: options,
          value: null,
          errorText: 'Required',
          onChanged: (_) {},
        ),
      );
      await tester.pump();

      expect(find.text('Required'), findsOneWidget);
    });
  });
}
