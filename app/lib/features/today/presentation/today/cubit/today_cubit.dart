import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/today/data/models/today_home.dart';
import 'package:flutter_bloc_starter/features/today/data/repositories/today_repository.dart';

part 'today_state.dart';

/// Loads Hoje and reads it again whenever the app returns to the foreground.
class TodayCubit({
  required final TodayRepository _todayRepository,
  required final ProfileRepository _profileRepository,
}) extends Cubit<TodayState> with WidgetsBindingObserver {
  this : super(const TodayState());

  void start() {
    WidgetsBinding.instance.addObserver(this);
    load();
  }

  /// Reads Hoje; a screen already showing data keeps it while the new read runs.
  Future<void> load() async {
    if (state.home is! Success) emit(state.copyWith(home: const Loading()));
    final selfName = await _readOwnName();
    final settings = await _readSettings();
    try {
      final result = await _todayRepository.getToday();
      emit(
        state.copyWith(
          home: Success(result.home),
          isOffline: result.isFromCache,
          selfName: selfName,
          partnerHint: settings?.partnerName,
          isFirstDay: _isFirstDay(settings),
        ),
      );
    } catch (exception) {
      if (state.home is Success) return;
      emit(state.copyWith(home: Failure.fromObject(exception), selfName: selfName));
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) load();
  }

  bool _isFirstDay(AccountSettings? settings) {
    final onboardedAt = settings?.onboardedAt?.toLocal();
    if (onboardedAt == null) return false;
    final now = DateTime.now();

    return onboardedAt.year == now.year &&
        onboardedAt.month == now.month &&
        onboardedAt.day == now.day;
  }

  Future<String?> _readOwnName() async {
    if (state.selfName != null) return state.selfName;
    try {
      return (await _profileRepository.getMyProfile()).displayName;
    } on Object {
      return null;
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
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }
}
