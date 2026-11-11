import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/mood/presentation/mood/widgets/mood_row.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test_helpers/pump_app.dart';

void main() {
  testWidgets('reports the tapped face by index', (tester) async {
    int? selected;

    await tester.pumpApp(
      MoodRow(
        title: 'Como você está hoje?',
        options: const [
          MoodRowOption(face: FaceKind.good, label: 'Feliz'),
          MoodRowOption(face: FaceKind.sad, label: 'Triste'),
        ],
        onSelected: (index) => selected = index,
      ),
    );

    await tester.tap(find.text('Triste'));
    await tester.pump();

    expect(selected, 1);
    expect(find.byType(BaseFace), findsNWidgets(2));
  });
}
