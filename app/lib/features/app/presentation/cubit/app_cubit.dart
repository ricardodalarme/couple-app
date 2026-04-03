import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository,
      super(const AppState.unauthenticated()) {
    _authStateChangesSubscription = _authenticationRepository.isAuthenticated.listen(
      _onStatusChanged,
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<bool> _authStateChangesSubscription;

  void _onStatusChanged(bool isAuthenticated) {
    if (isAuthenticated) {
      emit(const AppState.authenticated());
    } else {
      emit(const AppState.unauthenticated());
    }
  }

  Future<void> logout() async {
    await _authenticationRepository.logOut();
  }

  @override
  Future<void> close() async {
    await _authStateChangesSubscription.cancel();
    await super.close();
  }
}
