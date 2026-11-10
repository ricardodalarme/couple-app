part of 'need_cubit.dart';

final class const NeedState({final String? need, final Resource<void> sendAction = const Initial()})
    with Equatable {
  NeedState copyWith({String? need, bool clearNeed = false, Resource<void>? sendAction}) {
    return NeedState(
      need: clearNeed ? null : need ?? this.need,
      sendAction: sendAction ?? this.sendAction,
    );
  }

  @override
  List<Object?> get props => [need, sendAction];
}
