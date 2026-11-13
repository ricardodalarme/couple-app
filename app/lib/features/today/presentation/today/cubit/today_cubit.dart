import 'dart:async';

import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/today/data/models/today_home.dart';
import 'package:flutter_bloc_starter/features/today/data/repositories/today_repository.dart';

part 'today_state.dart';

/// How often Hoje reads itself again while the app is in the foreground.
const Duration todayRefreshInterval = Duration(seconds: 60);

typedef TodayRefreshTimerFactory = Timer Function(Duration interval, void Function() onTick);

Timer _periodicTimer(Duration interval, void Function() onTick) =>
    Timer.periodic(interval, (_) => onTick());

/// Loads Hoje, follows local writes, and reads it again while the app is open.
class TodayCubit({
  required final TodayRepository _todayRepository,
  required final ProfileRepository _profileRepository,
  required final PairingRepository _pairingRepository,
  required final RepairRepository _repairRepository,
  required final SlipRepository _slipRepository,
  final Duration _refreshInterval = todayRefreshInterval,
  final TodayRefreshTimerFactory _timerFactory = _periodicTimer,
}) extends Cubit<TodayState> with WidgetsBindingObserver {
  this : super(const TodayState());

  StreamSubscription<void>? _pairingChanges;
  StreamSubscription<void>? _pauseChanges;
  StreamSubscription<void>? _profileChanges;
  StreamSubscription<void>? _slipChanges;
  Timer? _pauseTimer;
  Timer? _refreshTimer;
  bool _isLoading = false;
  bool _reloadRequested = false;
  bool _isForeground = true;

  void start() {
    WidgetsBinding.instance.addObserver(this);
    _pairingChanges ??= _pairingRepository.onChanged.listen((_) => load());
    _pauseChanges ??= _repairRepository.onPauseChanged.listen((_) => load());
    _profileChanges ??= _profileRepository.onChanged.listen((_) => load());
    _slipChanges ??= _slipRepository.onChanged.listen((_) => load());
    _refreshTimer ??= _timerFactory(_refreshInterval, _onRefreshTick);
    load();
  }

  void _onRefreshTick() {
    if (!_isForeground || isClosed) return;
    load();
  }

  /// Reads Hoje; a screen already showing data keeps it while the new read runs.
  Future<void> load() async {
    if (isClosed) return;
    if (_isLoading) {
      _reloadRequested = true;

      return;
    }
    _isLoading = true;
    try {
      if (state.home is! Success) emit(state.copyWith(home: const Loading()));
      final selfName = await _readOwnName();
      final settings = await _readSettings();
      try {
        final result = await _todayRepository.getToday();
        if (isClosed) return;
        _schedulePauseEnd(result.home);
        emit(
          state.copyWith(
            home: Success(result.home),
            isOffline: result.isFromCache,
            selfName: selfName,
            partnerHint: settings?.partnerName,
            isFirstDay: _isFirstDay(settings),
            showUnpairNotice: result.wasUnpaired || state.showUnpairNotice,
            unpairedPartnerName: result.wasUnpaired
                ? result.previousPartnerName
                : state.unpairedPartnerName,
          ),
        );
      } catch (exception) {
        if (isClosed || state.home is Success) return;
        emit(state.copyWith(home: Failure.fromObject(exception), selfName: selfName));
      }
    } finally {
      _isLoading = false;
      if (_reloadRequested && !isClosed) {
        _reloadRequested = false;
        unawaited(load());
      }
    }
  }

  /// Ends the person's own pause and reads Hoje again.
  ///
  /// Returns whether the pause ended.
  Future<bool> endPause() async {
    if (state.endPauseAction.isLoading) return false;

    var didEnd = false;
    emit(state.copyWith(endPauseAction: const Loading()));
    try {
      await _todayRepository.endPause();
      didEnd = true;
      emit(state.copyWith(endPauseAction: const Success(null)));
      await load();
    } catch (exception) {
      emit(state.copyWith(endPauseAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(endPauseAction: const Initial()));

    return didEnd;
  }

  void _schedulePauseEnd(TodayHome home) {
    _pauseTimer?.cancel();
    final returnAt = home.pauseReturnAt;
    if (returnAt == null) return;

    final wait = returnAt.difference(clock.now());
    if (wait.isNegative) return;

    _pauseTimer = Timer(wait + const Duration(seconds: 1), load);
  }

  Future<void> acknowledgeUnpairNotice() async {
    await _todayRepository.acknowledgeUnpair();
    if (isClosed) return;
    emit(
      TodayState(
        home: state.home,
        isOffline: state.isOffline,
        selfName: state.selfName,
        partnerHint: state.partnerHint,
        isFirstDay: state.isFirstDay,
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _isForeground = state == AppLifecycleState.resumed;
    if (_isForeground) load();
  }

  bool _isFirstDay(AccountSettings? settings) {
    final onboardedAt = settings?.onboardedAt?.toLocal();
    if (onboardedAt == null) return false;
    final now = clock.now();

    return onboardedAt.year == now.year &&
        onboardedAt.month == now.month &&
        onboardedAt.day == now.day;
  }

  Future<String?> _readOwnName() async {
    try {
      return (await _profileRepository.getMyProfile()).displayName;
    } on Object {
      return state.selfName;
    }
  }

  Future<AccountSettings?> _readSettings() async {
    try {
      return await _profileRepository.getMySettings();
    } on Object {
      return null;
    }
  }

  @override
  Future<void> close() async {
    _pauseTimer?.cancel();
    _refreshTimer?.cancel();
    await _pairingChanges?.cancel();
    await _pauseChanges?.cancel();
    await _profileChanges?.cancel();
    await _slipChanges?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }
}
