import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('provides the page scaffold, background and safe area', (tester) async {
    await tester.pumpWidget(
      BaseApp(
        theme: AppTheme.light(AppThemeVariant.rose),
        home: const BaseView(body: Text('Page')),
      ),
    );

    expect(find.text('Page'), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SafeArea), findsOneWidget);

    final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
    expect(scaffold.backgroundColor, AppColors.rose.bgScreen);
  });

  testWidgets('can skip the safe area', (tester) async {
    await tester.pumpWidget(
      BaseApp(
        theme: AppTheme.light(AppThemeVariant.rose),
        home: const BaseView(hasSafeArea: false, body: Text('Page')),
      ),
    );

    expect(find.byType(SafeArea), findsNothing);
  });

  testWidgets('adds a back button when the enclosing route can pop', (tester) async {
    await tester.pumpWidget(
      BaseApp(
        theme: AppTheme.light(AppThemeVariant.rose),
        home: BaseView(
          body: Builder(
            builder: (context) => Center(
              child: BaseButton.primary(
                text: 'Open',
                onPressed: () => Navigator.of(context).push(
                  PageRouteBuilder<void>(
                    pageBuilder: (_, _, _) => const BaseView(body: Text('Detail page')),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.byIcon(AppIcons.chevron_left), findsOneWidget);

    await tester.tap(find.byIcon(AppIcons.chevron_left));
    await tester.pumpAndSettle();

    expect(find.text('Detail page'), findsNothing);
    expect(find.text('Open'), findsOneWidget);
  });

  testWidgets('uses a bare BaseAppBar by default', (tester) async {
    await tester.pumpWidget(
      BaseApp(
        theme: AppTheme.light(AppThemeVariant.rose),
        home: const BaseView(body: Text('Page')),
      ),
    );

    expect(find.byType(BaseAppBar), findsOneWidget);
    expect(find.byIcon(AppIcons.chevron_left), findsNothing);
  });

  testWidgets('appBar: null removes the header', (tester) async {
    await tester.pumpWidget(
      BaseApp(
        theme: AppTheme.light(AppThemeVariant.rose),
        home: const BaseView(appBar: null, body: Text('Page')),
      ),
    );

    expect(find.byType(BaseAppBar), findsNothing);
  });

  testWidgets('does not add a back button on a root route', (tester) async {
    await tester.pumpWidget(
      BaseApp(
        theme: AppTheme.light(AppThemeVariant.rose),
        home: const BaseView(
          appBar: BaseAppBar(title: 'Home'),
          body: Text('Home'),
        ),
      ),
    );

    expect(find.byIcon(AppIcons.chevron_left), findsNothing);
  });

  testWidgets('keeps an explicit onBack', (tester) async {
    var backs = 0;

    await tester.pumpWidget(
      BaseApp(
        theme: AppTheme.light(AppThemeVariant.rose),
        home: BaseView(
          appBar: BaseAppBar(title: 'Home', onBack: () => backs++),
          body: const Text('Home'),
        ),
      ),
    );

    await tester.tap(find.byIcon(AppIcons.chevron_left));

    expect(backs, 1);
  });
}
