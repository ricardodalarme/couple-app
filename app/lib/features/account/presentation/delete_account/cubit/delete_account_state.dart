part of 'delete_account_cubit.dart';

final class const DeleteAccountState({final Resource<void> deletion = const Initial()})
    with Equatable {
  DeleteAccountState copyWith({Resource<void>? deletion}) {
    return DeleteAccountState(deletion: deletion ?? this.deletion);
  }

  @override
  List<Object?> get props => [deletion];
}
