import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/privacy/data/models/consent.dart';
import 'package:flutter_bloc_starter/features/privacy/data/repositories/privacy_repository.dart';

part 'consents_state.dart';

class ConsentsCubit({required final PrivacyRepository _repository}) extends Cubit<ConsentsState> {
  this : super(const ConsentsState());

  Future<void> load() async {
    emit(state.copyWith(consents: const Loading()));
    try {
      emit(state.copyWith(consents: Success(await _repository.getConsents())));
    } catch (exception) {
      emit(state.copyWith(consents: Failure.fromObject(exception)));
    }
  }

  /// Flips an optional consent; required ones never change from here.
  Future<void> toggle(ConsentKind kind) async {
    final current = state.consents;
    if (current is! Success<Map<ConsentKind, bool>> || kind.isRequired) return;
    if (state.saveAction.isLoading) return;

    final previous = current.value;
    final next = !(previous[kind] ?? false);
    emit(state.copyWith(consents: Success({...previous, kind: next}), saveAction: const Loading()));
    try {
      await _repository.setConsent(kind, granted: next);
      emit(state.copyWith(saveAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(consents: Success(previous), saveAction: Failure.fromObject(exception)));
    }
  }
}
