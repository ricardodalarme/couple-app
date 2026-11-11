import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/chat_repository.dart';

part 'chat_settings_state.dart';

class ChatSettingsCubit({required final ChatRepository _chatRepository})
    extends Cubit<ChatSettingsState> {
  this : super(const ChatSettingsState());

  /// Reads whether the chat is on and today's usage.
  Future<void> load() async {
    emit(state.copyWith(status: const Loading()));
    try {
      final status = await _chatRepository.getStatus();
      if (isClosed) return;
      emit(
        state.copyWith(
          status: const Success(null),
          isEnabled: status.isEnabled,
          messagesLeft: status.messagesLeft,
          limit: status.limit,
          hasPlus: status.hasPlus,
        ),
      );
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(status: Failure.fromObject(exception)));
    }
  }

  /// Turns the chat on or off; the switch moves before the server confirms and returns on failure.
  Future<void> setEnabled({required bool enabled}) async {
    if (state.toggleAction.isLoading || enabled == state.isEnabled) return;

    final previous = state.isEnabled;
    emit(state.copyWith(isEnabled: enabled, toggleAction: const Loading()));
    try {
      if (enabled) {
        await _chatRepository.enable();
      } else {
        await _chatRepository.disable();
      }
      if (isClosed) return;
      emit(state.copyWith(toggleAction: const Success(null)));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(isEnabled: previous, toggleAction: Failure.fromObject(exception)));
    }
    if (isClosed) return;
    emit(state.copyWith(toggleAction: const Initial()));
  }
}
