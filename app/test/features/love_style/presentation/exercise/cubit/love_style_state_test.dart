import 'package:flutter_bloc_starter/features/love_style/presentation/exercise/cubit/love_style_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('clearSharedMessage drops the shared message', () {
    const state = LoveStyleState(sharedMessageId: 'message-1');

    final cleared = state.copyWith(clearSharedMessage: true);

    expect(cleared.sharedMessageId, isNull);
    expect(cleared.isShared, isFalse);
  });

  test('clearPartnerName drops the partner name', () {
    const state = LoveStyleState(partnerName: 'Bia');

    expect(state.copyWith(clearPartnerName: true).partnerName, isNull);
  });

  test('changing the question keeps the shared message and partner name', () {
    const state = LoveStyleState(sharedMessageId: 'message-1', partnerName: 'Bia');

    final updated = state.copyWith(questionIndex: 2);

    expect(updated.sharedMessageId, 'message-1');
    expect(updated.partnerName, 'Bia');
  });

  test('currentAnswer reads the answer at the current index', () {
    const state = LoveStyleState(answers: ['first', '']);

    expect(state.currentAnswer, 'first');
    expect(state.copyWith(questionIndex: 1).currentAnswer, isNull);
    expect(state.copyWith(questionIndex: 8).currentAnswer, isNull);
  });

  test('isComplete needs a non-empty answer for every question', () {
    const complete = LoveStyleState(answers: ['a', 'b', 'c', 'd', 'e', 'f']);

    expect(complete.isComplete, isTrue);
    expect(complete.copyWith(answers: ['a', 'b', 'c', 'd', 'e', '']).isComplete, isFalse);
  });
}
