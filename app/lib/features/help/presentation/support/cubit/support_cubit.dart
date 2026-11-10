import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/help/data/models/support_topic.dart';
import 'package:flutter_bloc_starter/features/help/data/repositories/support_repository.dart';
import 'package:flutter_bloc_starter/features/help/data/services/support_app_version_service.dart';

part 'support_state.dart';

/// The longest message the server accepts.
const int supportMessageMaxLength = 2000;

/// The longest reply email the server accepts.
const int supportReplyEmailMaxLength = 254;

class SupportCubit({
  required final SupportRepository _repository,
  required final AuthenticationRepository _authenticationRepository,
  required final SupportAppVersionService _appVersionService,
}) extends Cubit<SupportState> {
  this : super(const SupportState());

  void start(SupportTopic topic) => emit(state.copyWith(topic: topic));

  void onTopicChosen(SupportTopic topic) => emit(state.copyWith(topic: topic));

  void onMessageChanged(String message) => emit(state.copyWith(message: message));

  void onReplyEmailChanged(String replyEmail) => emit(state.copyWith(replyEmail: replyEmail));

  Future<void> send() async {
    if (!state.canSend || state.sendAction.isLoading || state.sendAction is Success) return;

    final authorId = _authenticationRepository.currentUserId;
    if (authorId == null) {
      emit(
        state.copyWith(sendAction: const Failure(LocalizedException(l10nKey: 'UNAUTHENTICATED'))),
      );
      emit(state.copyWith(sendAction: const Initial()));
      return;
    }

    emit(state.copyWith(sendAction: const Loading()));
    try {
      final replyEmail = state.replyEmail.trim();
      final outcome = await _repository.send(
        authorId: authorId,
        topic: state.topic,
        message: state.message.trim(),
        replyEmail: replyEmail.isEmpty ? null : replyEmail,
        appVersion: await _appVersionService.read(),
      );
      emit(state.copyWith(sendAction: Success(outcome)));
    } catch (exception) {
      emit(state.copyWith(sendAction: Failure.fromObject(exception)));
      emit(state.copyWith(sendAction: const Initial()));
    }
  }
}
