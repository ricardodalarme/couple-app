import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
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

    test('a cached photo survives only when paired and Plus', () {
      const path = '/tmp/repara_widget_photo.jpg';
      final payload = WidgetPayload.fake().copyWith(cachedPhotoPath: path);

      expect(payload.sanitized(referenceNow: now).cachedPhotoPath, path);
      expect(
        payload.copyWith(isPaired: false).sanitized(referenceNow: now).cachedPhotoPath,
        isNull,
      );
      expect(payload.copyWith(hasPlus: false).sanitized(referenceNow: now).cachedPhotoPath, isNull);
      expect(payload.copyWith(discreet: true).sanitized(referenceNow: now).cachedPhotoPath, isNull);
      expect(
        payload.copyWith(isSignedIn: false).sanitized(referenceNow: now).cachedPhotoPath,
        isNull,
      );
    });
  });

  group('WidgetPayload relationship phase', () {
    test('is stored by its enum name and read back', () {
      final payload = WidgetPayload.fake().copyWith(
        relationshipPhase: RelationshipPhase.livingTogether,
      );

      expect(payload.toJson()['relationshipPhase'], 'livingTogether');
      expect(
        WidgetPayload.fromJson(payload.toJson()).relationshipPhase,
        RelationshipPhase.livingTogether,
      );
    });

    test('a phase this version does not know reads as none', () {
      final json = WidgetPayload.fake().toJson()..['relationshipPhase'] = 'living_together';

      expect(WidgetPayload.fromJson(json).relationshipPhase, isNull);
    });
  });
}
