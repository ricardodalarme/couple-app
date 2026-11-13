import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/dates/data/models/dates_models.dart';
import 'package:flutter_bloc_starter/features/dates/data/repositories/dates_repository.dart';
import 'package:flutter_bloc_starter/features/dates/presentation/dates/cubit/dates_cubit.dart';
import 'package:flutter_bloc_starter/features/dates/presentation/dates/dates_page.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockDatesRepository() extends Mock implements DatesRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  late DatesRepository repository;
  late ProfileRepository profile;

  setUp(() {
    repository = _MockDatesRepository();
    profile = _MockProfileRepository();
    when(() => repository.getDates()).thenAnswer((_) async => const []);
    when(() => repository.getGiftIdeas()).thenAnswer((_) async => const []);
    when(() => repository.getHolidays(any())).thenAnswer((_) async => const []);
    when(() => profile.getMySettings())
        .thenAnswer((_) async => const AccountSettings(theme: .rose));
    when(() => repository.deleteDate(any())).thenAnswer((_) async {});
  });

  Future<DatesCubit> build() async {
    final cubit = DatesCubit(datesRepository: repository, profileRepository: profile);
    addTearDown(cubit.close);
    await cubit.load();

    return cubit;
  }

  testWidgets('deleting a date asks before removing it', (tester) async {
    when(() => repository.getDates()).thenAnswer(
      (_) async => const [
        ImportantDate(id: 'd1', title: 'Aniversário', kind: 'birthday', month: 5, day: 12),
      ],
    );
    final cubit = await build();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const DatesPage()));
    await tester.pump();

    await tester.ensureVisible(find.text('Apagar'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Apagar'));
    await tester.pumpAndSettle();

    expect(find.text('Apagar esta data?'), findsOneWidget);
    verifyNever(() => repository.deleteDate(any()));

    await tester.tap(
      find.descendant(of: find.byType(BaseConfirmSheet), matching: find.text('Apagar')),
    );
    await tester.pumpAndSettle();

    verify(() => repository.deleteDate('d1')).called(1);
  });
}
