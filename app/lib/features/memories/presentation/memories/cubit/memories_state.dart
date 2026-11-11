part of 'memories_cubit.dart';

final class const MemoriesState({
  final Resource<List<Memory>> memories = const Loading(),
  final String title = '',
  final String body = '',
  final String place = '',
  final Resource<void> saveAction = const Initial(),
  final Resource<String?> jarAction = const Initial(),
  final bool isFormOpen = false,
}) with Equatable {
  /// Whether the title is filled and every text is within its limit.
  bool get canSave =>
      title.trim().isNotEmpty &&
      title.length <= memoryTitleMaxLength &&
      body.length <= memoryBodyMaxLength &&
      place.length <= memoryPlaceMaxLength;

  /// Whether the person has started writing a memory.
  bool get isFormDirty =>
      title.trim().isNotEmpty || body.trim().isNotEmpty || place.trim().isNotEmpty;

  /// Whether the form is on screen, opened on purpose or already started.
  bool get showsForm => isFormOpen || isFormDirty;

  /// Whether the typed place reads like an address instead of a name.
  bool get placeLooksLikeAddress => place.trim().isNotEmpty && looksLikeAddress(place);

  MemoriesState copyWith({
    Resource<List<Memory>>? memories,
    String? title,
    String? body,
    String? place,
    Resource<void>? saveAction,
    Resource<String?>? jarAction,
    bool? isFormOpen,
  }) {
    return MemoriesState(
      memories: memories ?? this.memories,
      title: title ?? this.title,
      body: body ?? this.body,
      place: place ?? this.place,
      saveAction: saveAction ?? this.saveAction,
      jarAction: jarAction ?? this.jarAction,
      isFormOpen: isFormOpen ?? this.isFormOpen,
    );
  }

  @override
  List<Object?> get props => [memories, title, body, place, saveAction, jarAction, isFormOpen];
}
