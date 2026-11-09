import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../helpers/widget_host.dart';

void main() {
  testWidgets('renders an icon at the requested size', (tester) async {
    await tester.pumpWidget(themedHost(const AppIcon(icon: AppIcons.heart_filled, size: 22)));

    expect(find.byType(AppIcon), findsOneWidget);
    expect(tester.widget<AppIcon>(find.byType(AppIcon)).size, 22);
    expect(tester.takeException(), isNull);
  });
}
