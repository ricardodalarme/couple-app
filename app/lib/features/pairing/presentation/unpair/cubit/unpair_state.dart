part of 'unpair_cubit.dart';

final class const UnpairState({
  final String? partnerName,
  final Resource<void> unpairAction = const Initial(),
}) with Equatable {
  UnpairState copyWith({String? partnerName, Resource<void>? unpairAction}) {
    return UnpairState(
      partnerName: partnerName ?? this.partnerName,
      unpairAction: unpairAction ?? this.unpairAction,
    );
  }

  @override
  List<Object?> get props => [partnerName, unpairAction];
}
