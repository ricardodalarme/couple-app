import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/forms/discard_changes.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slip_kind/cubit/slip_kind_cubit.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slip_kind/slip_kind_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockSlipRepository() extends Mock implements SlipRepository;

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  testWidgets('every slip type stays reachable from the detailed form', (tester) async {
    final cubit = SlipKindCubit(slipRepository: _MockSlipRepository())
      ..start(kind: 'specific', text: 'Fez café');
    addTearDown(cubit.close);

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const SlipKindPage()));
    await tester.pump();

    expect(find.text('Específico'), findsOneWidget);
    expect(find.text('Se… então'), findsOneWidget);
    expect(find.text('Invisível'), findsOneWidget);
    expect(find.text('Rápido'), findsOneWidget);
    expect(find.text('Preciso de…'), findsOneWidget);
    expect(tester.widget<DirtyFormGuard>(find.byType(DirtyFormGuard)).isDirty, isTrue);
  });

  testWidgets('focusing the if-then form scrolls the plan into view', (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 400));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    final cubit = SlipKindCubit(slipRepository: _MockSlipRepository())
      ..start(kind: 'if_then', text: 'Quando eu estiver cansada');
    addTearDown(cubit.close);

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const SlipKindPage()));
    await tester.pumpAndSettle();

    await tester.showKeyboard(find.byType(BaseTextArea));
    await tester.pumpAndSettle();

    final scrollable = tester.state<ScrollableState>(find.byType(Scrollable).first);
    expect(scrollable.position.pixels, greaterThan(0));
  });
}
