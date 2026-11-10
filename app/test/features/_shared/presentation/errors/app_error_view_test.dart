import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/errors/app_error_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network/network.dart';

import '../../../../test_helpers/pump_app.dart';

void main() {
  testWidgets('a network failure explains the connection and retries with backoff', (tester) async {
    var retries = 0;
    await tester.pumpApp(
      AppErrorView(
        exception: const LocalizedException(l10nKey: networkErrorCode),
        onRetry: () => retries++,
      ),
    );

    expect(find.text('Sem conexão'), findsOneWidget);

    await tester.tap(find.text('Tentar de novo'));
    await tester.pump();

    expect(retries, 1);
    expect(find.text('Tentar em 1s'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('an unknown failure uses the generic copy', (tester) async {
    await tester.pumpApp(AppErrorView(exception: const UnknownException(), onRetry: () {}));

    expect(find.text('Não deu certo'), findsOneWidget);
  });
}
