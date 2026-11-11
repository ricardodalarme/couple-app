import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const first = Lesson(slug: 'd1', title: 'Primeira', day: 1, body: 'Um obrigado.');
  const second = Lesson(slug: 'd2', title: 'Segunda', day: 2, body: 'Seja específico.');

  const free = Program(
    slug: 'gratitude-7',
    title: '7 dias de gratidão',
    body: 'Sete dias para perceber o que já existe.',
    lessons: [first, second],
  );

  const paid = Program(
    slug: 'reconnect-5',
    title: 'Reencontro',
    plusOnly: true,
    lessons: [first, second],
  );

  test('a free program always opens its first lesson', () {
    expect(free.isLessonOpen(hasPlus: false, lesson: first), isTrue);
    expect(free.isLessonOpen(hasPlus: true, lesson: first), isTrue);
  });

  test('a free program locks its later lessons without Plus', () {
    expect(free.isLessonOpen(hasPlus: false, lesson: second), isFalse);
    expect(free.isLessonOpen(hasPlus: true, lesson: second), isTrue);
  });

  test('a plus-only program locks every lesson without Plus', () {
    expect(paid.isLessonOpen(hasPlus: false, lesson: first), isFalse);
    expect(paid.isLessonOpen(hasPlus: true, lesson: first), isTrue);
  });

  test('the lesson count is the number of lessons that exist', () {
    expect(free.lessonCount, 2);
    expect(const Program(slug: 'grief-together', title: 'Luto, juntos').lessonCount, 0);
  });

  test('the sensitive flag separates two otherwise equal programs', () {
    const sensitive = Program(slug: 'grief-together', title: 'Luto, juntos', sensitive: true);
    const plain = Program(slug: 'grief-together', title: 'Luto, juntos');

    expect(sensitive.sensitive, isTrue);
    expect(plain.sensitive, isFalse);
    expect(sensitive, isNot(plain));
  });

  test('the free preview follows the list order, not the day number', () {
    const spaced = Lesson(slug: 'd3', title: 'Terceira', day: 3);
    const later = Lesson(slug: 'd8', title: 'Oitava', day: 8);
    const program = Program(slug: 'spaced', title: 'Espaçado', lessons: [spaced, later]);

    expect(program.isLessonOpen(hasPlus: false, lesson: spaced), isTrue);
    expect(program.isLessonOpen(hasPlus: false, lesson: later), isFalse);
    expect(program.nextLessonAfter(spaced), later);
    expect(program.nextLessonAfter(later), isNull);
  });
}
