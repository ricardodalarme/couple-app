import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/widget_host.dart';

Widget _gallery() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      BaseTextArea(hint: 'One line is enough.'),
      SizedBox(height: AppSpace.s16),
      BaseTextArea(hasError: true, errorText: 'Could not save. Try again.'),
    ],
  );
}

Widget _materialFreeHost(Widget child) {
  return AppThemed(
    variant: AppThemeVariant.rose,
    child: MediaQuery(
      data: const MediaQueryData(size: Size(390, 844)),
      child: Directionality(textDirection: TextDirection.ltr, child: child),
    ),
  );
}

void main() {
  for (final variant in AppThemeVariant.values) {
    for (final scale in [1.0, 2.0]) {
      testWidgets('text areas render in ${variant.name} at ${scale}x', (tester) async {
        await tester.pumpWidget(inputHost(_gallery(), variant: variant, textScale: scale));
        await tester.pump();

        expect(find.byType(BaseTextArea), findsNWidgets(2));
        expect(tester.takeException(), isNull);
      });
    }
  }

  testWidgets('big field keeps its minimum height and delays the counter', (tester) async {
    Widget area(String text) {
      return inputHost(
        SizedBox(width: 350, child: BaseTextArea(text: text)),
        variant: AppThemeVariant.rose,
      );
    }

    await tester.pumpWidget(area(''));

    expect(tester.getSize(find.byType(TextField)).height, greaterThanOrEqualTo(150));

    await tester.pumpWidget(area('a' * 100));
    await tester.pump();
    expect(find.text('100/140'), findsNothing);

    await tester.pumpWidget(area('a' * 112));
    await tester.pump();
    expect(find.text('112/140'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the text area renders without an ancestor Material', (tester) async {
    await tester.pumpWidget(_materialFreeHost(const BaseTextArea(hint: 'Write a line')));

    expect(find.byType(BaseTextArea), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('an errorText alone renders the message and the error border', (tester) async {
    await tester.pumpWidget(
      inputHost(
        const SizedBox(
          width: 350,
          child: BaseTextArea(hint: 'Write a line', errorText: 'Write something first.'),
        ),
        variant: AppThemeVariant.rose,
      ),
    );

    expect(find.text('Write something first.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('a rebuild that repeats the same text keeps what was typed', (tester) async {
    Widget host({required String text, String? error}) => inputHost(
      SizedBox(width: 350, child: BaseTextArea(text: text, errorText: error)),
      variant: AppThemeVariant.rose,
    );

    await tester.pumpWidget(host(text: ''));
    await tester.enterText(find.byType(TextField), 'hello');
    await tester.pumpWidget(host(text: '', error: 'Required'));
    await tester.pump();

    expect(tester.widget<TextField>(find.byType(TextField)).controller?.text, 'hello');
    expect(tester.takeException(), isNull);
  });
}
