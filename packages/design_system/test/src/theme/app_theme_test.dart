import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart' show Builder, Theme, ThemeData;

void main() {
  testWidgets('the colour extension throws when the theme is not installed', (tester) async {
    late BuildContext captured;

    await tester.pumpWidget(
      Theme(
        data: ThemeData(),
        child: Builder(
          builder: (context) {
            captured = context;
            return const SizedBox();
          },
        ),
      ),
    );

    expect(() => captured.colors, throwsA(isA<TypeError>()));
    expect(() => captured.text, throwsA(isA<TypeError>()));
  });
}
