import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

Widget _host(AppThemeVariant variant, Widget child, {double textScale = 1}) {
  return AppThemeHost(
    initialVariant: variant,
    child: MediaQuery(
      data: MediaQueryData(textScaler: TextScaler.linear(textScale)),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: SizedBox(
            width: 390,
            child: SingleChildScrollView(padding: const EdgeInsets.all(AppSpace.s20), child: child),
          ),
        ),
      ),
    ),
  );
}

Widget _showcase() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      BaseListCard(
        categoryLabel: 'Idea of the day',
        title: 'Leave a note inside his backpack.',
        supportText: '2 minutes · free',
        face: FaceKind.smile,
        onTap: () {},
      ),
      const SizedBox(height: AppSpace.cardGap),
      BaseListCard(
        categoryLabel: 'Anniversary',
        title: 'Faltam 12 dias.',
        category: AppCategory.dates,
        supportText: 'Want gift ideas?',
        trailing: const BaseTag(text: 'Open'),
        onTap: () {},
      ),
      const SizedBox(height: AppSpace.cardGap),
      BaseListCard(
        categoryLabel: 'Invite',
        title: 'Your space already works. The other person joins whenever.',
        category: AppCategory.invite,
        face: FaceKind.smile,
        onTap: () {},
      ),
    ],
  );
}

void main() {
  for (final variant in AppThemeVariant.values) {
    testWidgets('renders every list card in ${variant.name}', (tester) async {
      await tester.pumpWidget(_host(variant, _showcase()));

      expect(find.byType(BaseListCard), findsNWidgets(3));
      expect(find.text('Faltam 12 dias.'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('list cards grow at 200% text scale in ${variant.name}', (tester) async {
      await tester.pumpWidget(_host(variant, _showcase(), textScale: 2));

      expect(find.byType(BaseListCard), findsNWidgets(3));
      expect(tester.takeException(), isNull);
    });
  }
}
