import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository,
      super(const AppState.unauthenticated()) {
    on<AppStatusChanged>(_onStatusChanged);
    on<AppLogoutRequested>(_onLogoutRequested);

    _authenticationRepository.isAuthenticated.listen(_statusChanged);
  }

  final AuthenticationRepository _authenticationRepository;

  void _statusChanged(bool isAuthenticated) => add(AppStatusChanged(isAuthenticated));

  void _onStatusChanged(AppStatusChanged event, Emitter<AppState> emit) {
    if (event.isAuthenticated) {
      emit(const AppState.authenticated());
    } else {
      emit(const AppState.unauthenticated());
    }
  }

  Future<void> _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) async {
    await _authenticationRepository.logOut();
  }

  @override
  Future<void> close() async {
    _authenticationRepository.dispose();
    await super.close();
  }
}
