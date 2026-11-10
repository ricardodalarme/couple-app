part of 'support_cubit.dart';

final RegExp _emailShape = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

final class const SupportState({
  final SupportTopic topic = SupportTopic.account,
  final String message = '',
  final String replyEmail = '',
  final Resource<SupportSendOutcome> sendAction = const Initial(),
}) with Equatable {
  bool get isEmailValid {
    final email = replyEmail.trim();

    return email.isEmpty ||
        (email.runes.length <= supportReplyEmailMaxLength && _emailShape.hasMatch(email));
  }

  bool get canSend =>
      message.trim().isNotEmpty &&
      message.trim().runes.length <= supportMessageMaxLength &&
      isEmailValid;

  SupportState copyWith({
    SupportTopic? topic,
    String? message,
    String? replyEmail,
    Resource<SupportSendOutcome>? sendAction,
  }) {
    return SupportState(
      topic: topic ?? this.topic,
      message: message ?? this.message,
      replyEmail: replyEmail ?? this.replyEmail,
      sendAction: sendAction ?? this.sendAction,
    );
  }

  @override
  List<Object?> get props => [topic, message, replyEmail, sendAction];
}
