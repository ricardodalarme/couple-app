import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/forms/discard_changes.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_helpers/pump_app.dart';

class const _Host({final bool isDirty = true}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Center(
        child: BaseButton(
          text: 'open',
          onPressed: () => Navigator.of(context)
              .push(PageRouteBuilder<void>(pageBuilder: (_, _, _) => _DirtyPage(isDirty: isDirty))),
        ),
      ),
    );
  }
}

class const _DirtyPage({final bool isDirty = true}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: DirtyFormGuard(
        isDirty: isDirty,
        title: context.l10n.common.discardTitle,
        text: context.l10n.common.discardText,
        child: Center(
          child: BaseButton(text: 'leave', onPressed: () => Navigator.of(context).maybePop()),
        ),
      ),
    );
  }
}

void main() {
  setUp(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  testWidgets('a dirty form asks before leaving and keeps writing on cancel', (tester) async {
    await tester.pumpApp(const _Host());
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('leave'));
    await tester.pumpAndSettle();

    expect(find.text('Descartar as alterações?'), findsOneWidget);
    expect(find.text('O que você escreveu não será salvo.'), findsOneWidget);

    await tester.tap(find.text('Continuar escrevendo'));
    await tester.pumpAndSettle();

    expect(find.text('leave'), findsOneWidget);

    await tester.tap(find.text('leave'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Descartar'));
    await tester.pumpAndSettle();

    expect(find.text('open'), findsOneWidget);
  });

  testWidgets('a clean form leaves without asking', (tester) async {
    await tester.pumpApp(const _Host(isDirty: false));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('leave'));
    await tester.pumpAndSettle();

    expect(find.text('open'), findsOneWidget);
    expect(find.text('Descartar as alterações?'), findsNothing);
  });
}
