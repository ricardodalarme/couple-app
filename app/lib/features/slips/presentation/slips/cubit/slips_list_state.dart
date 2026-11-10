part of 'slips_list_cubit.dart';

/// Which slips the list shows.
enum SlipsScope() {
  /// Slips written since Monday.
  week,

  /// Every slip.
  all,
}

final class const SlipsListState({
  final Resource<List<SlipEntry>> slips = const Loading(),
  final SlipsScope scope = SlipsScope.week,
  final bool hasNext = false,
  final String? cursor,
  final bool isLoadingMore = false,
}) with Equatable {
  SlipsListState copyWith({
    Resource<List<SlipEntry>>? slips,
    SlipsScope? scope,
    bool? hasNext,
    String? cursor,
    bool? isLoadingMore,
  }) {
    return SlipsListState(
      slips: slips ?? this.slips,
      scope: scope ?? this.scope,
      hasNext: hasNext ?? this.hasNext,
      cursor: cursor ?? this.cursor,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [slips, scope, hasNext, cursor, isLoadingMore];
}
