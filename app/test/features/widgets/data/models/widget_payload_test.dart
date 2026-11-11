import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime.utc(2026, 11, 11, 12);

  group('WidgetPayload privacy', () {
    test('an active pause requires a pair and is cleared when unpaired', () {
      final payload = WidgetPayload.fake().copyWith(
        isPaired: false,
        pauseReturnAt: now.add(const Duration(hours: 1)).toIso8601String(),
        cardState: 'pause',
      );

      final sanitized = payload.sanitized(referenceNow: now);

      expect(sanitized.isPaired, isFalse);
      expect(sanitized.pauseReturnAt, isNull);
      expect(sanitized.cardState, 'none');
    });

    test('discreet mode clears pause status and time', () {
      final payload = WidgetPayload.fake().copyWith(
        discreet: true,
        pauseReturnAt: now.add(const Duration(hours: 1)).toIso8601String(),
        cardState: 'pause',
      );

      final sanitized = payload.sanitized(referenceNow: now);

      expect(sanitized.discreet, isTrue);
      expect(sanitized.pauseReturnAt, isNull);
      expect(sanitized.cardState, 'none');
    });

    test('stored payloads without privacy flags fail closed', () {
      final payload = WidgetPayload.fromJson(const <String, dynamic>{
        'isSignedIn': true,
        'isPaired': true,
      });

      expect(payload.showNames, isFalse);
      expect(payload.allowPartnerNotes, isFalse);
    });
  });
}
