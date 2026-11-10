part of 'consents_cubit.dart';

final class const ConsentsState({
  final Resource<Map<ConsentKind, bool>> consents = const Loading(),
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  ConsentsState copyWith({
    Resource<Map<ConsentKind, bool>>? consents,
    Resource<void>? saveAction,
  }) =>
      ConsentsState(consents: consents ?? this.consents, saveAction: saveAction ?? this.saveAction);

  @override
  List<Object?> get props => [consents, saveAction];
}
