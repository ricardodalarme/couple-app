import 'package:equatable/equatable.dart';

/// A help line a person can call; [number] is what is dialled and shown.
final class const HelpLine({
  required final String key,
  required final String number,
  final bool isVerified = false,
}) with Equatable {
  @override
  List<Object?> get props => [key, number, isVerified];
}

/// The bundled help lines, shown even offline.
///
/// The numbers come from the design board and are not yet verified by a person (decision
/// DEC-004); nothing here is read from the server or stored, and no event is ever recorded.
const List<HelpLine> bundledHelpLines = [
  HelpLine(key: 'cvv', number: '188'),
  HelpLine(key: 'women', number: '180'),
  HelpLine(key: 'emergency', number: '190'),
];
