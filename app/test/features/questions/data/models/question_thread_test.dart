import 'package:flutter_bloc_starter/features/questions/data/models/question_thread.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  QuestionPrompt prompt({bool isPaired = true, String? coupleId = 'couple-1'}) => QuestionPrompt(
    slug: 'first-meeting',
    title: 'O que você se lembra?',
    isPaired: isPaired,
    selfId: 'me',
    coupleId: coupleId,
  );

  const own = QuestionAnswer(id: 'own', body: 'Minha resposta.');

  test('one answer alone is never revealed', () {
    final thread = QuestionThread(prompt: prompt(), ownAnswer: own);

    expect(thread.isRevealed, isFalse);
    expect(thread.canEdit, isTrue);
  });

  test('both answers reveal together', () {
    const partner = QuestionAnswer(id: 'partner', body: 'A resposta dela.');
    final thread = QuestionThread(prompt: prompt(), ownAnswer: own, partnerAnswer: partner);

    expect(thread.isRevealed, isTrue);
    expect(thread.canEdit, isFalse);
  });

  test('a solo thread stays private', () {
    final thread = QuestionThread(prompt: prompt(isPaired: false, coupleId: null));

    expect(thread.isSolo, isTrue);
    expect(thread.isRevealed, isFalse);
  });

  test('withOwnAnswer keeps the partner answer', () {
    const partner = QuestionAnswer(id: 'partner', body: 'A resposta dela.');
    final thread = QuestionThread(prompt: prompt(), ownAnswer: own, partnerAnswer: partner);

    final updated = thread.withOwnAnswer(const QuestionAnswer(id: 'own', body: 'Editada.'));

    expect(updated.ownAnswer?.body, 'Editada.');
    expect(updated.partnerAnswer?.body, 'A resposta dela.');
  });
}
