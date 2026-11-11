import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _host(AppThemeVariant variant, Widget child, {double textScale = 1}) {
  return AppThemeHost(
    initialVariant: variant,
    child: MediaQuery(
      data: MediaQueryData(textScaler: TextScaler.linear(textScale)),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: SizedBox(width: 390, child: SingleChildScrollView(child: child)),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('draws one slip per filled count and caps at seven', (tester) async {
    await tester.pumpWidget(
      _host(
        AppThemeVariant.values.first,
        const BaseWeekStrip(title: '3 slips', supportText: 'Esta semana', filledCount: 3),
      ),
    );
    expect(find.byType(AppPaperSlip), findsNWidgets(3));

    await tester.pumpWidget(
      _host(AppThemeVariant.values.first, const BaseWeekStrip(title: 'Muitos', filledCount: 12)),
    );
    expect(find.byType(AppPaperSlip), findsNWidgets(7));
  });

  testWidgets('renders empty in every theme at 100% and 200%', (tester) async {
    for (final variant in AppThemeVariant.values) {
      for (final scale in [1.0, 2.0]) {
        await tester.pumpWidget(
          _host(
            variant,
            const BaseWeekStrip(title: 'Nenhum slip', supportText: 'Anote algo', filledCount: 0),
            textScale: scale,
          ),
        );
        expect(find.byType(AppPaperSlip), findsNothing);
        expect(tester.takeException(), isNull);
      }
    }
  });
}
