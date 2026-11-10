part of 'manage_plus_cubit.dart';

final class const ManagePlusState({
  final Resource<PlusState> plus = const Loading(),
  final Resource<Uri> manageAction = const Initial(),
}) with Equatable {
  ManagePlusState copyWith({Resource<PlusState>? plus, Resource<Uri>? manageAction}) {
    return ManagePlusState(
      plus: plus ?? this.plus,
      manageAction: manageAction ?? this.manageAction,
    );
  }

  @override
  List<Object?> get props => [plus, manageAction];
}
