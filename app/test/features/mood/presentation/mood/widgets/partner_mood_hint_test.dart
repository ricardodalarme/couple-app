import 'package:flutter_bloc_starter/features/mood/data/models/mood_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/need_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/partner_mood.dart';
import 'package:flutter_bloc_starter/features/mood/presentation/mood/widgets/partner_mood_hint.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test_helpers/pump_app.dart';

void main() {
  final partnerMood = PartnerMood(
    day: DateTime(2026, 11, 10),
    mood: MoodKind.tired,
    need: NeedKind.hug,
  );

  testWidgets('discreet mode shows no partner, mood or note wording', (tester) async {
    await tester.pumpApp(
      PartnerMoodHint(partnerMood: partnerMood, partnerName: 'Marina', isDiscreet: true),
    );

    expect(find.textContaining('Marina'), findsNothing);
    expect(find.textContaining('energia'), findsNothing);
    expect(find.textContaining('abraço'), findsNothing);
    expect(find.textContaining('Humor'), findsNothing);
  });

  testWidgets('the shared mood opens the partner view when tapped', (tester) async {
    var taps = 0;
    await tester.pumpApp(
      PartnerMoodHint(
        partnerMood: partnerMood,
        partnerName: 'Marina',
        isDiscreet: false,
        onTap: () => taps++,
      ),
    );

    expect(find.textContaining('Marina está sem energia'), findsOneWidget);
    expect(find.textContaining('um abraço'), findsOneWidget);

    await tester.tap(find.textContaining('Marina está sem energia'));
    await tester.pump();

    expect(taps, 1);
  });
}
