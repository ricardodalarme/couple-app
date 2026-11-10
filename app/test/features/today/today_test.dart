import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/partner_mood.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';
import 'package:flutter_bloc_starter/features/today/data/data_sources/queries/generated/TodayHome.graphql.dart';
import 'package:flutter_bloc_starter/features/today/data/data_sources/today_data_source.dart';
import 'package:flutter_bloc_starter/features/today/data/data_sources/today_local_data_source.dart';
import 'package:flutter_bloc_starter/features/today/data/models/today_home.dart';
import 'package:flutter_bloc_starter/features/today/data/repositories/today_repository.dart';
import 'package:flutter_bloc_starter/features/today/presentation/today/cubit/today_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class _MockTodayDataSource() extends Mock implements TodayDataSource;

class _MockTodayLocalDataSource() extends Mock implements TodayLocalDataSource;

class _MockTodayRepository() extends Mock implements TodayRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockPairingRepository() extends Mock implements PairingRepository;

class _MockRepairRepository() extends Mock implements RepairRepository;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const home = TodayHome(
    isPaired: true,
    unopenedCards: 0,
    slipsThisWeek: 2,
    slipsTotal: 2,
    hasPendingInvite: false,
    hasPlus: false,
    partnerName: 'Rui',
  );

  const unpairedHome = TodayHome(
    isPaired: false,
    unopenedCards: 0,
    slipsThisWeek: 2,
    slipsTotal: 2,
    hasPendingInvite: false,
    hasPlus: false,
  );

  TodayResult result({
    TodayHome value = home,
    bool isFromCache = false,
    bool wasUnpaired = false,
    String? previousPartnerName,
  }) => (
    home: value,
    isFromCache: isFromCache,
    wasUnpaired: wasUnpaired,
    previousPartnerName: previousPartnerName,
  );

  setUpAll(() => registerFallbackValue(home));

  group('TodayHome', () {
    test('survives the cache round trip', () {
      expect(TodayHome.fromMap(home.toMap()), home);
    });

    test('a pause ends at its return time', () {
      final returnAt = DateTime(2026, 11, 10, 18);
      final paused = TodayHome(
        isPaired: true,
        unopenedCards: 0,
        slipsThisWeek: 0,
        slipsTotal: 0,
        hasPendingInvite: false,
        hasPlus: false,
        pauseReturnAt: returnAt,
      );

      expect(paused.isPausedAt(DateTime(2026, 11, 10, 17, 59)), isTrue);
      expect(paused.isPausedAt(returnAt), isFalse);
      expect(home.isPausedAt(DateTime(2026, 11, 10)), isFalse);
    });
  });

  group('TodayRepository', () {
    late TodayDataSource remote;
    late TodayLocalDataSource local;
    late TodayRepository repository;

    setUp(() {
      remote = _MockTodayDataSource();
      local = _MockTodayLocalDataSource();
      repository = TodayRepository(dataSource: remote, localDataSource: local);
      when(() => local.write(any())).thenAnswer((_) async {});
      when(() => local.readRelationship()).thenReturn((wasPaired: false, partnerName: null));
      when(
        () => local.writeRelationship(
          wasPaired: any(named: 'wasPaired'),
          partnerName: any(named: 'partnerName'),
        ),
      ).thenAnswer((_) async {});
    });

    test('offline with a cache returns the cached state', () async {
      when(() => remote.getHome())
          .thenAnswer((_) async => throw const LocalizedException(l10nKey: networkErrorCode));
      when(() => local.read()).thenReturn(home);

      final result = await repository.getToday();

      expect(result.isFromCache, isTrue);
      expect(result.home, home);
      expect(result.wasUnpaired, isFalse);
    });

    test('offline without a cache fails', () {
      when(() => remote.getHome())
          .thenAnswer((_) async => throw const LocalizedException(l10nKey: networkErrorCode));
      when(() => local.read()).thenReturn(null);

      expect(repository.getToday, throwsA(isA<LocalizedException>()));
    });

    test('offline after a revoked share shows no mood hint', () async {
      final shared = TodayHome(
        isPaired: true,
        unopenedCards: 0,
        slipsThisWeek: 0,
        slipsTotal: 0,
        hasPendingInvite: false,
        hasPlus: false,
        partnerName: 'Rui',
        localDate: DateTime(2026, 11, 10),
        partnerMood: PartnerMood(day: DateTime(2026, 11, 10), mood: MoodKind.tired),
      );
      when(() => remote.getHome())
          .thenAnswer((_) async => throw const LocalizedException(l10nKey: networkErrorCode));
      when(() => local.read()).thenReturn(TodayHome.fromMap(shared.toMap()));

      final result = await repository.getToday();

      expect(result.isFromCache, isTrue);
      expect(result.home.partnerMood, isNull);
    });

    test('a server error is not hidden by the cache', () {
      when(() => remote.getHome())
          .thenAnswer((_) async => throw const LocalizedException(l10nKey: 'UNAUTHENTICATED'));
      when(() => local.read()).thenReturn(home);

      expect(repository.getToday, throwsA(isA<LocalizedException>()));
    });

    test('a server row without today fails instead of showing nothing', () {
      when(() => remote.getHome()).thenAnswer((_) async => QueryTodayHome());
      when(() => local.read()).thenReturn(null);

      expect(repository.getToday, throwsA(isA<NoDataException>()));
    });

    test('a paired read remembers the partner name', () async {
      when(() => remote.getHome()).thenAnswer(
        (_) async => QueryTodayHome(today: QueryTodayHometoday(isPaired: true, partnerName: 'Rui')),
      );
      when(() => local.read()).thenReturn(home);

      await repository.getToday();

      verify(() => local.writeRelationship(wasPaired: true, partnerName: 'Rui')).called(1);
    });

    test('an unpair reports the stored partner name once', () async {
      when(() => remote.getHome())
          .thenAnswer((_) async => QueryTodayHome(today: QueryTodayHometoday(isPaired: false)));
      when(() => local.readRelationship()).thenReturn((wasPaired: true, partnerName: 'Rui'));

      final result = await repository.getToday();

      expect(result.wasUnpaired, isTrue);
      expect(result.previousPartnerName, 'Rui');
    });

    test('acknowledging the unpair clears the stored pairing state', () async {
      await repository.acknowledgeUnpair();

      verify(() => local.writeRelationship(wasPaired: false)).called(1);
    });

    test('an unpair already acknowledged is not reported again', () async {
      when(() => remote.getHome())
          .thenAnswer((_) async => QueryTodayHome(today: QueryTodayHometoday(isPaired: false)));

      final result = await repository.getToday();

      expect(result.wasUnpaired, isFalse);
      expect(result.previousPartnerName, isNull);
      verifyNever(
        () => local.writeRelationship(
          wasPaired: any(named: 'wasPaired'),
          partnerName: any(named: 'partnerName'),
        ),
      );
    });
  });

  group('TodayCubit', () {
    late TodayRepository today;
    late ProfileRepository profile;
    late PairingRepository pairing;
    late RepairRepository repair;

    setUp(() {
      today = _MockTodayRepository();
      profile = _MockProfileRepository();
      pairing = _MockPairingRepository();
      repair = _MockRepairRepository();
      when(() => repair.onPauseChanged).thenAnswer((_) => const Stream.empty());
      when(() => pairing.onChanged).thenAnswer((_) => const Stream.empty());
      when(() => profile.getMyProfile()).thenAnswer(
        (_) async => const Profile(id: 'me', avatarKind: 'initials', displayName: 'Ana'),
      );
      when(() => today.acknowledgeUnpair()).thenAnswer((_) async {});
    });

    test('load shows the state and the person name', () async {
      when(() => today.getToday()).thenAnswer((_) async => result());
      final cubit = TodayCubit(
        todayRepository: today,
        profileRepository: profile,
        pairingRepository: pairing,
        repairRepository: repair,
      );

      await cubit.load();

      expect(cubit.state.home, const Success<TodayHome>(home));
      expect(cubit.state.selfName, 'Ana');
      expect(cubit.state.isOffline, isFalse);
    });

    test('endPause ends the pause and reads Hoje again', () async {
      var calls = 0;
      when(() => today.getToday()).thenAnswer((_) async {
        calls++;
        return result(
          value: calls == 1
              ? TodayHome(
                  isPaired: true,
                  unopenedCards: 0,
                  slipsThisWeek: 2,
                  slipsTotal: 2,
                  hasPendingInvite: false,
                  hasPlus: false,
                  pauseIsMine: true,
                  pauseReturnAt: DateTime.now().add(const Duration(hours: 2)),
                )
              : home,
        );
      });
      when(() => today.endPause()).thenAnswer((_) async {});
      final cubit = TodayCubit(
        todayRepository: today,
        profileRepository: profile,
        pairingRepository: pairing,
        repairRepository: repair,
      );
      await cubit.load();
      expect(cubit.state.home, isA<Success<TodayHome>>());

      await cubit.endPause();

      verify(() => today.endPause()).called(1);
      expect(calls, 2);
      expect(cubit.state.endPauseAction, isA<Initial>());
      await cubit.close();
    });

    test('a failed endPause keeps Hoje and re-enables the action', () async {
      when(() => today.getToday()).thenAnswer((_) async => result());
      when(() => today.endPause()).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
      final cubit = TodayCubit(
        todayRepository: today,
        profileRepository: profile,
        pairingRepository: pairing,
        repairRepository: repair,
      );
      await cubit.load();

      await cubit.endPause();

      expect(cubit.state.home, const Success<TodayHome>(home));
      expect(cubit.state.endPauseAction, isA<Initial>());
      await cubit.close();
    });

    test('a cached result sets the offline flag', () async {
      when(() => today.getToday()).thenAnswer((_) async => result(isFromCache: true));
      final cubit = TodayCubit(
        todayRepository: today,
        profileRepository: profile,
        pairingRepository: pairing,
        repairRepository: repair,
      );

      await cubit.load();

      expect(cubit.state.isOffline, isTrue);
    });

    test('a failed first load shows a failure', () async {
      when(() => today.getToday()).thenAnswer((_) async => throw Exception());
      final cubit = TodayCubit(
        todayRepository: today,
        profileRepository: profile,
        pairingRepository: pairing,
        repairRepository: repair,
      );

      await cubit.load();

      expect(cubit.state.home, isA<Failure>());
    });

    test('a failed refresh keeps what is already on screen', () async {
      when(() => today.getToday()).thenAnswer((_) async => result());
      final cubit = TodayCubit(
        todayRepository: today,
        profileRepository: profile,
        pairingRepository: pairing,
        repairRepository: repair,
      );
      await cubit.load();

      when(() => today.getToday()).thenAnswer((_) async => throw Exception());
      await cubit.load();

      expect(cubit.state.home, const Success<TodayHome>(home));
    });

    test('a share turned off clears the hint on the next load', () async {
      final shared = TodayHome(
        isPaired: true,
        unopenedCards: 0,
        slipsThisWeek: 0,
        slipsTotal: 0,
        hasPendingInvite: false,
        hasPlus: false,
        partnerName: 'Rui',
        localDate: DateTime(2026, 11, 10),
        partnerMood: PartnerMood(day: DateTime(2026, 11, 10), mood: MoodKind.tired),
      );
      when(() => today.getToday()).thenAnswer((_) async => result(value: shared));
      final cubit = TodayCubit(
        todayRepository: today,
        profileRepository: profile,
        pairingRepository: pairing,
        repairRepository: repair,
      );

      await cubit.load();
      expect((cubit.state.home as Success<TodayHome>).value.partnerMood, isNotNull);

      when(() => today.getToday()).thenAnswer((_) async => result(value: home));
      await cubit.load();

      expect((cubit.state.home as Success<TodayHome>).value.partnerMood, isNull);
    });

    test('an unpair notice shows once with the last partner name', () async {
      when(() => today.getToday()).thenAnswer(
        (_) async => result(value: unpairedHome, wasUnpaired: true, previousPartnerName: 'Rui'),
      );
      final cubit = TodayCubit(
        todayRepository: today,
        profileRepository: profile,
        pairingRepository: pairing,
        repairRepository: repair,
      );

      await cubit.load();

      expect(cubit.state.showUnpairNotice, isTrue);
      expect(cubit.state.unpairedPartnerName, 'Rui');

      await cubit.acknowledgeUnpairNotice();
      verify(() => today.acknowledgeUnpair()).called(1);
      expect(cubit.state.showUnpairNotice, isFalse);
      expect(cubit.state.unpairedPartnerName, isNull);

      when(() => today.getToday()).thenAnswer((_) async => result(value: unpairedHome));
      await cubit.load();

      expect(cubit.state.showUnpairNotice, isFalse);
    });

    test('an unpair notice without a stored name uses the neutral copy', () async {
      when(() => today.getToday())
          .thenAnswer((_) async => result(value: unpairedHome, wasUnpaired: true));
      final cubit = TodayCubit(
        todayRepository: today,
        profileRepository: profile,
        pairingRepository: pairing,
        repairRepository: repair,
      );

      await cubit.load();

      expect(cubit.state.showUnpairNotice, isTrue);
      expect(cubit.state.unpairedPartnerName, isNull);
    });
  });
}
