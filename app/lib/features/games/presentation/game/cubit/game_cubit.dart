import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_session.dart';
import 'package:flutter_bloc_starter/features/games/data/repositories/games_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';

part 'game_state.dart';

class GameCubit({
  required final GamesRepository _repository,
  required final ProfileRepository _profileRepository,
}) extends Cubit<GameState> {
  this : super(const GameState());

  GameKind? _kind;

  /// Reads [kind] with its latest session; calling it again refreshes the same game.
  Future<void> load(GameKind kind) async {
    _kind = kind;
    await refresh();
  }

  /// Reads the game again on resume, pull to refresh or "check again".
  ///
  /// A person who already answered everything also asks the server to finish, which only
  /// succeeds once the partner has answered everything too.
  Future<void> refresh() async {
    final kind = _kind;
    if (isClosed || kind == null) return;
    if (state.play is! Success) emit(state.copyWith(play: const Loading()));
    try {
      final settings = await _profileRepository.getMySettings();
      var play = await _repository.getPlay(kind: kind, locale: settings.locale);
      if (isClosed) return;
      play = await _finishIfReady(play);
      if (isClosed) return;
      emit(state.copyWith(play: Success(play)));
    } catch (exception) {
      if (isClosed || state.play is Success) return;
      emit(state.copyWith(play: Failure.fromObject(exception)));
    }
  }

  void onDraftChanged(String draft) {
    if (state.isBusy) return;
    emit(state.copyWith(draft: draft));
  }

  /// Sends the invitation for a new session.
  Future<void> invite() async {
    final play = state.current;
    if (play == null || state.isBusy || play.available.isEmpty) return;

    await _act(() => _repository.invite(play));
  }

  /// Accepts the partner's invitation.
  Future<void> join() async {
    final session = state.current?.session;
    if (session == null || state.isBusy) return;

    await _act(() => _repository.join(session));
  }

  /// Cancels the open session for both people.
  Future<void> cancel() async {
    final session = state.current?.session;
    if (session == null || state.isBusy) return;

    await _act(() => _repository.cancel(session));
  }

  /// Saves the draft as the answer of the current step.
  Future<void> submit() async {
    final play = state.current;
    if (play == null || !state.canSubmit) return;

    await _answer(play, state.draft);
  }

  /// Saves a skip for the current step so the session can still finish.
  Future<void> skip() async {
    final play = state.current;
    if (play == null || state.isBusy) return;

    await _answer(play, gameSkippedAnswer);
  }

  Future<void> _answer(GamePlay play, String answer) async {
    final session = play.session;
    if (session == null || play.isOwnDone) return;
    final step = play.currentStep;

    emit(state.copyWith(action: const Loading()));
    try {
      await _repository.answer(session: session, step: step, answer: answer);
      if (isClosed) return;
      var next = play.withOwnAnswer(step, answer);
      if (next.isOwnDone) next = await _finishIfReady(next);
      if (isClosed) return;
      emit(state.copyWith(play: Success(next), draft: '', action: const Success(null)));
      emit(state.copyWith(action: const Initial()));
    } catch (exception) {
      _fail(exception);
    }
  }

  Future<void> _act(Future<Object?> Function() action) async {
    emit(state.copyWith(action: const Loading()));
    try {
      await action();
      if (isClosed) return;
      emit(state.copyWith(draft: '', action: const Success(null)));
      await refresh();
      if (isClosed) return;
      emit(state.copyWith(action: const Initial()));
    } catch (exception) {
      _fail(exception);
    }
  }

  Future<GamePlay> _finishIfReady(GamePlay play) async {
    final session = play.session;
    if (session == null || session.status != GameStatus.active || !play.isOwnDone) return play;
    final finished = await _repository.finishIfComplete(session);
    if (finished == null) return play;
    final kind = _kind;
    if (kind == null) return play.withSession(finished);
    final settings = await _profileRepository.getMySettings();

    return _repository.getPlay(kind: kind, locale: settings.locale);
  }

  void _fail(Object exception) {
    if (isClosed) return;
    emit(state.copyWith(action: Failure.fromObject(exception)));
    emit(state.copyWith(action: const Initial()));
  }
}
