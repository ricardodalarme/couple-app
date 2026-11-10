import 'package:flutter_bloc_starter/features/today/presentation/today/widgets/partner_unpaired_notice.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test_helpers/pump_app.dart';

void main() {
  testWidgets('the calm notice names the person and confirms once', (tester) async {
    var confirmed = 0;
    await tester.pumpApp(PartnerUnpairedNotice(partnerName: 'Marina', onOk: () => confirmed++));

    expect(find.textContaining('A Marina'), findsOneWidget);

    await tester.tap(find.text('Ok'));
    await tester.pump();

    expect(confirmed, 1);
  });

  testWidgets('without a stored name the notice stays neutral', (tester) async {
    await tester.pumpApp(PartnerUnpairedNotice(onOk: () {}));

    expect(find.textContaining('desvinculou'), findsOneWidget);
    expect(find.textContaining('Marina'), findsNothing);
  });
}
