import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/account/data/repositories/account_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/safety/data/repositories/safe_mode_repository.dart';
import 'package:flutter_bloc_starter/features/safety/presentation/safe_mode/cubit/safe_mode_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/discreet_mode_values.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/discreet_repository.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/discreet/cubit/discreet_mode_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/home/cubit/settings_home_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/home/settings_home_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockPairingRepository() extends Mock implements PairingRepository;

class _MockPlusRepository() extends Mock implements PlusRepository;

class _MockNotificationsRepository() extends Mock implements NotificationsRepository;

class _MockAccountRepository() extends Mock implements AccountRepository;

class _MockDiscreetRepository() extends Mock implements DiscreetRepository;

class _MockSafeModeRepository() extends Mock implements SafeModeRepository;

class _MockSettingsRepository() extends Mock implements SettingsRepository;

void main() {
  setUp(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  setUpAll(() => registerFallbackValue(true));

  testWidgets('the discreet summary follows the live switches', (tester) async {
    final settingsRepository = _MockSettingsRepository();
    when(settingsRepository.get).thenReturn(const Settings.empty());
    AppInjector.instance.registerFactory<SettingsRepository>(() => settingsRepository);
    addTearDown(() => AppInjector.instance.unregister<SettingsRepository>());

    final home = SettingsHomeCubit(
      pairingRepository: _MockPairingRepository(),
      plusRepository: _MockPlusRepository(),
      notificationsRepository: _MockNotificationsRepository(),
      accountRepository: _MockAccountRepository(),
    );
    final safeModeRepository = _MockSafeModeRepository();
    when(() => safeModeRepository.isOn).thenReturn(false);
    final safeMode = SafeModeCubit(repository: safeModeRepository);
    final discreetRepository = _MockDiscreetRepository();
    when(() => discreetRepository.local).thenReturn(const DiscreetModeValues());
    when(() => discreetRepository.setNeutralIcon(value: any(named: 'value')))
        .thenAnswer((_) async {});
    final discreet = DiscreetModeCubit(repository: discreetRepository);
    addTearDown(home.close);
    addTearDown(safeMode.close);
    addTearDown(discreet.close);

    await tester.pumpApp(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: home),
          BlocProvider.value(value: safeMode),
          BlocProvider.value(value: discreet),
        ],
        child: const SettingsHomePage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Desligado'), findsOneWidget);

    await discreet.setNeutralIcon(value: true);
    await tester.pumpAndSettle();

    expect(find.text('Ligado'), findsOneWidget);
  });
}
