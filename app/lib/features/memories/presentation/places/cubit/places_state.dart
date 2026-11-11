part of 'places_cubit.dart';

final class const PlacesState({final Resource<List<Place>> places = const Loading()})
    with Equatable {
  PlacesState copyWith({Resource<List<Place>>? places}) =>
      PlacesState(places: places ?? this.places);

  @override
  List<Object?> get props => [places];
}
