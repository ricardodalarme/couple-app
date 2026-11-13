import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/capsules/data/models/capsule.dart';
import 'package:flutter_bloc_starter/features/capsules/data/repositories/capsules_repository.dart';
import 'package:form_inputs/form_inputs.dart';
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

  void onBodyChanged(String body) => emit(state.copyWith(body: FormInput(body)));

  void onOpensOnChanged(DateTime date) => emit(state.copyWith(opensOn: FormInput(date)));

  void onSharedChanged(bool value) => emit(state.copyWith(isShared: value));

  /// Saves the capsule; on failure the text stays so it can be sent again.
  Future<void> save({DateTime? now}) async {
    final today = now ?? clock.now();
    if (state.saveAction.isLoading || !_validate(today)) return;

    final opensOn = state.opensOn.value;
    if (opensOn == null) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _capsulesRepository.add(
        id: _pendingId ??= _uuid.v4(),
        body: state.body.value,
        opensOn: opensOn,
        isShared: state.isShared,
      );
      _pendingId = null;
      emit(
        state.copyWith(body: const FormInput(''), clearDate: true, saveAction: const Success(null)),
      );
      await load();
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(saveAction: const Initial()));
  }

  bool _validate(DateTime today) {
    final validatedBody = state.body.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(capsuleBodyMaxLength)]),
    );
    final validatedOpensOn = state.opensOn.validate(CapsuleDateValidator(today));

    emit(state.copyWith(body: validatedBody, opensOn: validatedOpensOn));

    return validatedBody.isValid && validatedOpensOn.isValid;
  }

  Future<void> delete(Capsule capsule) async {
    if (state.deleteAction.isLoading) return;

    emit(state.copyWith(deleteAction: const Loading()));
    try {
      await _capsulesRepository.delete(capsule.id);
      emit(state.copyWith(deleteAction: const Initial()));
      await load();
    } catch (exception) {
      emit(state.copyWith(deleteAction: Failure.fromObject(exception)));
      emit(state.copyWith(deleteAction: const Initial()));
    }
  }
}

enum CapsuleDateValidationError() {
  empty,
  outOfRange,
}

/// Accepts only an open date inside the window the server allows.
class CapsuleDateValidator(final DateTime today) implements Validator<DateTime?> {
  @override
  CapsuleDateValidationError? validate(DateTime? value) {
    if (value == null) return .empty;
    if (value.isBefore(capsuleEarliest(today)) || value.isAfter(capsuleLatest(today))) {
      return .outOfRange;
    }

    return null;
  }
}
