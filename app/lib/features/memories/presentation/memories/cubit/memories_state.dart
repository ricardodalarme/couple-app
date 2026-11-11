part of 'memories_cubit.dart';

final class const MemoriesState({
  final Resource<List<Memory>> memories = const Loading(),
  final String title = '',
  final String body = '',
  final String place = '',
  final Resource<void> saveAction = const Initial(),
  final Resource<String?> jarAction = const Initial(),
}) with Equatable {
  /// Whether the title is filled and every text is within its limit.
  bool get canSave =>
      title.trim().isNotEmpty &&
      title.length <= memoryTitleMaxLength &&
      body.length <= memoryBodyMaxLength &&
      place.length <= memoryPlaceMaxLength;

  /// Whether the typed place reads like an address instead of a name.
  bool get placeLooksLikeAddress => place.trim().isNotEmpty && looksLikeAddress(place);

  MemoriesState copyWith({
    Resource<List<Memory>>? memories,
    String? title,
    String? body,
    String? place,
    Resource<void>? saveAction,
    Resource<String?>? jarAction,
  }) {
    return MemoriesState(
      memories: memories ?? this.memories,
      title: title ?? this.title,
      body: body ?? this.body,
      place: place ?? this.place,
      saveAction: saveAction ?? this.saveAction,
      jarAction: jarAction ?? this.jarAction,
    );
  }

  @override
  List<Object?> get props => [memories, title, body, place, saveAction, jarAction];
}
