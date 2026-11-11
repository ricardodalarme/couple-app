import 'package:equatable/equatable.dart';

/// The three steps of the guided hard conversation.
enum HardConversationStep() {
  whatHappened,
  whatINeed,
  howToSay,
}

/// The tone the model is asked to use when it writes the opening sentence.
enum HardConversationTone() {
  neutral,
  gentler,
  moreDirect,
}

/// The longest answer kept from one step.
const int hardConversationAnswerMaxLength = 280;

/// The longest opening sentence, matching the note the server accepts.
const int hardConversationMessageMaxLength = 280;

/// The chip that asks the person to write what happened themselves.
const String hardConversationOtherChoice = 'other';

/// What the person prepared, kept on the device for a day.
final class const HardConversationDraft({
  required final HardConversationStep step,
  required final String whatChoice,
  required final String whatText,
  required final String needChoice,
  required final String needText,
  required final String message,
  required final DateTime savedAt,
}) with Equatable {
  factory fromMap(Map<String, dynamic> map) => HardConversationDraft(
    step: HardConversationStep.values.firstWhere(
      (step) => step.name == map['step'],
      orElse: () => HardConversationStep.whatHappened,
    ),
    whatChoice: map['whatChoice'] as String? ?? '',
    whatText: map['whatText'] as String? ?? '',
    needChoice: map['needChoice'] as String? ?? '',
    needText: map['needText'] as String? ?? '',
    message: map['message'] as String? ?? '',
    savedAt: DateTime.parse(map['savedAt'] as String),
  );

  Map<String, dynamic> toMap() => {
    'step': step.name,
    'whatChoice': whatChoice,
    'whatText': whatText,
    'needChoice': needChoice,
    'needText': needText,
    'message': message,
    'savedAt': savedAt.toIso8601String(),
  };

  /// Whether nothing was written yet, so there is no draft to keep.
  bool get isEmpty =>
      whatChoice.isEmpty &&
      whatText.trim().isEmpty &&
      needChoice.isEmpty &&
      needText.trim().isEmpty &&
      message.trim().isEmpty;

  @override
  List<Object?> get props => [step, whatChoice, whatText, needChoice, needText, message, savedAt];
}
