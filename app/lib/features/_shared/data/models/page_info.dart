import 'package:equatable/equatable.dart';

class const PageInfo({
  required final String? startCursor,
  required final String? endCursor,
  required final bool? hasNextPage,
  required final bool? hasPreviousPage,
}) with Equatable {
  @override
  List<Object?> get props => [startCursor, endCursor, hasNextPage, hasPreviousPage];
}
