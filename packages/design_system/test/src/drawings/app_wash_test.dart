import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/widget_host.dart';

void main() {
  testWidgets('renders the wash surface inside a card ring', (tester) async {
    await tester.pumpWidget(
      themedHost(
        const AppCardRing(
          child: AppWashSurface(
            wash: AppWash.hero,
            padding: EdgeInsets.all(22),
            child: Text('Card'),
          ),
        ),
      ),
    );

    expect(find.text('Card'), findsOneWidget);
    expect(find.byType(AppWashSurface), findsOneWidget);
    expect(find.byType(AppCardRing), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
