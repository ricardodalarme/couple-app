import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/forms/discard_changes.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/quick_slip/cubit/quick_slip_cubit.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/quick_slip/quick_slip_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockSlipRepository() extends Mock implements SlipRepository;

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  testWidgets('an unsaved quick slip is guarded before leaving', (tester) async {
    final repository = _MockSlipRepository();
    when(() => repository.readDraft(any())).thenReturn(null);
    when(
      () => repository.saveDraft(
        text: any(named: 'text'),
        now: any(named: 'now'),
        category: any(named: 'category'),
      ),
    ).thenAnswer((_) async {});
    final cubit = QuickSlipCubit(slipRepository: repository)
      ..start()
      ..onTextChanged('Fez café');
    addTearDown(cubit.close);

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const QuickSlipPage()));
    await tester.pump();

    expect(tester.widget<DirtyFormGuard>(find.byType(DirtyFormGuard)).isDirty, isTrue);
  });
}
