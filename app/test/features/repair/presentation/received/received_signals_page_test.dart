import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/received_signal.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/received/cubit/received_signals_cubit.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/received/received_signals_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockRepairRepository() extends Mock implements RepairRepository {}

class _MockProfileRepository() extends Mock implements ProfileRepository {}

class _MockRemindersRepository() extends Mock implements RemindersRepository {}

class _MockSyncService() extends Mock implements ReminderSyncService {}

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  setUpAll(() => registerFallbackValue(DateTime(2026)));

  testWidgets('a saudade nudge shows its message and a way to suggest a plan', (tester) async {
    final repair = _MockRepairRepository();
    final profile = _MockProfileRepository();
    final reminders = _MockRemindersRepository();
    final sync = _MockSyncService();
    when(
      () => profile.getMyProfile(),
    ).thenAnswer((_) async => const Profile(id: 'me', avatarKind: 'initials', displayName: 'Ana'));
    when(() => repair.getReceivedSignals('me')).thenAnswer(
      (_) async => [ReceivedSignal(id: 's1', kind: 'miss_us', createdAt: DateTime(2026, 11, 10))],
    );

    final cubit = ReceivedSignalsCubit(
      repairRepository: repair,
      profileRepository: profile,
      remindersRepository: reminders,
      syncService: sync,
    );
    addTearDown(cubit.close);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const ReceivedSignalsPage()));
    await tester.pumpAndSettle();

    expect(find.text('SAUDADE'), findsOneWidget);
    expect(find.text('Seu par está com saudade de vocês.'), findsOneWidget);
    expect(find.text('Entendi'), findsOneWidget);
    expect(find.text('Sugerir um plano pequeno'), findsOneWidget);
  });
}
