import 'dart:async';

import 'package:connectivity_service/connectivity_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connectivity_state.dart';

/// Whether the device has internet access, for the global offline banner.
class ConnectivityCubit({required final ConnectivityService _connectivityService})
    extends Cubit<ConnectivityState> {
  this : super(const ConnectivityState());

  StreamSubscription<bool>? _subscription;

  Future<void> start() async {
    if (_subscription != null) return;
    _subscription = _connectivityService.onStatusChange.listen(
      (isOnline) => emit(ConnectivityState(isOnline: isOnline)),
    );
    try {
      emit(ConnectivityState(isOnline: await _connectivityService.hasInternetAccess));
    } on Object {
      // An unknown connection keeps the banner hidden.
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
