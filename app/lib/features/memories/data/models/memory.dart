import 'package:equatable/equatable.dart';

/// The longest title and note the server accepts.
const int memoryTitleMaxLength = 160;
const int memoryBodyMaxLength = 3000;

/// A memory the couple keeps.
final class const Memory({
  required final String id,
  required final String title,
  required final DateTime happenedOn,
  final String? body,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => Memory(id: 'fake', title: 'Nosso primeiro jantar', happenedOn: DateTime(2026));

  @override
  List<Object?> get props => [id, title, happenedOn, body];
}
