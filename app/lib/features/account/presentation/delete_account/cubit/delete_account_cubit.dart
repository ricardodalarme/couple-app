import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/account/data/repositories/account_repository.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit({required final AccountRepository _accountRepository})
    extends Cubit<DeleteAccountState> {
  this : super(const DeleteAccountState());

  Future<void> deleteAccount() async {
    emit(state.copyWith(deletion: const Loading()));

    try {
      await _accountRepository.deleteAccount();
      emit(state.copyWith(deletion: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(deletion: Failure.fromObject(exception)));
    }
  }
}
