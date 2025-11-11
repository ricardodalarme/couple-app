import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/repositories/authentication_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository,
      super(const AppState.unauthenticated()) {
    _authenticationRepository.isAuthenticated.listen(_onStatusChanged);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onStatusChanged(bool isAuthenticated) {
    if (isAuthenticated) {
      emit(const AppState.authenticated());
    } else {
      emit(const AppState.unauthenticated());
    }
  }

  Future<void> initialize() async {
    await _authenticationRepository.checkAuthenticationStatus();
  }

  Future<void> logout() async {
    await _authenticationRepository.logOut();
  }

  @override
  Future<void> close() async {
    _authenticationRepository.dispose();
    await super.close();
  }
}
