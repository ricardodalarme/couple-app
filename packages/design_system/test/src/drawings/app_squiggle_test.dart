import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/widget_host.dart';

void main() {
  testWidgets('renders highlighted text with the highlighted word', (tester) async {
    await tester.pumpWidget(
      themedHost(
        const AppHighlightedText(
          text: 'One calm thing',
          highlight: 'calm',
          style: TextStyle(fontSize: 26),
        ),
      ),
    );

    expect(find.byType(AppHighlightedText), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
