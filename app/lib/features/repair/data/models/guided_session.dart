import 'dart:convert';

import 'package:equatable/equatable.dart';

/// How many written steps the guided repair has: what happened, what is needed, what can be offered.
const int guidedWrittenSteps = 3;

/// The longest answer to one guided step, so the three fit in the stored draft.
const int guidedAnswerMaxLength = 300;

/// A guided repair in progress, private to the person.
final class const GuidedSession({
  required final String id,
  final int step = 0,
  final List<String> answers = const ['', '', ''],
}) with Equatable {
  /// Reads the stored draft; anything unreadable gives empty answers.
  factory fromStored({required String id, required int step, String? draft}) {
    var answers = const ['', '', ''];
    if (draft != null) {
      try {
        final decoded = (jsonDecode(draft) as List<dynamic>).cast<String>();
        if (decoded.length == guidedWrittenSteps) answers = decoded;
      } on Object {
        answers = const ['', '', ''];
      }
    }

    return GuidedSession(id: id, step: step.clamp(0, guidedWrittenSteps), answers: answers);
  }

  /// The answers as stored in the session draft.
  String get draft => jsonEncode(answers);

  GuidedSession copyWith({int? step, List<String>? answers}) =>
      GuidedSession(id: id, step: step ?? this.step, answers: answers ?? this.answers);

  @override
  List<Object?> get props => [id, step, answers];
}

/// One thing the person learned, private and deletable.
final class const Learning({
  required final String id,
  required final String kind,
  required final String note,
  required final DateTime createdAt,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() =>
      Learning(id: 'fake', kind: 'need', note: 'Preciso de um tempo', createdAt: DateTime(2026));

  @override
  List<Object?> get props => [id, kind, note, createdAt];
}

/// The kinds of learning, matching the server values.
const List<String> learningKinds = ['trigger', 'need', 'good_fix'];

/// How the person feels after the repair, matching the server values.
const List<String> feelingsAfter = ['calmer', 'still_tense', 'need_more_time'];
