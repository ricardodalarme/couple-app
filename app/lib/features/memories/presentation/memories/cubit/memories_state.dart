part of 'memories_cubit.dart';

final class const MemoriesState({
  final Resource<List<Memory>> memories = const Loading(),
  final String title = '',
  final String body = '',
  final Resource<void> saveAction = const Initial(),
  final Resource<String?> jarAction = const Initial(),
}) with Equatable {
  /// Whether the title is filled and both texts are within their limits.
  bool get canSave =>
      title.trim().isNotEmpty &&
      title.length <= memoryTitleMaxLength &&
      body.length <= memoryBodyMaxLength;

  MemoriesState copyWith({
    Resource<List<Memory>>? memories,
    String? title,
    String? body,
    Resource<void>? saveAction,
    Resource<String?>? jarAction,
  }) {
    return MemoriesState(
      memories: memories ?? this.memories,
      title: title ?? this.title,
      body: body ?? this.body,
      saveAction: saveAction ?? this.saveAction,
      jarAction: jarAction ?? this.jarAction,
    );
  }

  @override
  List<Object?> get props => [memories, title, body, saveAction, jarAction];
}
