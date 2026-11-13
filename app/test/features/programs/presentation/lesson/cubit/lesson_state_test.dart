import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/lesson/cubit/lesson_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Program program({bool sensitive = false}) => Program(
    slug: 'program',
    title: 'Program',
    sensitive: sensitive,
    lessons: const [
      Lesson(slug: 'day-1', title: 'One', day: 1),
      Lesson(slug: 'day-2', title: 'Two', day: 2),
    ],
  );

  test('clearStatus drops the lesson status', () {
    const state = LessonState(status: LessonStatus.done);

    expect(state.copyWith(clearStatus: true).status, isNull);
  });

  test('changing the day keeps the lesson status', () {
    const state = LessonState(status: LessonStatus.saved);

    final updated = state.copyWith(day: 2);

    expect(updated.status, LessonStatus.saved);
    expect(updated.day, 2);
  });

  test('isMissing reports a day the program does not have', () {
    final state = LessonState(program: Success(program()));

    expect(state.isMissing, isFalse);
    expect(state.copyWith(day: 3).isMissing, isTrue);
    expect(state.copyWith(program: const Loading()).isMissing, isFalse);
  });

  test('isOpen needs consent for a sensitive program', () {
    final state = LessonState(program: Success(program(sensitive: true)));

    expect(state.isOpen, isFalse);
    expect(state.copyWith(hasSensitiveConsent: true).isOpen, isTrue);
  });
}
