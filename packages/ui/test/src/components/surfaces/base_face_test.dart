import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

void main() {
  testWidgets('renders a face', (tester) async {
    await tester.pumpWidget(themedHost(const BaseFace(kind: FaceKind.affectionate)));

    expect(find.byType(BaseFace), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
