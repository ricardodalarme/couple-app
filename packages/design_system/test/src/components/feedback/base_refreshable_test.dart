import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

double _ringProgress(WidgetTester tester) {
  final paint = tester.widget<CustomPaint>(
    find.descendant(
      of: find.byKey(const ValueKey('baseRefreshableIndicator')),
      matching: find.byType(CustomPaint),
    ),
  );

  return (paint.painter as dynamic).progress as double;
}

void main() {
  testWidgets('shows the ring and calls onRefresh after a pull', (tester) async {
    var refreshed = 0;

    await tester.pumpWidget(
      BaseApp(
        theme: AppTheme.light(AppThemeVariant.rose),
        home: Scaffold(
          body: SizedBox(
            height: 400,
            child: BaseRefreshable(
              onRefresh: () async => refreshed++,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (_, index) => SizedBox(height: 40, child: Text('$index')),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.drag(find.byType(ListView), const Offset(0, 300));
    await tester.pump();

    expect(find.byKey(const ValueKey('baseRefreshableIndicator')), findsOneWidget);

    await tester.pump(const Duration(seconds: 1));
    expect(refreshed, 1);
    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets('animates the ring while refreshing', (tester) async {
    final refresh = Completer<void>();

    await tester.pumpWidget(
      BaseApp(
        theme: AppTheme.light(AppThemeVariant.rose),
        home: Scaffold(
          body: SizedBox(
            height: 400,
            child: BaseRefreshable(
              onRefresh: () => refresh.future,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (_, index) => SizedBox(height: 40, child: Text('$index')),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.drag(find.byType(ListView), const Offset(0, 300));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 250));

    final first = _ringProgress(tester);
    await tester.pump(const Duration(milliseconds: 250));
    final second = _ringProgress(tester);

    expect(second, isNot(first));

    refresh.complete();
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets('does not show the indicator while scrolling the list from the top', (tester) async {
    await tester.pumpWidget(
      BaseApp(
        theme: AppTheme.light(AppThemeVariant.rose),
        home: Scaffold(
          body: SizedBox(
            height: 400,
            child: BaseRefreshable(
              onRefresh: () async {},
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (_, index) => SizedBox(height: 40, child: Text('$index')),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.drag(find.byType(ListView), const Offset(0, -200));
    await tester.pump();

    expect(find.byKey(const ValueKey('baseRefreshableIndicator')), findsNothing);
  });
}
