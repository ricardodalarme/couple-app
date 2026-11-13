import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/partner/data/models/partner_fact.dart';
import 'package:flutter_bloc_starter/features/partner/data/repositories/partner_repository.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:uuid/uuid.dart';

part 'partner_profile_state.dart';

class PartnerProfileCubit({required final PartnerRepository _partnerRepository})
    extends Cubit<PartnerProfileState> {
  this : super(const PartnerProfileState());

  final Uuid _uuid = const Uuid();
  String? _pendingId;

  Future<void> load() async {
    if (state.facts is! Success) emit(state.copyWith(facts: const Loading()));
    try {
      emit(state.copyWith(facts: Success(await _partnerRepository.getFacts())));
    } catch (exception) {
      if (state.facts is Success) return;
      emit(state.copyWith(facts: Failure.fromObject(exception)));
    }
  }

  void onLabelChanged(String label) => emit(state.copyWith(label: FormInput(label)));

  void onValueChanged(String value) => emit(state.copyWith(value: FormInput(value)));

  void onCategoryToggled(String category) {
    final isSame = state.category == category;
    emit(state.copyWith(category: isSame ? null : category, clearCategory: isSame));
  }

  /// Saves the typed note; on failure the text stays so it can be sent again.
  Future<void> save() async {
    if (state.saveAction.isLoading || !_validate()) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _partnerRepository.addFact(
        id: _pendingId ??= _uuid.v4(),
        label: state.label.value,
        value: state.value.value,
        category: state.category,
      );
      _pendingId = null;
      emit(
        state.copyWith(
          label: const FormInput(''),
          value: const FormInput(''),
          clearCategory: true,
          saveAction: const Success(null),
        ),
      );
      await load();
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(saveAction: const Initial()));
  }

  Future<void> delete(PartnerFact fact) async {
    try {
      await _partnerRepository.deleteFact(fact.id);
      await load();
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  bool _validate() {
    final validatedLabel = state.label.validate(
      CompositeValidator<String>([
        NonEmptyValidator(),
        MaxLengthValidator(partnerFactLabelMaxLength),
      ]),
    );
    final validatedValue = state.value.validate(
      CompositeValidator<String>([
        NonEmptyValidator(),
        MaxLengthValidator(partnerFactValueMaxLength),
      ]),
    );

    emit(state.copyWith(label: validatedLabel, value: validatedValue));

    return validatedLabel.isValid && validatedValue.isValid;
  }
}
