import 'package:biometric_service/biometric_service.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/account/data/models/deletion_request.dart';
import 'package:flutter_bloc_starter/features/account/data/repositories/account_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:logger/logger.dart';

part 'delete_account_state.dart';

/// Requests the deletion after a device-owner check and can cancel a pending one.
class DeleteAccountCubit({
  required final AccountRepository _repository,
  required final PairingRepository _pairingRepository,
  required final BiometricService _biometricService,
}) extends Cubit<DeleteAccountState> {
  this : super(const DeleteAccountState());

  final Logger _logger = Logger('DeleteAccountCubit');

  Future<void> load() async {
    try {
      final partner = await _pairingRepository.getPartner();
      emit(
        state.copyWith(
          deletion: Success(await _repository.getDeletion()),
          partnerName: partner?.displayName,
        ),
      );
    } catch (exception) {
      emit(state.copyWith(deletion: Failure.fromObject(exception)));
    }
  }

  /// Asks the device owner first; a device without a check proceeds after the confirmation.
  Future<void> request({required String reason}) async {
    if (state.action.isLoading) return;

    emit(state.copyWith(action: const Loading()));
    try {
      if (await _biometricService.isDeviceSupported()) {
        var confirmed = true;
        try {
          confirmed = await _biometricService.authenticate(reason);
        } on Object catch (error, stack) {
          // A device with no enrolled check cannot re-authenticate; the confirm above still gates it.
          _logger.warning('The device check is unavailable', error: error, stackTrace: stack);
        }
        if (!confirmed) {
          emit(state.copyWith(action: const Initial()));
          return;
        }
      }
      final deletion = await _repository.requestDeletion();
      emit(state.copyWith(deletion: Success(deletion), action: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(action: Failure.fromObject(exception)));
      emit(state.copyWith(action: const Initial()));
    }
  }

  Future<void> cancel() async {
    if (state.action.isLoading) return;

    emit(state.copyWith(action: const Loading()));
    try {
      await _repository.cancelDeletion();
      emit(state.copyWith(deletion: const Success(null), action: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(action: Failure.fromObject(exception)));
      emit(state.copyWith(action: const Initial()));
    }
  }
}
