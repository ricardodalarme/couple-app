import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:flutter_bloc_starter/features/programs/data/repositories/programs_repository.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/programs/cubit/programs_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockProgramsRepository() extends Mock implements ProgramsRepository;

class _MockPlusRepository() extends Mock implements PlusRepository;

void main() {
  late ProgramsRepository repository;
  late PlusRepository plus;

  const free = Program(
    slug: 'gratitude-7',
    title: '7 dias de gratidão',
    lessons: [Lesson(slug: 'd1', title: 'Primeira', day: 1)],
  );
  const paid = Program(
    slug: 'reconnect-5',
    title: 'Reencontro',
    plusOnly: true,
    lessons: [Lesson(slug: 'd1', title: 'Primeira', day: 1)],
  );

  setUp(() {
    repository = _MockProgramsRepository();
    plus = _MockPlusRepository();
    when(() => repository.getPrograms()).thenAnswer((_) async => [free, paid]);
    when(() => plus.getPlus()).thenAnswer((_) async => const PlusState(hasPlus: false));
  });

  ProgramsCubit build() => ProgramsCubit(programsRepository: repository, plusRepository: plus);

  test('the hub reads the programs and what the account has', () async {
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load();

    final programs = (cubit.state.programs as Success<List<Program>>).value;
    expect(programs.map((program) => program.slug), ['gratitude-7', 'reconnect-5']);
    expect(cubit.state.hasPlus, isFalse);
    expect(cubit.state.isLocked(free), isFalse);
    expect(cubit.state.isLocked(paid), isTrue);
  });

  test('Plus opens the plus-only programs', () async {
    when(() => plus.getPlus()).thenAnswer((_) async => const PlusState(hasPlus: true));
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load();

    expect(cubit.state.isLocked(paid), isFalse);
  });

  test('a failed read is honest and retryable', () async {
    when(() => repository.getPrograms()).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load();

    expect(cubit.state.programs, isA<Failure>());
  });

  test('an empty language stays empty', () async {
    when(() => repository.getPrograms()).thenAnswer((_) async => []);
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load();

    expect((cubit.state.programs as Success<List<Program>>).value, isEmpty);
  });
}
