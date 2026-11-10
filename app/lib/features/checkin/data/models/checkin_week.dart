import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/checkin/data/models/checkin_answer.dart';

/// Questions in one weekly check-in; the backend reveals only when both answer all four.
const int checkinQuestionCount = 4;

/// The Monday that starts the week containing [localDate], which is the server's local day.
DateTime checkinWeekStart(DateTime localDate) {
  final day = DateTime(localDate.year, localDate.month, localDate.day);

  return day.subtract(Duration(days: day.weekday - DateTime.monday));
}

final class const CheckinWeek({
  required final DateTime weekStart,
  required final String? coupleId,
  required final bool isPaired,
  final String? partnerName,
  final Map<int, CheckinAnswer> ownAnswers = const {},
  final Map<int, CheckinAnswer> partnerAnswers = const {},
}) with Equatable {
  factory fake() => CheckinWeek(
    weekStart: DateTime(2026, 11, 2),
    coupleId: 'fake',
    isPaired: true,
    partnerName: 'Nome',
    ownAnswers: {1: const CheckinAnswer(id: 'fake', question: 1, body: 'Uma resposta gentil.')},
  );

  /// Whether the person is paired and in a couple, so the check-in can be answered.
  bool get canParticipate => isPaired && coupleId != null;

  /// Whether the person answered every question.
  bool get isOwnComplete => ownAnswers.length == checkinQuestionCount;

  /// Whether both people answered all four; the backend hides partner rows until then.
  bool get isRevealed => isOwnComplete && partnerAnswers.length == checkinQuestionCount;

  /// The first question the person has not answered, or the first question when all are done.
  int get firstUnanswered {
    for (var question = 1; question <= checkinQuestionCount; question++) {
      if (!ownAnswers.containsKey(question)) return question;
    }

    return 1;
  }

  CheckinAnswer? answerFor(int question) => ownAnswers[question];

  CheckinAnswer? partnerAnswerFor(int question) => partnerAnswers[question];

  CheckinWeek withOwnAnswer(CheckinAnswer answer) => CheckinWeek(
    weekStart: weekStart,
    coupleId: coupleId,
    isPaired: isPaired,
    partnerName: partnerName,
    ownAnswers: {...ownAnswers, answer.question: answer},
    partnerAnswers: partnerAnswers,
  );

  CheckinWeek withoutAnswer(int question) => CheckinWeek(
    weekStart: weekStart,
    coupleId: coupleId,
    isPaired: isPaired,
    partnerName: partnerName,
    ownAnswers: {...ownAnswers}..remove(question),
    partnerAnswers: partnerAnswers,
  );

  @override
  List<Object?> get props => [
    weekStart,
    coupleId,
    isPaired,
    partnerName,
    _fingerprint(ownAnswers),
    _fingerprint(partnerAnswers),
  ];

  static List<String> _fingerprint(Map<int, CheckinAnswer> answers) {
    final questions = answers.keys.toList()..sort();

    return [
      for (final question in questions)
        '$question:${answers[question]!.id}:${answers[question]!.body}',
    ];
  }
}
