import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

void main() {
  testWidgets('opens the sheet and reports the picked option', (tester) async {
    var value = 'week';

    await tester.pumpWidget(
      inputHost(
        StatefulBuilder(
          builder: (context, setState) => BaseSelect<String>(
            label: 'Frequency',
            value: value,
            options: const [
              BaseSelectOption(value: 'day', label: 'Every day'),
              BaseSelectOption(value: 'week', label: 'Every week'),
            ],
            onChanged: (next) => setState(() => value = next),
          ),
        ),
        variant: AppThemeVariant.rose,
      ),
    );

    expect(find.text('Frequency'), findsOneWidget);
    expect(find.text('Every week'), findsOneWidget);

    await tester.tap(find.text('Every week'));
    await tester.pumpAndSettle();

    expect(find.text('Every day'), findsOneWidget);
    await tester.tap(find.text('Every day'));
    await tester.pumpAndSettle();

    expect(value, 'day');
  });

  testWidgets('filters options when there are more than eight', (tester) async {
    final options = [
      for (var index = 0; index < 9; index++)
        BaseSelectOption(value: '$index', label: 'Option $index'),
    ];

    await tester.pumpWidget(
      inputHost(
        BaseSelect<String>(
          label: 'Choice',
          value: null,
          placeholder: 'Pick one',
          options: options,
          onChanged: (_) {},
        ),
        variant: AppThemeVariant.rose,
      ),
    );

    await tester.tap(find.text('Pick one'));
    await tester.pumpAndSettle();

    expect(find.byType(BaseTextField), findsOneWidget);

    await tester.enterText(find.byType(BaseTextField), 'Option 8');
    await tester.pump();

    expect(find.text('Option 8'), findsNWidgets(2));
    expect(find.text('Option 0'), findsNothing);
  });
}
