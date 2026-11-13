import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/safety/data/repositories/safe_mode_repository.dart';
import 'package:flutter_bloc_starter/features/spice/data/data_sources/remote/spice_data_source.dart';
import 'package:flutter_bloc_starter/features/spice/data/repositories/spice_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockSpiceDataSource() extends Mock implements SpiceDataSource;

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockSafeModeRepository() extends Mock implements SafeModeRepository;

class _MockPlusRepository() extends Mock implements PlusRepository;

void main() {
  late SpiceDataSource dataSource;
  late ProfileRepository profile;
  late SafeModeRepository safeMode;
  late PlusRepository plus;
  late SpiceRepository repository;

  setUpAll(() => registerFallbackValue(''));

  setUp(() {
    dataSource = _MockSpiceDataSource();
    profile = _MockProfileRepository();
    safeMode = _MockSafeModeRepository();
    plus = _MockPlusRepository();
    repository = SpiceRepository(
      dataSource: dataSource,
      profileRepository: profile,
      safeModeRepository: safeMode,
      plusRepository: plus,
    );

    when(() => safeMode.isOn).thenReturn(false);
    when(() => plus.getPlus()).thenAnswer((_) async => const PlusState(hasPlus: true));
    when(profile.getMySettings).thenAnswer(
      (_) async => const AccountSettings(theme: .rose, profileId: 'p1', locale: 'pt-BR'),
    );
  });

  test('safe mode keeps the section hidden', () {
    when(() => safeMode.isOn).thenReturn(true);

    expect(repository.isHidden, isTrue);
  });

  test('a free person gets the Plus entry without reading cards', () async {
    when(() => plus.getPlus()).thenAnswer((_) async => const PlusState(hasPlus: false));

    final view = await repository.getView();

    expect(view.stage, SpiceStage.plusLocked);
    verifyNever(() => dataSource.getEnabled(any()));
    verifyNever(() => dataSource.getCards(any()));
  });

  test('a person who has not opted in sees the off stage without cards', () async {
    when(() => dataSource.getEnabled('p1')).thenAnswer((_) async => false);

    final view = await repository.getView();

    expect(view.stage, SpiceStage.off);
    verifyNever(() => dataSource.getCards(any()));
  });

  test('opted in without cards stays waiting', () async {
    when(() => dataSource.getEnabled('p1')).thenAnswer((_) async => true);
    when(() => dataSource.getCards('pt-BR')).thenAnswer((_) async => []);

    final view = await repository.getView();

    expect(view.stage, SpiceStage.waiting);
    expect(view.cards, isEmpty);
  });

  test('both opted in with cards is ready', () async {
    when(() => dataSource.getEnabled('p1')).thenAnswer((_) async => true);
    when(() => dataSource.getCards('pt-BR')).thenAnswer((_) async => ['Uma carta']);

    final view = await repository.getView();

    expect(view.stage, SpiceStage.ready);
    expect(view.cards, ['Uma carta']);
  });

  test('a change that matched no row is a failure', () async {
    when(
      () => dataSource.setEnabled(
        profileId: any(named: 'profileId'),
        enabled: any(named: 'enabled'),
      ),
    ).thenAnswer((_) async => 0);

    await expectLater(
      repository.setEnabled(enabled: true),
      throwsA(
        isA<LocalizedException>().having(
          (exception) => exception.l10nKey,
          'l10nKey',
          'UPDATE_FAILED',
        ),
      ),
    );
  });

  test('a change that matched the saved row succeeds', () async {
    when(
      () => dataSource.setEnabled(
        profileId: any(named: 'profileId'),
        enabled: any(named: 'enabled'),
      ),
    ).thenAnswer((_) async => 1);

    await repository.setEnabled(enabled: true);

    verify(() => dataSource.setEnabled(profileId: 'p1', enabled: true)).called(1);
  });
}
