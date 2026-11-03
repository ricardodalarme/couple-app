import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:share_plus/share_plus.dart';
import 'package:share_service/share_service.dart';

class MockSharePlus() extends Mock implements SharePlus;

void main() {
  setUpAll(() {
    registerFallbackValue(ShareParams(text: 'fallback'));
  });

  group('ShareService', () {
    late SharePlus sharePlus;
    late ShareService shareService;

    setUp(() {
      sharePlus = MockSharePlus();
      shareService = ShareService(sharePlus: sharePlus);
    });

    test('defaults to the platform share instance when none is provided', () {
      expect(() => const ShareService(), returnsNormally);
    });

    group('shareFile', () {
      test('shares the file, mime type, text and origin through the share sheet', () async {
        final file = File('/tmp/share-service-test.png');
        when(() => sharePlus.share(any())).thenAnswer((_) async => ShareResult.unavailable);

        await shareService.shareFile(
          file: file,
          mimeType: 'image/png',
          text: 'a caption',
          sharePositionOrigin: const Rect.fromLTWH(1, 2, 3, 4),
        );

        final params = verify(() => sharePlus.share(captureAny())).captured.single as ShareParams;
        expect(params.files, hasLength(1));
        expect(params.files!.single.path, file.path);
        expect(params.files!.single.mimeType, 'image/png');
        expect(params.text, 'a caption');
        expect(params.sharePositionOrigin, const Rect.fromLTWH(1, 2, 3, 4));
      });

      test('wraps a share failure in a ShareException', () async {
        final failure = Exception('share failed');
        when(() => sharePlus.share(any())).thenThrow(failure);

        await expectLater(
          shareService.shareFile(file: File('/tmp/share-service-test.png'), mimeType: 'image/png'),
          throwsA(isA<ShareException>().having((exception) => exception.error, 'error', failure)),
        );
      });
    });

    group('writeTemporaryFile', () {
      test('writes the bytes under the temporary directory and returns the file', () async {
        final directory = Directory.systemTemp.createTempSync('share_service_test');
        addTearDown(() => directory.deleteSync(recursive: true));
        shareService = ShareService(temporaryDirectory: () async => directory);
        final bytes = Uint8List.fromList([1, 2, 3]);

        final file = await shareService.writeTemporaryFile(
          fileName: 'share-service-1.png',
          bytes: bytes,
        );

        expect(file.path, '${directory.path}/share-service-1.png');
        expect(await file.readAsBytes(), bytes);
      });

      test('wraps a temporary-directory failure in a ShareException', () async {
        final failure = Exception('no directory');
        shareService = ShareService(temporaryDirectory: () async => throw failure);

        await expectLater(
          shareService.writeTemporaryFile(fileName: 'share-service-1.png', bytes: Uint8List(0)),
          throwsA(isA<ShareException>().having((exception) => exception.error, 'error', failure)),
        );
      });
    });

    group('deleteTemporaryFile', () {
      test('removes an export after sharing is complete', () async {
        final directory = Directory.systemTemp.createTempSync('share_service_cleanup_test');
        addTearDown(() => directory.deleteSync(recursive: true));
        shareService = ShareService(temporaryDirectory: () async => directory);
        final file = await shareService.writeTemporaryFile(
          fileName: 'share-service-export-test.zip',
          bytes: Uint8List.fromList([80, 75]),
        );

        await shareService.deleteTemporaryFile(file);

        expect(file.existsSync(), isFalse);
      });

      test('ignores an already removed temporary file', () async {
        final file = File('${Directory.systemTemp.path}/missing-share-export.zip');

        await expectLater(shareService.deleteTemporaryFile(file), completes);
      });
    });
  });
}
