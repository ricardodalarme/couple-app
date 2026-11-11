import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/capsules/data/models/capsule.dart';
import 'package:flutter_bloc_starter/features/capsules/data/repositories/capsules_repository.dart';
import 'package:uuid/uuid.dart';

part 'capsules_state.dart';

class CapsulesCubit({required final CapsulesRepository _capsulesRepository})
    extends Cubit<CapsulesState> {
  this : super(const CapsulesState());

  final Uuid _uuid = const Uuid();
  String? _pendingId;

  Future<void> load() async {
    if (state.capsules is! Success) emit(state.copyWith(capsules: const Loading()));
    try {
      emit(state.copyWith(capsules: Success(await _capsulesRepository.getCapsules())));
    } catch (exception) {
      if (state.capsules is Success) return;
      emit(state.copyWith(capsules: Failure.fromObject(exception)));
    }
  }

  void onBodyChanged(String body) => emit(state.copyWith(body: body));

  void onOpensOnChanged(DateTime date) => emit(state.copyWith(opensOn: date));

  void onSharedChanged(bool value) => emit(state.copyWith(isShared: value));

  /// Saves the capsule; on failure the text stays so it can be sent again.
  Future<void> save({DateTime? now}) async {
    final opensOn = state.opensOn;
    if (opensOn == null || !state.canSave(now ?? DateTime.now()) || state.saveAction.isLoading) {
      return;
    }

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _capsulesRepository.add(
        id: _pendingId ??= _uuid.v4(),
        body: state.body,
        opensOn: opensOn,
        isShared: state.isShared,
      );
      _pendingId = null;
      emit(state.copyWith(body: '', clearDate: true, saveAction: const Success(null)));
      await load();
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(saveAction: const Initial()));
  }

  Future<void> delete(Capsule capsule) async {
    try {
      await _capsulesRepository.delete(capsule.id);
      await load();
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }
}
