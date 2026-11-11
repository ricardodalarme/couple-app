part of 'games_cubit.dart';

final class const GamesState({final Resource<GamesOverview> overview = const Loading()})
    with Equatable {
  /// The loaded overview, or null while loading or failed.
  GamesOverview? get current => switch (overview) {
    Success(:final value) => value,
    _ => null,
  };

  GamesState copyWith({Resource<GamesOverview>? overview}) =>
      GamesState(overview: overview ?? this.overview);

  @override
  List<Object?> get props => [overview];
}
