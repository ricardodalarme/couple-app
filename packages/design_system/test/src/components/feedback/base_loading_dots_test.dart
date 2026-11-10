import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders and announces the loading label', (tester) async {
    final semantics = tester.ensureSemantics();

    await tester.pumpWidget(
      BaseApp(
        theme: AppTheme.light(AppThemeVariant.rose),
        home: const Center(child: BaseLoadingDots(semanticLabel: 'Loading')),
      ),
    );

    expect(find.bySemanticsLabel('Loading'), findsOneWidget);

    semantics.dispose();
  });
}
