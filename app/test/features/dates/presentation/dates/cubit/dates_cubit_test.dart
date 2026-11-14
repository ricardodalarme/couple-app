import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/dates/data/models/dates_models.dart';
import 'package:flutter_bloc_starter/features/dates/data/models/important_date_kind.dart';
import 'package:flutter_bloc_starter/features/dates/data/repositories/dates_repository.dart';
import 'package:flutter_bloc_starter/features/dates/presentation/dates/cubit/dates_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';

class _MockDatesRepository() extends Mock implements DatesRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

void main() {
  late DatesRepository repository;
  late ProfileRepository profile;

  const holiday = Holiday(slug: 'valentines', title: 'Dia dos Namorados', month: 6, day: 12);

  setUp(() {
    repository = _MockDatesRepository();
    profile = _MockProfileRepository();
    when(() => repository.getDates()).thenAnswer((_) async => const []);
    when(() => repository.getGiftIdeas()).thenAnswer((_) async => const []);
    when(() => repository.getHolidays(any())).thenAnswer((_) async => [holiday]);
    when(() => profile.getMySettings())
        .thenAnswer((_) async => const AccountSettings(theme: .rose));
    when(
      () => repository.addDate(
        id: any(named: 'id'),
        title: any(named: 'title'),
        kind: any(named: 'kind'),
        month: any(named: 'month'),
        day: any(named: 'day'),
        year: any(named: 'year'),
        isYearly: any(named: 'isYearly'),
        holidayKey: any(named: 'holidayKey'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => repository.addGiftIdea(
        id: any(named: 'id'),
        title: any(named: 'title'),
      ),
    ).thenAnswer((_) async {});
  });

  DatesCubit build() => DatesCubit(datesRepository: repository, profileRepository: profile);

  group('isValidMonthDay', () {
    test('February 29 is allowed because the date repeats yearly', () {
      expect(isValidMonthDay(2, 29), isTrue);
    });

    test('impossible days are rejected', () {
      expect(isValidMonthDay(2, 30), isFalse);
      expect(isValidMonthDay(4, 31), isFalse);
      expect(isValidMonthDay(13, 1), isFalse);
    });
  });

  test('saving validates the name, the month, the day and the year', () async {
    final cubit = build()..onTitleChanged('Aniversário');

    await cubit.saveDate();
    expect(cubit.state.title.isValid, isTrue);
    expect(cubit.state.month, isNull);
    verifyNever(
      () => repository.addDate(
        id: any(named: 'id'),
        title: any(named: 'title'),
        kind: any(named: 'kind'),
        month: any(named: 'month'),
        day: any(named: 'day'),
        year: any(named: 'year'),
        isYearly: any(named: 'isYearly'),
        holidayKey: any(named: 'holidayKey'),
      ),
    );

    cubit
      ..onMonthChosen(5)
      ..onDayChosen(12);
    await cubit.saveDate();

    verify(
      () => repository.addDate(
        id: any(named: 'id'),
        title: 'Aniversário',
        kind: ImportantDateKind.birthday,
        month: 5,
        day: 12,
        year: null,
        isYearly: true,
        holidayKey: null,
      ),
    ).called(1);
  });

  test('an empty name is reported as a field error', () async {
    final cubit = build()
      ..onMonthChosen(5)
      ..onDayChosen(12);

    await cubit.saveDate();

    expect(cubit.state.title.error, NonEmptyValidationError.empty);
  });

  test('a year outside 1900 to 2200 is rejected before saving', () async {
    final cubit = build()
      ..onTitleChanged('Aniversário')
      ..onMonthChosen(5)
      ..onDayChosen(12)
      ..onYearChanged('19');

    await cubit.saveDate();

    expect(cubit.state.year.error, PatternValidationError.invalid);
    verifyNever(
      () => repository.addDate(
        id: any(named: 'id'),
        title: any(named: 'title'),
        kind: any(named: 'kind'),
        month: any(named: 'month'),
        day: any(named: 'day'),
        year: any(named: 'year'),
        isYearly: any(named: 'isYearly'),
        holidayKey: any(named: 'holidayKey'),
      ),
    );
  });

  test('saving without a year still repeats every year', () async {
    final cubit = build()
      ..onTitleChanged('Aniversário')
      ..onMonthChosen(5)
      ..onDayChosen(12);

    await cubit.saveDate();

    verify(
      () => repository.addDate(
        id: any(named: 'id'),
        title: 'Aniversário',
        kind: ImportantDateKind.birthday,
        month: 5,
        day: 12,
        year: null,
        isYearly: true,
        holidayKey: null,
      ),
    ).called(1);
    expect(cubit.state.title.value, '');
  });

  test('a reunion is saved as a single meeting, not a yearly date', () async {
    final cubit = build()
      ..onTitleChanged('Reencontro')
      ..onKindChosen(ImportantDateKind.reunion)
      ..onMonthChosen(12)
      ..onDayChosen(23)
      ..onYearChanged('2026');

    await cubit.saveDate();

    verify(
      () => repository.addDate(
        id: any(named: 'id'),
        title: 'Reencontro',
        kind: ImportantDateKind.reunion,
        month: 12,
        day: 23,
        year: 2026,
        isYearly: false,
        holidayKey: null,
      ),
    ).called(1);
  });

  test('load reads dates, gift ideas and the holiday calendar', () async {
    final cubit = build();

    await cubit.load();

    expect((cubit.state.holidays as Success<List<Holiday>>).value, [holiday]);
    expect(cubit.state.dates, isA<Success<List<ImportantDate>>>());
    expect(cubit.state.gifts, isA<Success<List<GiftIdea>>>());
  });

  test('adding a holiday keeps its key', () async {
    final cubit = build();

    await cubit.addHoliday(holiday);

    verify(
      () => repository.addDate(
        id: any(named: 'id'),
        title: 'Dia dos Namorados',
        kind: ImportantDateKind.holiday,
        month: 6,
        day: 12,
        year: any(named: 'year'),
        isYearly: any(named: 'isYearly'),
        holidayKey: 'valentines',
      ),
    ).called(1);
  });

  test('an empty gift idea is not added', () async {
    final cubit = build()..onGiftTitleChanged('  ');

    await cubit.addGift();

    expect(cubit.state.giftTitle.error, NonEmptyValidationError.empty);
    verifyNever(
      () => repository.addGiftIdea(
        id: any(named: 'id'),
        title: any(named: 'title'),
      ),
    );
  });

  test('a gift idea over the limit is reported instead of ignored', () async {
    final cubit = build()..onGiftTitleChanged('a' * (dateTitleMaxLength + 1));

    await cubit.addGift();

    expect(cubit.state.giftTitle.error, MaxLengthValidationError.tooLong);
    verifyNever(
      () => repository.addGiftIdea(
        id: any(named: 'id'),
        title: any(named: 'title'),
      ),
    );
  });

  test('a failed save keeps the typed date', () async {
    when(
      () => repository.addDate(
        id: any(named: 'id'),
        title: any(named: 'title'),
        kind: any(named: 'kind'),
        month: any(named: 'month'),
        day: any(named: 'day'),
        year: any(named: 'year'),
        isYearly: any(named: 'isYearly'),
        holidayKey: any(named: 'holidayKey'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build()
      ..onTitleChanged('Aniversário')
      ..onMonthChosen(5)
      ..onDayChosen(12);

    await cubit.saveDate();

    expect(cubit.state.title.value, 'Aniversário');
    expect(cubit.state.saveAction, isA<Initial>());
  });
}
