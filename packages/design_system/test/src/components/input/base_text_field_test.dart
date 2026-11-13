import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/widget_host.dart';

Widget _gallery() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      BaseTextField(
        label: 'Your name',
        hint: 'Marina',
        helpText: 'This is how your partner sees you.',
        leadingIcon: AppIcons.user_filled,
        onChanged: (_) {},
      ),
      const SizedBox(height: AppSpace.s16),
      const BaseTextField(
        label: 'E-mail',
        hint: 'you@example.com',
        errorText: 'That e-mail looks incomplete.',
        type: BaseTextFieldType.email,
      ),
      const SizedBox(height: AppSpace.s16),
      const BaseTextField(label: 'Invite code', hint: 'AB7K', type: BaseTextFieldType.inviteCode),
      const SizedBox(height: AppSpace.s16),
      const BaseTextField(
        label: 'Password',
        hint: 'At least 8 characters',
        type: BaseTextFieldType.password,
      ),
    ],
  );
}

void main() {
  for (final variant in AppThemeVariant.values) {
    for (final scale in [1.0, 2.0]) {
      testWidgets('text fields render in ${variant.name} at ${scale}x', (tester) async {
        await tester.pumpWidget(inputHost(_gallery(), variant: variant, textScale: scale));
        await tester.pump();

        expect(find.byType(BaseTextField), findsNWidgets(4));
        expect(tester.takeException(), isNull);
      });
    }
  }

  testWidgets('text field focuses and announces its error', (tester) async {
    await tester.pumpWidget(
      inputHost(
        BaseTextField(
          label: 'E-mail',
          errorText: 'That e-mail looks incomplete.',
          onChanged: (_) {},
        ),
        variant: AppThemeVariant.rose,
      ),
    );

    await tester.tap(find.byType(TextField));
    await tester.pump();

    expect(tester.widget<TextField>(find.byType(TextField)).focusNode?.hasFocus, isTrue);
    expect(find.text('That e-mail looks incomplete.'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('syncs text from the parent and reports edits', (tester) async {
    var value = 'Marina';

    await tester.pumpWidget(
      inputHost(
        StatefulBuilder(
          builder: (context, setState) => BaseTextField(
            text: value,
            label: 'Name',
            onChanged: (next) => setState(() => value = next),
          ),
        ),
        variant: AppThemeVariant.rose,
      ),
    );

    TextField field() => tester.widget<TextField>(find.byType(TextField));

    expect(field().controller?.text, 'Marina');

    await tester.enterText(find.byType(TextField), 'Marina K.');
    await tester.pump();

    expect(value, 'Marina K.');
    expect(field().controller?.text, 'Marina K.');
  });

  testWidgets('password field toggles visibility', (tester) async {
    await tester.pumpWidget(
      inputHost(
        BaseTextField(label: 'Password', type: BaseTextFieldType.password, onChanged: (_) {}),
        variant: AppThemeVariant.blue,
      ),
    );

    await tester.enterText(find.byType(TextField), 'secret');
    await tester.pump();

    expect(tester.widget<EditableText>(find.byType(EditableText)).obscureText, isTrue);

    await tester.tap(find.byIcon(AppIcons.eye));
    await tester.pump();

    expect(tester.widget<EditableText>(find.byType(EditableText)).obscureText, isFalse);
    expect(find.byIcon(AppIcons.eye_off), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('a rebuild that repeats the same text keeps what was typed', (tester) async {
    Widget host({required String text, String? error}) => inputHost(
      SizedBox(width: 350, child: BaseTextField(text: text, errorText: error)),
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
