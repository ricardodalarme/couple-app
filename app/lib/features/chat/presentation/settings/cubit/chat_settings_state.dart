part of 'chat_settings_cubit.dart';

final class const ChatSettingsState({
  final Resource<void> status = const Loading(),
  final bool isEnabled = false,
  final int messagesLeft = 0,
  final int limit = 0,
  final bool hasPlus = false,
  final Resource<void> toggleAction = const Initial(),
}) with Equatable {
  ChatSettingsState copyWith({
    Resource<void>? status,
    bool? isEnabled,
    int? messagesLeft,
    int? limit,
    bool? hasPlus,
    Resource<void>? toggleAction,
  }) {
    return ChatSettingsState(
      status: status ?? this.status,
      isEnabled: isEnabled ?? this.isEnabled,
      messagesLeft: messagesLeft ?? this.messagesLeft,
      limit: limit ?? this.limit,
      hasPlus: hasPlus ?? this.hasPlus,
      toggleAction: toggleAction ?? this.toggleAction,
    );
  }

  @override
  List<Object?> get props => [status, isEnabled, messagesLeft, limit, hasPlus, toggleAction];
}
