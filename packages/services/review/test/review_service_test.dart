import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:mocktail/mocktail.dart';
import 'package:review_service/review_service.dart';

class MockInAppReview() extends Mock implements InAppReview;

void main() {
  group('ReviewService', () {
    late InAppReview inAppReview;
    late ReviewService reviewService;

    setUp(() {
      inAppReview = MockInAppReview();
      reviewService = ReviewService(inAppReview: inAppReview);
    });

    test('defaults to the platform review instance when none is provided', () {
      expect(() => const ReviewService(), returnsNormally);
    });

    group('isAvailable', () {
      test('returns true when the platform can show a review prompt', () async {
        when(() => inAppReview.isAvailable()).thenAnswer((_) async => true);

        expect(await reviewService.isAvailable(), isTrue);
      });

      test('returns false when the platform cannot show a review prompt', () async {
        when(() => inAppReview.isAvailable()).thenAnswer((_) async => false);

        expect(await reviewService.isAvailable(), isFalse);
      });

      test('wraps a platform failure in a ReviewException', () {
        when(() => inAppReview.isAvailable()).thenThrow(Exception('unavailable'));

        expect(reviewService.isAvailable, throwsA(isA<ReviewException>()));
      });
    });

    group('requestReview', () {
      test('asks the platform for a review prompt', () async {
        when(() => inAppReview.requestReview()).thenAnswer((_) async {});

        await reviewService.requestReview();

        verify(() => inAppReview.requestReview()).called(1);
      });

      test('wraps a platform failure in a ReviewException', () {
        when(() => inAppReview.requestReview()).thenThrow(Exception('failed'));

        expect(reviewService.requestReview, throwsA(isA<ReviewException>()));
      });
    });

    group('openStoreListing', () {
      test('forwards the store ids to the platform', () async {
        when(
          () => inAppReview.openStoreListing(
            appStoreId: any(named: 'appStoreId'),
            microsoftStoreId: any(named: 'microsoftStoreId'),
          ),
        ).thenAnswer((_) async {});

        await reviewService.openStoreListing(
          appStoreId: '123456789',
          microsoftStoreId: '9NBLGGH4R315',
        );

        verify(
          () => inAppReview.openStoreListing(
            appStoreId: '123456789',
            microsoftStoreId: '9NBLGGH4R315',
          ),
        ).called(1);
      });

      test('wraps a platform failure in a ReviewException', () {
        when(
          () => inAppReview.openStoreListing(
            appStoreId: any(named: 'appStoreId'),
            microsoftStoreId: any(named: 'microsoftStoreId'),
          ),
        ).thenThrow(Exception('failed'));

        expect(reviewService.openStoreListing, throwsA(isA<ReviewException>()));
      });
    });
  });
}
