import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/discreet_mode_values.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/discreet_repository.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/discreet/cubit/discreet_mode_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/discreet/discreet_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockDiscreetRepository() extends Mock implements DiscreetRepository;

void main() {
  setUp(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  setUpAll(() => registerFallbackValue(true));

  testWidgets('a discreet switch turns on and off again from the row', (tester) async {
    final repository = _MockDiscreetRepository();
    when(() => repository.local).thenReturn(const DiscreetModeValues());
    when(() => repository.setNeutralNotifications(value: any(named: 'value')))
        .thenAnswer((_) async {});
    when(() => repository.setNeutralIcon(value: any(named: 'value'))).thenAnswer((_) async {});
    when(() => repository.setHideWidgetText(value: any(named: 'value'))).thenAnswer((_) async {});
    final cubit = DiscreetModeCubit(repository: repository);
    addTearDown(cubit.close);

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const DiscreetModePage()));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(BaseSwitch).first);
    await tester.pumpAndSettle();
    expect(cubit.state.values.neutralIcon, isTrue);

    await tester.tap(find.text('Ícone neutro'));
    await tester.pumpAndSettle();

    expect(cubit.state.values.neutralIcon, isFalse);
    expect(tester.widget<BaseSwitch>(find.byType(BaseSwitch).first).value, isFalse);
  });
}
