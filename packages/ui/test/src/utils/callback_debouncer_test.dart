import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

void main() {
  testWidgets('runs only the last call after the delay', (tester) async {
    await tester.pumpWidget(const SizedBox());

    var calls = 0;
    final debouncer = CallbackDebouncer(const Duration(milliseconds: 100));
    debouncer(() => calls++);
    debouncer(() => calls++);

    await tester.pump(const Duration(milliseconds: 50));
    expect(calls, 0);

    await tester.pump(const Duration(milliseconds: 60));
    expect(calls, 1);

    debouncer.dispose();
  });

  testWidgets('cancel drops the pending call', (tester) async {
    await tester.pumpWidget(const SizedBox());

    var calls = 0;
    final debouncer = CallbackDebouncer(const Duration(milliseconds: 100))
      ..call(() => calls++)
      ..cancel();
    await tester.pump(const Duration(milliseconds: 200));
    expect(calls, 0);

    debouncer.dispose();
  });
}
