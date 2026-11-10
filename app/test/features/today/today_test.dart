import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
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

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const home = TodayHome(
    isPaired: true,
    unopenedCards: 0,
    slipsThisWeek: 2,
    hasPendingInvite: false,
    hasPlus: false,
    partnerName: 'Rui',
  );

  setUpAll(() => registerFallbackValue(home));

  group('TodayHome', () {
    test('survives the cache round trip', () {
      expect(TodayHome.fromMap(home.toMap()), home);
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
    });

    test('offline with a cache returns the cached state', () async {
      when(() => remote.getHome())
          .thenAnswer((_) async => throw const LocalizedException(l10nKey: networkErrorCode));
      when(() => local.read()).thenReturn(home);

      final result = await repository.getToday();

      expect(result.isFromCache, isTrue);
      expect(result.home, home);
    });

    test('offline without a cache fails', () {
      when(() => remote.getHome())
          .thenAnswer((_) async => throw const LocalizedException(l10nKey: networkErrorCode));
      when(() => local.read()).thenReturn(null);

      expect(repository.getToday, throwsA(isA<LocalizedException>()));
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
  });

  group('TodayCubit', () {
    late TodayRepository today;
    late ProfileRepository profile;

    setUp(() {
      today = _MockTodayRepository();
      profile = _MockProfileRepository();
      when(() => profile.getMyProfile()).thenAnswer(
        (_) async => const Profile(id: 'me', avatarKind: 'initials', displayName: 'Ana'),
      );
    });

    test('load shows the state and the person name', () async {
      when(() => today.getToday()).thenAnswer((_) async => (home: home, isFromCache: false));
      final cubit = TodayCubit(todayRepository: today, profileRepository: profile);

      await cubit.load();

      expect(cubit.state.home, const Success<TodayHome>(home));
      expect(cubit.state.selfName, 'Ana');
      expect(cubit.state.isOffline, isFalse);
    });

    test('a cached result sets the offline flag', () async {
      when(() => today.getToday()).thenAnswer((_) async => (home: home, isFromCache: true));
      final cubit = TodayCubit(todayRepository: today, profileRepository: profile);

      await cubit.load();

      expect(cubit.state.isOffline, isTrue);
    });

    test('a failed first load shows a failure', () async {
      when(() => today.getToday()).thenAnswer((_) async => throw Exception());
      final cubit = TodayCubit(todayRepository: today, profileRepository: profile);

      await cubit.load();

      expect(cubit.state.home, isA<Failure>());
    });

    test('a failed refresh keeps what is already on screen', () async {
      when(() => today.getToday()).thenAnswer((_) async => (home: home, isFromCache: false));
      final cubit = TodayCubit(todayRepository: today, profileRepository: profile);
      await cubit.load();

      when(() => today.getToday()).thenAnswer((_) async => throw Exception());
      await cubit.load();

      expect(cubit.state.home, const Success<TodayHome>(home));
    });
  });
}
