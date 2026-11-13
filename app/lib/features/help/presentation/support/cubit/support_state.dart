part of 'support_cubit.dart';

final RegExp _emailShape = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

final class const SupportState({
  final SupportTopic topic = SupportTopic.account,
  final FormInput<String> message = const FormInput(''),
  final FormInput<String> replyEmail = const FormInput(''),
  final Resource<SupportSendOutcome> sendAction = const Initial(),
}) with Equatable {
  SupportState copyWith({
    SupportTopic? topic,
    FormInput<String>? message,
    FormInput<String>? replyEmail,
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
