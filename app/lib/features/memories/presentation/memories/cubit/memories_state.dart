part of 'memories_cubit.dart';

/// Which view of Memórias is showing.
enum MemoriesView() {
  timeline,
  jar,
}

final class const MemoriesState({
  final Resource<List<Memory>> memories = const Loading(),
  final Resource<void> saveAction = const Initial(),
  final Resource<String?> jarAction = const Initial(),
  final MemoriesView view = MemoriesView.timeline,
}) with Equatable {
  MemoriesState copyWith({
    Resource<List<Memory>>? memories,
    Resource<void>? saveAction,
    Resource<String?>? jarAction,
    MemoriesView? view,
  }) {
    return MemoriesState(
      memories: memories ?? this.memories,
      saveAction: saveAction ?? this.saveAction,
      jarAction: jarAction ?? this.jarAction,
      view: view ?? this.view,
    );
  }

  @override
  List<Object?> get props => [memories, saveAction, jarAction, view];
}
