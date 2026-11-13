part of 'memories_cubit.dart';

/// Which view of Memórias is showing.
enum MemoriesView() {
  timeline,
  jar,
}

final class const MemoriesState({
  final Resource<List<Memory>> memories = const Loading(),
  final FormInput<String> title = const FormInput(''),
  final FormInput<String> body = const FormInput(''),
  final FormInput<String> place = const FormInput(''),
  final Resource<void> saveAction = const Initial(),
  final Resource<String?> jarAction = const Initial(),
  final bool isFormOpen = false,
  final MemoriesView view = MemoriesView.timeline,
}) with Equatable {
  /// Whether the person has started writing a memory.
  bool get isFormDirty =>
      title.value.trim().isNotEmpty ||
      body.value.trim().isNotEmpty ||
      place.value.trim().isNotEmpty;

  /// Whether the form is on screen, opened on purpose or already started.
  bool get showsForm => isFormOpen || isFormDirty;

  /// Whether the typed place reads like an address instead of a name.
  bool get placeLooksLikeAddress => place.value.trim().isNotEmpty && looksLikeAddress(place.value);

  MemoriesState copyWith({
    Resource<List<Memory>>? memories,
    FormInput<String>? title,
    FormInput<String>? body,
    FormInput<String>? place,
    Resource<void>? saveAction,
    Resource<String?>? jarAction,
    bool? isFormOpen,
    MemoriesView? view,
  }) {
    return MemoriesState(
      memories: memories ?? this.memories,
      title: title ?? this.title,
      body: body ?? this.body,
      place: place ?? this.place,
      saveAction: saveAction ?? this.saveAction,
      jarAction: jarAction ?? this.jarAction,
      isFormOpen: isFormOpen ?? this.isFormOpen,
      view: view ?? this.view,
    );
  }

  @override
  List<Object?> get props => [
    memories,
    title,
    body,
    place,
    saveAction,
    jarAction,
    isFormOpen,
    view,
  ];
}
