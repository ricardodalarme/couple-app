import 'package:equatable/equatable.dart';

/// The longest a capsule can be.
const int capsuleBodyMaxLength = 3000;

/// How far ahead a capsule can open.
const int capsuleMaxYears = 50;

/// A message that stays closed until [opensOn].
///
/// [body] is null while it is still closed, even for the person who wrote it.
final class const Capsule({
  required final String id,
  required final DateTime opensOn,
  required final bool isMine,
  required final bool isShared,
  final String? body,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => Capsule(
    id: 'fake',
    opensOn: DateTime(2027),
    isMine: true,
    isShared: false,
    body: 'Para você',
  );

  /// Whether the date has come and the text can be read.
  bool get isOpen => body != null;

  @override
  List<Object?> get props => [id, opensOn, isMine, isShared, body];
}

/// The earliest day a new capsule can open.
///
/// The server requires seven days counted from its own UTC date, so one extra day keeps a device
/// that is behind UTC from being refused in the evening.
DateTime capsuleEarliest(DateTime today) => DateTime(today.year, today.month, today.day + 8);

/// The latest day a new capsule can open, one day inside the server's fifty-year limit.
DateTime capsuleLatest(DateTime today) =>
    DateTime(today.year + capsuleMaxYears, today.month, today.day - 1);
