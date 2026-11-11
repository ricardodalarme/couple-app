import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:storage_service/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class _MockStorage() extends Mock implements SupabaseStorageClient;

class _MockBucket() extends Mock implements StorageFileApi;

void main() {
  late SupabaseStorageClient storage;
  late StorageFileApi bucket;

  setUpAll(() {
    registerFallbackValue(const FileOptions());
    registerFallbackValue(Uint8List(0));
  });

  setUp(() {
    storage = _MockStorage();
    bucket = _MockBucket();
    when(() => storage.from('messages')).thenReturn(bucket);
  });

  test('upload sends the bytes with their type', () async {
    when(
      () => bucket.uploadBinary(any(), any(), fileOptions: any(named: 'fileOptions')),
    ).thenAnswer((_) async => 'messages/u/d.png');

    await StorageService(storage: storage).upload(
      bucket: 'messages',
      path: 'u/d.png',
      bytes: Uint8List.fromList([1, 2, 3]),
      contentType: 'image/png',
    );

    verify(() => bucket.uploadBinary('u/d.png', any(), fileOptions: any(named: 'fileOptions')))
        .called(1);
  });

  test('a failed upload is a FileStorageException', () async {
    when(
      () => bucket.uploadBinary(any(), any(), fileOptions: any(named: 'fileOptions')),
    ).thenThrow(Exception('offline'));

    expect(
      StorageService(storage: storage).upload(
        bucket: 'messages',
        path: 'u/d.png',
        bytes: Uint8List(1),
        contentType: 'image/png',
      ),
      throwsA(isA<FileStorageException>()),
    );
  });

  test('signedUrl returns a short-lived url', () async {
    when(() => bucket.createSignedUrl('u/d.png', 300)).thenAnswer((_) async => 'https://x/y');

    expect(
      await StorageService(storage: storage).signedUrl(bucket: 'messages', path: 'u/d.png'),
      'https://x/y',
    );
  });

  test('remove deletes the file', () async {
    when(() => bucket.remove(['u/d.png'])).thenAnswer((_) async => <FileObject>[]);

    await StorageService(storage: storage).remove(bucket: 'messages', path: 'u/d.png');

    verify(() => bucket.remove(['u/d.png'])).called(1);
  });
}
