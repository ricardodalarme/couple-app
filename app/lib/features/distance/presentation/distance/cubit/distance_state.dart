part of 'distance_cubit.dart';

final class const DistanceState({final Resource<DistanceInfo> distance = const Loading()})
    with Equatable {
  DistanceState copyWith({Resource<DistanceInfo>? distance}) =>
      DistanceState(distance: distance ?? this.distance);

  @override
  List<Object?> get props => [distance];
}
