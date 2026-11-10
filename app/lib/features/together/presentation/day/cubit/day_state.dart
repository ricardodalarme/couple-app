part of 'day_cubit.dart';

final class DayState({
  required final DateTime day,
  final Resource<DayContent> content = const Loading(),
}) with Equatable {
  DayState copyWith({DateTime? day, Resource<DayContent>? content}) {
    return DayState(day: day ?? this.day, content: content ?? this.content);
  }

  @override
  List<Object?> get props => [day, content];
}
