import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/love_style/data/data_sources/local/love_style_local_data_source.dart';
import 'package:flutter_bloc_starter/features/love_style/data/data_sources/remote/love_style_data_source.dart';
import 'package:flutter_bloc_starter/features/love_style/data/repositories/love_style_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockLoveStyleDataSource() extends Mock implements LoveStyleDataSource;

class _MockLoveStyleLocalDataSource() extends Mock implements LoveStyleLocalDataSource;

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

void main() {
  late LoveStyleDataSource dataSource;
  late LoveStyleLocalDataSource localDataSource;
  late AuthenticationRepository authenticationRepository;
  late LoveStyleRepository repository;

  const first = ['time', 'words', 'acts', 'gifts', 'touch'];
  const retaken = ['touch', 'acts', 'gifts', 'words', 'time'];

  setUpAll(() {
    registerFallbackValue(<String>[]);
    registerFallbackValue(<String?>[]);
  });

  setUp(() {
    dataSource = _MockLoveStyleDataSource();
    localDataSource = _MockLoveStyleLocalDataSource();
    authenticationRepository = _MockAuthenticationRepository();
    when(() => authenticationRepository.currentUserId).thenReturn('u1');
    when(() => localDataSource.readSharedMessageId(any())).thenReturn(null);
    when(
      () => localDataSource.writeSharedMessageId(
        userId: any(named: 'userId'),
        id: any(named: 'id'),
      ),
    ).thenAnswer((_) async {});
    when(() => localDataSource.clearSharedMessageId(any())).thenAnswer((_) async {});
    repository = LoveStyleRepository(
      dataSource: dataSource,
      localDataSource: localDataSource,
      authenticationRepository: authenticationRepository,
    );
  });

  group('ranking', () {
    test('inserts the first ranking and never updates another row', () async {
      when(() => dataSource.getResult()).thenAnswer((_) async => null);
      when(() => dataSource.insertResult(any())).thenAnswer((_) async {});

      await repository.saveRanked(first);

      verify(() => dataSource.insertResult(first)).called(1);
      verifyNever(
        () => dataSource.updateResult(
          id: any(named: 'id'),
          ranked: any(named: 'ranked'),
        ),
      );
    });

    test('a retake updates the saved row so the latest ranking wins', () async {
      when(() => dataSource.getResult()).thenAnswer((_) async => (id: 'q1', ranked: first));
      when(
        () => dataSource.updateResult(
          id: any(named: 'id'),
          ranked: any(named: 'ranked'),
        ),
      ).thenAnswer((_) async {});

      await repository.saveRanked(retaken);

      verify(() => dataSource.updateResult(id: 'q1', ranked: retaken)).called(1);
      verifyNever(() => dataSource.insertResult(any()));
    });

    test('a race on the unique key falls back to updating the saved row', () async {
      var reads = 0;
      when(() => dataSource.getResult()).thenAnswer((_) async {
        reads++;

        return reads == 1 ? null : (id: 'q1', ranked: first);
      });
      when(() => dataSource.insertResult(any()))
          .thenThrow(const LocalizedException(l10nKey: '23505'));
      when(
        () => dataSource.updateResult(
          id: any(named: 'id'),
          ranked: any(named: 'ranked'),
        ),
      ).thenAnswer((_) async {});

      await repository.saveRanked(retaken);

      verify(() => dataSource.updateResult(id: 'q1', ranked: retaken)).called(1);
    });
  });

  group('manual entry', () {
    test('the first save inserts the loved entry', () async {
      when(() => dataSource.getManualEntry('u1')).thenAnswer((_) async => null);
      when(() => dataSource.insertManualEntry(any())).thenAnswer((_) async {});

      await repository.saveManualEntry('  Você se sente querido(a) com tempo junto.  ');

      verify(() => dataSource.insertManualEntry('Você se sente querido(a) com tempo junto.'))
          .called(1);
      verifyNever(
        () => dataSource.updateManualEntry(
          id: any(named: 'id'),
          value: any(named: 'value'),
        ),
      );
    });

    test('a later save updates the existing entry', () async {
      when(() => dataSource.getManualEntry('u1'))
          .thenAnswer((_) async => (id: 'm1', value: 'Antigo'));
      when(
        () => dataSource.updateManualEntry(
          id: any(named: 'id'),
          value: any(named: 'value'),
        ),
      ).thenAnswer((_) async {});

      await repository.saveManualEntry('Novo');

      verify(() => dataSource.updateManualEntry(id: 'm1', value: 'Novo')).called(1);
      verifyNever(() => dataSource.insertManualEntry(any()));
    });

    test('a shared loved entry is loaded and updated instead of hidden', () async {
      when(() => dataSource.getManualEntry('u1'))
          .thenAnswer((_) async => (id: 'm1', value: 'Compartilhado'));
      when(
        () => dataSource.updateManualEntry(
          id: any(named: 'id'),
          value: any(named: 'value'),
        ),
      ).thenAnswer((_) async {});

      expect(await repository.getManualEntry(), 'Compartilhado');
      await repository.saveManualEntry('Novo');

      verify(() => dataSource.updateManualEntry(id: 'm1', value: 'Novo')).called(1);
      verifyNever(() => dataSource.insertManualEntry(any()));
    });

    test('the entry value is bounded to 1000 characters', () async {
      when(() => dataSource.getManualEntry('u1')).thenAnswer((_) async => null);
      when(() => dataSource.insertManualEntry(any())).thenAnswer((_) async {});

      await repository.saveManualEntry('a' * 1200);

      final saved = verify(() => dataSource.insertManualEntry(captureAny())).captured.single;

      expect((saved as String).length, 1000);
    });

    test('a race on the manual unique key updates the existing entry', () async {
      var reads = 0;
      when(() => dataSource.getManualEntry('u1')).thenAnswer((_) async {
        reads++;

        return reads == 1 ? null : (id: 'm1', value: 'Antigo');
      });
      when(() => dataSource.insertManualEntry(any()))
          .thenThrow(const LocalizedException(l10nKey: '23505'));
      when(
        () => dataSource.updateManualEntry(
          id: any(named: 'id'),
          value: any(named: 'value'),
        ),
      ).thenAnswer((_) async {});

      await repository.saveManualEntry('Novo');

      verify(() => dataSource.updateManualEntry(id: 'm1', value: 'Novo')).called(1);
    });
  });

  group('sharing', () {
    test('shares the short description, returns the id and stores it for the person', () async {
      when(() => dataSource.shareMessage(any())).thenAnswer((_) async => 'msg-1');

      final id = await repository.share('  Eu me sinto querido(a) com tempo junto.  ');

      expect(id, 'msg-1');
      verify(() => dataSource.shareMessage('Eu me sinto querido(a) com tempo junto.')).called(1);
      verify(() => localDataSource.writeSharedMessageId(userId: 'u1', id: 'msg-1')).called(1);
    });

    test('the share body is bounded to 280 characters', () async {
      when(() => dataSource.shareMessage(any())).thenAnswer((_) async => 'msg-1');

      await repository.share('b' * 320);

      final body = verify(() => dataSource.shareMessage(captureAny())).captured.single;

      expect((body as String).length, 280);
    });

    test('a stored share is returned while the message still exists', () async {
      when(() => localDataSource.readSharedMessageId('u1')).thenReturn('msg-1');
      when(() => dataSource.sharedMessageExists('msg-1')).thenAnswer((_) async => true);

      expect(await repository.getSharedMessageId(), 'msg-1');
    });

    test('a stored share is cleared when the message was deleted elsewhere', () async {
      when(() => localDataSource.readSharedMessageId('u1')).thenReturn('msg-1');
      when(() => dataSource.sharedMessageExists('msg-1')).thenAnswer((_) async => false);

      expect(await repository.getSharedMessageId(), isNull);
      verify(() => localDataSource.clearSharedMessageId('u1')).called(1);
    });

    test('revoking deletes the shared message by id and clears the stored share', () async {
      when(() => dataSource.revokeShare('msg-1')).thenAnswer((_) async => true);

      await repository.revokeShare('msg-1');

      verify(() => dataSource.revokeShare('msg-1')).called(1);
      verify(() => localDataSource.clearSharedMessageId('u1')).called(1);
    });

    test('a revoke the server matched no row for is already revoked', () async {
      when(() => dataSource.revokeShare('msg-1')).thenAnswer((_) async => false);

      await repository.revokeShare('msg-1');

      verify(() => localDataSource.clearSharedMessageId('u1')).called(1);
    });
  });
}
