import 'package:flutter_test/flutter_test.dart';
import 'package:link_launcher_service/link_launcher_service.dart';

class _RecordingLauncher() implements LinkLauncherService {
  final List<Uri> opened = [];
  bool result = true;

  @override
  Future<bool> openExternal(Uri uri) async {
    opened.add(uri);

    return result;
  }
}

void main() {
  test('defaults to the platform launcher without touching a channel', () {
    expect(() => const UrlLauncherService(), returnsNormally);
  });

  test('opens the requested URI and reports a refused open', () async {
    final launcher = _RecordingLauncher()..result = false;
    final uri = Uri.parse('https://apps.apple.com/');

    expect(await launcher.openExternal(uri), isFalse);
    expect(launcher.opened, [uri]);
  });
}
