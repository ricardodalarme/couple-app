import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/notes/data/data_sources/notes_data_source.dart';
import 'package:flutter_bloc_starter/features/notes/data/models/sent_message.dart';
import 'package:flutter_bloc_starter/features/notes/data/repositories/notes_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:storage_service/storage_service.dart';

class _MockNotesDataSource() extends Mock implements NotesDataSource;

class _MockStorageService() extends Mock implements StorageService;

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

void main() {
  late NotesDataSource dataSource;
  late StorageService storageService;
  late AuthenticationRepository authenticationRepository;

  final message = SentMessage(
    id: 'm1',
    kind: MessageKind.drawing,
    createdAt: DateTime(2026),
    forWidget: false,
    mediaPath: 'u1/drawing.png',
  );

  setUp(() {
    dataSource = _MockNotesDataSource();
    storageService = _MockStorageService();
    authenticationRepository = _MockAuthenticationRepository();
    when(() => authenticationRepository.currentUserId).thenReturn('u1');
    when(
      () => storageService.remove(
        bucket: any(named: 'bucket'),
        path: any(named: 'path'),
      ),
    ).thenAnswer((_) async {});
  });

  NotesRepository build() => NotesRepository(
    dataSource: dataSource,
    storageService: storageService,
    authenticationRepository: authenticationRepository,
  );

  test('deleting goes through the RPC and removes the drawing file', () async {
    when(() => dataSource.delete('m1')).thenAnswer((_) async => true);

    await build().delete(message);

    verify(() => dataSource.delete('m1')).called(1);
    verify(() => storageService.remove(bucket: 'messages', path: 'u1/drawing.png')).called(1);
  });

  test('a row that was already gone still removes the drawing file', () async {
    when(() => dataSource.delete('m1')).thenAnswer((_) async => false);

    await build().delete(message);

    verify(() => storageService.remove(bucket: 'messages', path: 'u1/drawing.png')).called(1);
  });
}
