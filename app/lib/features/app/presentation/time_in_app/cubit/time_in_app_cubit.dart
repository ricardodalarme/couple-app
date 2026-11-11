import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preferences_service/preferences_service.dart';

part 'time_in_app_state.dart';

/// Foreground time that opens the time-in-app prompt.
///
/// A chosen default: the product board sets no threshold.
const Duration timeInAppThreshold = Duration(minutes: 30);

/// How often foreground time is accumulated.
const Duration timeInAppTick = Duration(seconds: 30);

/// Preference key holding the local day the prompt was last shown.
const String timeInAppPromptedOnKey = 'timeInAppPromptedOn';

typedef TimeInAppTimerFactory = Timer Function(Duration interval, void Function() onTick);

Timer _periodicTimer(Duration interval, void Function() onTick) =>
    Timer.periodic(interval, (_) => onTick());

/// Accumulates foreground time and asks for the prompt once per local day.
class TimeInAppCubit({
  required final PreferencesService _preferencesService,
  final DateTime Function() _now = DateTime.now,
  final Duration _tickInterval = timeInAppTick,
  final TimeInAppTimerFactory _timerFactory = _periodicTimer,
}) extends Cubit<TimeInAppState> with WidgetsBindingObserver {
  this : super(const TimeInAppState());

  Timer? _timer;
  Duration _foreground = Duration.zero;
  String? _currentDay;
  String? _promptedOn;
  bool _isForeground = true;
  bool _isStarted = false;

  void start() {
    if (_isStarted) return;
    _isStarted = true;
    _currentDay = _localDay(_now());
    _promptedOn = _preferencesService.readString(key: timeInAppPromptedOnKey);
    WidgetsBinding.instance.addObserver(this);
    _timer = _timerFactory(_tickInterval, _onTick);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _isForeground = state == AppLifecycleState.resumed;
  }

  void _onTick() {
    if (!_isForeground || isClosed) return;

    final today = _localDay(_now());
    if (_currentDay != today) {
      _currentDay = today;
      _foreground = Duration.zero;
      if (state.shouldPrompt) emit(const TimeInAppState());
    }

    _foreground += _tickInterval;
    if (_foreground < timeInAppThreshold || _promptedOn == today) return;

    _promptedOn = today;
    unawaited(_preferencesService.writeString(key: timeInAppPromptedOnKey, value: today));
    emit(const TimeInAppState(shouldPrompt: true));
  }

  @override
  Future<void> close() async {
    _timer?.cancel();
    _timer = null;
    WidgetsBinding.instance.removeObserver(this);
    await super.close();
  }

  String _localDay(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}';
}
