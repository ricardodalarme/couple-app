import 'package:flutter_bloc_starter/features/safety/data/models/help_line.dart';
import 'package:flutter_bloc_starter/features/safety/data/repositories/help_lines_repository.dart';
import 'package:flutter_bloc_starter/features/safety/presentation/help_lines/cubit/help_lines_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockHelpLinesRepository() extends Mock implements HelpLinesRepository;

void main() {
  late HelpLinesRepository repository;

  setUp(() {
    repository = _MockHelpLinesRepository();
    when(() => repository.getHelpLines()).thenReturn(bundledHelpLines);
    when(() => repository.copy(any())).thenAnswer((_) async {});
  });

  HelpLinesCubit build() => HelpLinesCubit(repository: repository);

  test('the bundled lines are there without any network', () {
    expect(build().state.lines, bundledHelpLines);
    expect(bundledHelpLines.map((line) => line.number), ['188', '180', '190']);
  });

  test('one tap dials the number', () async {
    when(() => repository.call('188')).thenAnswer((_) async => true);
    final cubit = build();

    await cubit.reach(bundledHelpLines.first);

    verify(() => repository.call('188')).called(1);
    verifyNever(() => repository.copy(any()));
    expect(cubit.state.copiedKey, isNull);
  });

  test('a device that cannot call copies the number instead', () async {
    when(() => repository.call('180')).thenAnswer((_) async => false);
    final cubit = build();

    await cubit.reach(bundledHelpLines[1]);

    verify(() => repository.copy('180')).called(1);
    expect(cubit.state.copiedKey, 'women');
  });

  test('copied feedback can be cleared', () async {
    final cubit = build();
    await cubit.copy(bundledHelpLines.first);

    cubit.clearCopied();

    expect(cubit.state.copiedKey, isNull);
  });
}
