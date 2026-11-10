import 'package:common_ui/common_ui.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _host(Widget child) {
  return BaseApp(theme: AppTheme.light(AppThemeVariant.rose), home: child);
}

void main() {
  testWidgets('InfiniteListView builds items and requests the next page', (tester) async {
    var fetched = 0;

    await tester.pumpWidget(
      _host(
        SizedBox(
          height: 400,
          child: InfiniteListView(
            itemCount: 3,
            onFetchData: () => fetched++,
            hasNextPage: true,
            isLoading: false,
            itemBuilder: (context, index) => Text('Item $index'),
          ),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('Item 2'), findsOneWidget);
    expect(fetched, 1);
  });

  testWidgets('InfiniteListView shows a loading footer', (tester) async {
    await tester.pumpWidget(
      _host(
        SizedBox(
          height: 400,
          child: InfiniteListView(
            itemCount: 2,
            onFetchData: () {},
            hasNextPage: true,
            isLoading: true,
            itemBuilder: (context, index) => Text('Item $index'),
          ),
        ),
      ),
    );

    expect(find.byType(BaseLoadingDots), findsOneWidget);
  });

  testWidgets('uses emptyBuilder and the controller for an empty list', (tester) async {
    final controller = ScrollController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _host(
        SizedBox(
          height: 400,
          child: InfiniteListView(
            itemCount: 0,
            onFetchData: () {},
            hasNextPage: false,
            isLoading: false,
            controller: controller,
            emptyBuilder: (_) => const Text('Empty'),
            itemBuilder: (context, index) => Text('Item $index'),
          ),
        ),
      ),
    );

    expect(find.text('Empty'), findsOneWidget);
    expect(controller.hasClients, isTrue);
  });
}
