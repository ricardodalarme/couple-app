import 'package:file_picker/file_picker.dart';
import 'package:file_picker_service/file_picker_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFilePickerPlatform() extends Mock implements FilePickerPlatform;

final class FakePlatformFile(final String _name) extends PlatformFile {
  @override
  String get name => _name;

  @override
  Uri get uri => Uri.file('/tmp/$_name');

  @override
  Never get xFile => throw UnimplementedError();

  @override
  Never lengthSync() => throw UnimplementedError();

  @override
  Never length() => throw UnimplementedError();

  @override
  Never readAsBytes() => throw UnimplementedError();

  @override
  Never readAsByteStream() => throw UnimplementedError();
}

void main() {
  setUpAll(() {
    registerFallbackValue(FileType.any);
    registerFallbackValue(<String>[]);
  });

  group('FilePickerService', () {
    late FilePickerPlatform platform;
    late FilePickerService filePickerService;

    setUp(() {
      platform = MockFilePickerPlatform();
      filePickerService = FilePickerService(platform: platform);
    });

    test('defaults to the platform picker when none is provided', () {
      expect(() => const FilePickerService(), returnsNormally);
    });

    group('pickFile', () {
      test('returns the selected file', () async {
        final file = FakePlatformFile('document.pdf');
        when(
          () => platform.pickFile(
            dialogTitle: any(named: 'dialogTitle'),
            type: any(named: 'type'),
            allowedExtensions: any(named: 'allowedExtensions'),
          ),
        ).thenAnswer((_) async => file);

        expect(await filePickerService.pickFile(), same(file));
      });

      test('forwards the dialog title, type and extensions', () async {
        when(
          () => platform.pickFile(
            dialogTitle: any(named: 'dialogTitle'),
            type: any(named: 'type'),
            allowedExtensions: any(named: 'allowedExtensions'),
          ),
        ).thenAnswer((_) async => null);

        await filePickerService.pickFile(
          dialogTitle: 'Choose a document',
          type: FileType.custom,
          allowedExtensions: const ['pdf'],
        );

        verify(
          () => platform.pickFile(
            dialogTitle: 'Choose a document',
            type: FileType.custom,
            allowedExtensions: const ['pdf'],
          ),
        ).called(1);
      });

      test('returns null when the user cancels', () async {
        when(
          () => platform.pickFile(
            dialogTitle: any(named: 'dialogTitle'),
            type: any(named: 'type'),
            allowedExtensions: any(named: 'allowedExtensions'),
          ),
        ).thenAnswer((_) async => null);

        expect(await filePickerService.pickFile(), isNull);
      });

      test('wraps a platform failure in a FilePickerException', () {
        when(
          () => platform.pickFile(
            dialogTitle: any(named: 'dialogTitle'),
            type: any(named: 'type'),
            allowedExtensions: any(named: 'allowedExtensions'),
          ),
        ).thenThrow(Exception('failed'));

        expect(filePickerService.pickFile, throwsA(isA<FilePickerException>()));
      });
    });

    group('pickFiles', () {
      test('returns the selected files', () async {
        final files = [FakePlatformFile('a.pdf'), FakePlatformFile('b.pdf')];
        when(
          () => platform.pickFiles(
            dialogTitle: any(named: 'dialogTitle'),
            type: any(named: 'type'),
            allowedExtensions: any(named: 'allowedExtensions'),
          ),
        ).thenAnswer((_) async => files);

        expect(await filePickerService.pickFiles(), same(files));
      });

      test('returns an empty list when the user cancels', () async {
        when(
          () => platform.pickFiles(
            dialogTitle: any(named: 'dialogTitle'),
            type: any(named: 'type'),
            allowedExtensions: any(named: 'allowedExtensions'),
          ),
        ).thenAnswer((_) async => const []);

        expect(await filePickerService.pickFiles(), isEmpty);
      });

      test('wraps a platform failure in a FilePickerException', () {
        when(
          () => platform.pickFiles(
            dialogTitle: any(named: 'dialogTitle'),
            type: any(named: 'type'),
            allowedExtensions: any(named: 'allowedExtensions'),
          ),
        ).thenThrow(Exception('failed'));

        expect(filePickerService.pickFiles, throwsA(isA<FilePickerException>()));
      });
    });
  });
}
