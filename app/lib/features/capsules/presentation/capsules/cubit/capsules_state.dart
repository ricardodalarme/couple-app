part of 'capsules_cubit.dart';

final class const CapsulesState({
  final Resource<List<Capsule>> capsules = const Loading(),
  final String body = '',
  final DateTime? opensOn,
  final bool isShared = false,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  /// Whether the text fits and the open date is between tomorrow and 50 years from [today].
  bool canSave(DateTime today) {
    final date = opensOn;
    if (date == null || body.trim().isEmpty || body.length > capsuleBodyMaxLength) return false;

    return !date.isBefore(capsuleEarliest(today)) && !date.isAfter(capsuleLatest(today));
  }

  CapsulesState copyWith({
    Resource<List<Capsule>>? capsules,
    String? body,
    DateTime? opensOn,
    bool clearDate = false,
    bool? isShared,
    Resource<void>? saveAction,
  }) {
    return CapsulesState(
      capsules: capsules ?? this.capsules,
      body: body ?? this.body,
      opensOn: clearDate ? null : opensOn ?? this.opensOn,
      isShared: isShared ?? this.isShared,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [capsules, body, opensOn, isShared, saveAction];
}
