import 'package:equatable/equatable.dart';

class PageInfo with EquatableMixin {
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
  List<Object?> get props => [
        startCursor,
        endCursor,
        hasNextPage,
        hasPreviousPage,
      ];
}
