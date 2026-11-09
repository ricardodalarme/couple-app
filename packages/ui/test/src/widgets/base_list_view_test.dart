import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

Widget _host(Widget child) {
  return BaseApp(theme: AppTheme.light(AppThemeVariant.rose), home: child);
}

void main() {
  testWidgets('builds items and the empty state', (tester) async {
    final controller = ScrollController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _host(
        SizedBox(
          height: 400,
          child: BaseListView(
            itemCount: 0,
            controller: controller,
            emptyBuilder: (_) => const Text('Empty'),
            itemBuilder: (context, index) => Text('Item $index'),
          ),
        ),
      ),
    );

    expect(find.text('Empty'), findsOneWidget);
    expect(controller.hasClients, isTrue);

    await tester.pumpWidget(
      _host(
        SizedBox(
          height: 400,
          child: BaseListView(
            itemCount: 2,
            controller: controller,
            itemBuilder: (context, index) => Text('Item $index'),
            separator: const SizedBox(height: AppSpace.s8),
          ),
        ),
      ),
    );

    expect(find.text('Item 0'), findsOneWidget);
    expect(find.text('Item 1'), findsOneWidget);
  });
}
