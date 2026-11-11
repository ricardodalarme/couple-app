import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/story/data/models/story_card.dart';
import 'package:flutter_bloc_starter/features/story/data/repositories/story_repository.dart';
import 'package:flutter_bloc_starter/features/story/presentation/story/widgets/story_painter.dart';

part 'story_state.dart';

/// Turns the card and its labels into the PNG that is shared.
typedef StoryRenderer = Future<Uint8List> Function(StoryCard card, StoryLabels labels);

class StoryCubit({
  required final StoryRepository _storyRepository,
  required final StoryRenderer _renderStory,
}) extends Cubit<StoryState> {
  this : super(const StoryState());

  Future<void> load() async {
    emit(state.copyWith(story: const Loading()));
    try {
      final story = await _storyRepository.getStory();
      emit(state.copyWith(story: Success(story.card), names: story.names));
    } catch (exception) {
      emit(state.copyWith(story: Failure.fromObject(exception)));
    }
  }

  void onNamesToggled({required bool value}) => emit(state.copyWith(includeNames: value));

  void onPhraseChanged(String phrase) => emit(state.copyWith(phrase: phrase));

  /// The card as it will be shared: names and the phrase only when the person chose them.
  StoryCard? get card {
    final story = state.story;
    if (story is! Success<StoryCard?>) return null;
    final base = story.value;
    if (base == null) return null;
    final phrase = state.phrase.trim();

    return StoryCard(
      daysTogether: base.daysTogether,
      years: base.years,
      months: base.months,
      names: state.includeNames && state.names.isNotEmpty ? state.names : null,
      phrase: phrase.isEmpty ? null : phrase,
    );
  }

  /// Renders the image and opens the share sheet; nothing is uploaded.
  Future<void> share(StoryLabels labels) async {
    final current = card;
    if (current == null || state.shareAction.isLoading) return;

    emit(state.copyWith(shareAction: const Loading()));
    try {
      await _storyRepository.share(await _renderStory(current, labels));
      emit(state.copyWith(shareAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(shareAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(shareAction: const Initial()));
  }
}
