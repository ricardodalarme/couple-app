part of 'guides_cubit.dart';

final class const GuidesState({final Resource<List<Guide>> guides = const Loading()})
    with Equatable {
  GuidesState copyWith({Resource<List<Guide>>? guides}) =>
      GuidesState(guides: guides ?? this.guides);

  @override
  List<Object?> get props => [guides];
}
