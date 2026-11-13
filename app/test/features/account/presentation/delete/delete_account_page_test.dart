import 'package:biometric_service/biometric_service.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/account/data/repositories/account_repository.dart';
import 'package:flutter_bloc_starter/features/account/presentation/delete/cubit/delete_account_cubit.dart';
import 'package:flutter_bloc_starter/features/account/presentation/delete/delete_account_page.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockAccountRepository() extends Mock implements AccountRepository;

class _MockPairingRepository() extends Mock implements PairingRepository;

class _MockBiometricService() extends Mock implements BiometricService;

void main() {
  setUp(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  testWidgets('offers the delete action and asks before deleting', (tester) async {
    final account = _MockAccountRepository();
    final pairing = _MockPairingRepository();
    final biometric = _MockBiometricService();
    when(account.getDeletion).thenAnswer((_) async => null);
    when(pairing.getPartner).thenAnswer((_) async => null);

    final cubit = DeleteAccountCubit(
      repository: account,
      pairingRepository: pairing,
      biometricService: biometric,
    );
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const DeleteAccountPage()));
    await tester.pumpAndSettle();

    final action = find.widgetWithText(BaseButton, 'Apagar conta');
    expect(action, findsOneWidget);

    await tester.tap(action);
    await tester.pumpAndSettle();

    expect(find.text('Apagar sua conta?'), findsOneWidget);
  });
}
