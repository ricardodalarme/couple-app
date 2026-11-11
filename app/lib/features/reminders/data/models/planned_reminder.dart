import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/reminders/data/models/reminder_preferences.dart';

/// Something that should happen at a given moment, before limits are applied.
final class const ReminderCandidate({
  required final ReminderKind kind,
  required final DateTime at,
  final String? key,
}) with Equatable {
  @override
  List<Object?> get props => [kind, at, key];
}

/// A local notification that will be scheduled.
final class const PlannedReminder({
  required final int id,
  required final ReminderKind kind,
  required final DateTime at,
  required final String text,
}) with Equatable {
  @override
  List<Object?> get props => [id, kind, at, text];
}
