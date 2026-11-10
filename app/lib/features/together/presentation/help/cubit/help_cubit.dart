import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';

part 'help_state.dart';

/// How many tips the bad-day screen offers.
const int badDayTipCount = 3;

class HelpCubit({
  required final TogetherRepository _togetherRepository,
  required final ProfileRepository _profileRepository,
}) extends Cubit<HelpState> {
  this : super(const HelpState());

  /// Loads the bundled [kind] of content in the person's language.
  Future<void> load(String kind) async {
    emit(state.copyWith(items: const Loading()));
    try {
      final settings = await _profileRepository.getMySettings();
      final items = await _togetherRepository.getHelpContent(kind: kind, locale: settings.locale);
      emit(state.copyWith(items: Success(items)));
    } catch (exception) {
      emit(state.copyWith(items: Failure.fromObject(exception)));
    }
  }

  /// Moves to the next opener, wrapping around at the end.
  void next() {
    final items = state.items;
    if (items is! Success<List<HelpItem>> || items.value.isEmpty) return;

    emit(state.copyWith(index: (state.index + 1) % items.value.length));
  }
}
