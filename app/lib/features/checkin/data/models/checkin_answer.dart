import 'package:equatable/equatable.dart';

final class const CheckinAnswer({
  required final String id,
  required final int question,
  required final String body,
}) with Equatable {
  @override
  List<Object?> get props => [id, question, body];
}
