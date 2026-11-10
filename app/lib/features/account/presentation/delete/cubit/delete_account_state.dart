part of 'delete_account_cubit.dart';

final class const DeleteAccountState({
  final Resource<DeletionRequest?> deletion = const Initial(),
  final Resource<void> action = const Initial(),
  final String? partnerName,
}) with Equatable {
  DeletionRequest? get pending => switch (deletion) {
    Success<DeletionRequest?>(:final value) => value,
    _ => null,
  };

  DeleteAccountState copyWith({
    Resource<DeletionRequest?>? deletion,
    bool clearDeletion = false,
    Resource<void>? action,
    String? partnerName,
  }) => DeleteAccountState(
    deletion: clearDeletion ? const Success(null) : deletion ?? this.deletion,
    action: action ?? this.action,
    partnerName: partnerName ?? this.partnerName,
  );

  @override
  List<Object?> get props => [deletion, action, partnerName];
}
