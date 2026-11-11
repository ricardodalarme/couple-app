part of 'learned_items_cubit.dart';

final class const LearnedItemsState({
  final Resource<List<LearnedItem>> items = const Loading(),
  final Resource<void> action = const Initial(),
}) with Equatable {
  /// Items the person still has to review, newest first.
  List<LearnedItem> get pending => _ofStatus(LearnedStatus.pending);

  /// Items the person kept, newest first.
  List<LearnedItem> get confirmed => _ofStatus(LearnedStatus.confirmed);

  List<LearnedItem> _ofStatus(LearnedStatus status) => switch (items) {
    Success(:final value) => [
      for (final item in value)
        if (item.status == status) item,
    ],
    _ => const [],
  };

  LearnedItemsState copyWith({Resource<List<LearnedItem>>? items, Resource<void>? action}) =>
      LearnedItemsState(items: items ?? this.items, action: action ?? this.action);

  @override
  List<Object?> get props => [items, action];
}
