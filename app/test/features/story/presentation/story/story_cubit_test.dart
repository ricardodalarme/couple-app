import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/story/data/models/story_card.dart';
import 'package:flutter_bloc_starter/features/story/data/repositories/story_repository.dart';
import 'package:flutter_bloc_starter/features/story/presentation/story/cubit/story_cubit.dart';
import 'package:flutter_bloc_starter/features/story/presentation/story/widgets/story_painter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockStoryRepository() extends Mock implements StoryRepository;

void main() {
  late StoryRepository repository;
  const labels = StoryLabels(days: 'dias', together: 'juntos');
  const base = StoryCard(daysTogether: 1000, years: 2, months: 9);

  setUpAll(() => registerFallbackValue(Uint8List(0)));

  setUp(() {
    repository = _MockStoryRepository();
    when(repository.getStory).thenAnswer((_) async => (card: base, names: 'Ana & Bia'));
    when(() => repository.share(any())).thenAnswer((_) async {});
  });

  StoryCubit build() => StoryCubit(
    storyRepository: repository,
    renderStory: (_, _) async => Uint8List.fromList([1, 2, 3]),
  );

  test('the image carries no names or text unless chosen', () async {
    final cubit = build();
    await cubit.load();

    expect(cubit.card, base);
  });

  test('names and a phrase appear only when chosen', () async {
    final cubit = build();
    await cubit.load();

    cubit
      ..onNamesToggled(value: true)
      ..onPhraseChanged('  Ainda tem muito pela frente ');

    expect(cubit.card?.names, 'Ana & Bia');
    expect(cubit.card?.phrase, 'Ainda tem muito pela frente');
  });

  test('without a together-since date there is no image to make', () async {
    when(repository.getStory).thenAnswer((_) async => (card: null, names: ''));
    final cubit = build();
    await cubit.load();

    await cubit.share(labels);

    expect(cubit.card, isNull);
    verifyNever(() => repository.share(any()));
  });

  test('sharing renders the image and hands it to the share sheet', () async {
    final cubit = build();
    await cubit.load();

    await cubit.share(labels);

    verify(() => repository.share(Uint8List.fromList([1, 2, 3]))).called(1);
  });

  test('a failed share is a failure that does not stick', () async {
    when(() => repository.share(any())).thenThrow(Exception('x'));
    final cubit = build();
    await cubit.load();

    await cubit.share(labels);

    expect(cubit.state.shareAction, isA<Initial>());
  });

  testWidgets('the renderer produces a PNG', (tester) async {
    final bytes = await tester.runAsync(() => renderStoryPng(base, labels));

    expect(bytes!.sublist(0, 4), [0x89, 0x50, 0x4e, 0x47]);
  });
}
