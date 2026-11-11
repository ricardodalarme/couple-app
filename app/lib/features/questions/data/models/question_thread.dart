import 'package:equatable/equatable.dart';

/// The editorial prompt together with the couple context needed to answer it.
final class const QuestionPrompt({
  required final String slug,
  required final String title,
  required final bool isPaired,
  required final String selfId,
  final String? body,
  final List<String> tags = const [],
  final String? partnerName,
  final String? coupleId,
}) with Equatable {
  @override
  List<Object?> get props => [slug, title, body, tags, isPaired, partnerName, coupleId, selfId];
}

/// One person's answer, kept apart from the partner's until both exist.
final class const QuestionAnswer({required final String id, required final String body})
    with Equatable {
  @override
  List<Object?> get props => [id, body];
}

/// The current question and whichever answers the server reveals to this person.
final class const QuestionThread({
  required final QuestionPrompt prompt,
  final QuestionAnswer? ownAnswer,
  final QuestionAnswer? partnerAnswer,
  final bool partnerHasAnswered = false,
}) with Equatable {
  factory fake() => const QuestionThread(
    prompt: QuestionPrompt(
      slug: 'fake',
      title: 'O que você se lembra da primeira vez que vocês se conheceram?',
      isPaired: true,
      selfId: 'fake',
      partnerName: 'Nome',
      coupleId: 'fake',
    ),
    ownAnswer: QuestionAnswer(id: 'fake', body: 'Uma resposta gentil.'),
  );

  /// Whether both answers are visible, which only happens after both answered.
  bool get isRevealed => ownAnswer != null && partnerAnswer != null;

  /// Whether the answer can still change before the partner answers.
  bool get canEdit => ownAnswer != null && !isRevealed;

  bool get isAnswered => ownAnswer != null;

  bool get isSolo => !prompt.isPaired;

  QuestionThread withOwnAnswer(QuestionAnswer answer) => QuestionThread(
    prompt: prompt,
    ownAnswer: answer,
    partnerAnswer: partnerAnswer,
    partnerHasAnswered: partnerHasAnswered,
  );

  @override
  List<Object?> get props => [prompt, ownAnswer, partnerAnswer, partnerHasAnswered];
}
