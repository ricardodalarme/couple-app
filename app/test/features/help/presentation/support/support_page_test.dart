import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/help/presentation/support/cubit/support_cubit.dart';
import 'package:flutter_bloc_starter/features/help/presentation/support/support_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockSupportCubit() extends Mock implements SupportCubit;

class const _Host({required final SupportCubit cubit}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Center(
        child: BaseButton(
          text: 'open',
          onPressed: () => Navigator.of(context).push(
            PageRouteBuilder<void>(
              pageBuilder: (_, _, _) =>
                  BlocProvider.value(value: cubit, child: const SupportPage()),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  setUp(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  Future<void> pumpSteps(WidgetTester tester) async {
    for (var i = 0; i < 6; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  testWidgets('a send in flight leaves without the discard prompt', (tester) async {
    final cubit = _MockSupportCubit();
    when(() => cubit.state)
        .thenReturn(const SupportState(message: FormInput('Oi'), sendAction: Loading()));
    when(() => cubit.stream).thenAnswer((_) => const Stream.empty());

    await tester.pumpApp(_Host(cubit: cubit));
    await tester.tap(find.text('open'));
    await pumpSteps(tester);

    final context = tester.element(find.byType(SupportPage));
    await Navigator.of(context).maybePop();
    await pumpSteps(tester);

    expect(find.text('open'), findsOneWidget);
    expect(find.text('Descartar esta mensagem?'), findsNothing);
  });
}
