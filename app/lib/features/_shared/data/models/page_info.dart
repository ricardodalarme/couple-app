import 'package:equatable/equatable.dart';

class PageInfo with Equatable {
  const PageInfo({
    required this.startCursor,
    required this.endCursor,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  final String? startCursor;
  final String? endCursor;
  final bool? hasNextPage;
  final bool? hasPreviousPage;

  @override
  List<Object?> get props => [startCursor, endCursor, hasNextPage, hasPreviousPage];
}
