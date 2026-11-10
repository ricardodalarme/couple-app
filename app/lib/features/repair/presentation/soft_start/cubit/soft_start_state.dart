part of 'soft_start_cubit.dart';

final class const SoftStartState({
  final String feeling = '',
  final String situation = '',
  final String need = '',
}) with Equatable {
  /// Whether all three blanks are filled.
  bool get isComplete =>
      feeling.trim().isNotEmpty && situation.trim().isNotEmpty && need.trim().isNotEmpty;

  SoftStartState copyWith({String? feeling, String? situation, String? need}) {
    return SoftStartState(
      feeling: feeling ?? this.feeling,
      situation: situation ?? this.situation,
      need: need ?? this.need,
    );
  }

  @override
  List<Object?> get props => [feeling, situation, need];
}
