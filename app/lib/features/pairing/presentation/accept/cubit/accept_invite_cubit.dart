import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:form_inputs/form_inputs.dart';

part 'accept_invite_state.dart';

/// Length of the invite codes the server issues.
const int inviteCodeLength = 8;

final RegExp _inviteCodePattern = RegExp('^[A-Z0-9]{$inviteCodeLength}\$');

class AcceptInviteCubit({
  required final PairingRepository _pairingRepository,
  required final ProfileRepository _profileRepository,
}) extends Cubit<AcceptInviteState> {
  this : super(const AcceptInviteState());

  void onCodeChanged(String value) {
    final code = value.replaceAll(RegExp(r'\s'), '').toUpperCase();
    emit(
      state.copyWith(
        code: FormInput(
          code.length > inviteCodeLength ? code.substring(0, inviteCodeLength) : code,
        ),
      ),
    );
  }

  Future<void> accept() async {
    if (state.acceptAction.isLoading || !_validate()) return;

    emit(state.copyWith(acceptAction: const Loading()));
    try {
      final connected = await _pairingRepository.acceptInvite(state.code.value);
      if (!connected) {
        emit(state.copyWith(acceptAction: const Success(AcceptOutcome.unusable)));
        return;
      }
      final partner = await _readPartnerName();
      final self = await _readOwnName();
      emit(
        state.copyWith(
          acceptAction: const Success(AcceptOutcome.connected),
          partnerName: partner,
          selfName: self,
        ),
      );
    } catch (exception) {
      emit(state.copyWith(acceptAction: Failure.fromObject(exception)));
      emit(state.copyWith(acceptAction: const Initial()));
    }
  }

  /// Lets the person type another code after an unusable one.
  void tryAgain() => emit(AcceptInviteState(code: state.code));

  bool _validate() {
    final validatedCode = state.code.validate(
      CompositeValidator<String>([
        NonEmptyValidator(),
        MinLengthValidator(inviteCodeLength),
        MaxLengthValidator(inviteCodeLength),
        PatternValidator(_inviteCodePattern),
      ]),
    );

    emit(state.copyWith(code: validatedCode));

    return validatedCode.isValid;
  }

  Future<String?> _readOwnName() async {
    try {
      return (await _profileRepository.getMyProfile()).displayName;
    } on Object {
      return null;
    }
  }

  Future<String?> _readPartnerName() async {
    try {
      return (await _pairingRepository.getPartner())?.displayName;
    } on Object {
      return null;
    }
  }
}
