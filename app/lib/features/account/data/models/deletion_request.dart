import 'package:equatable/equatable.dart';

/// A pending account deletion; the account is purged after [purgeAfter].
final class const DeletionRequest({
  required final DateTime requestedAt,
  required final DateTime purgeAfter,
}) with Equatable {
  @override
  List<Object?> get props => [requestedAt, purgeAfter];
}
