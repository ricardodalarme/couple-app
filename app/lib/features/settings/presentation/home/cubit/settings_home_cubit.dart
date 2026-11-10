import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/discreet_repository.dart';

part 'settings_home_state.dart';

class SettingsHomeCubit({
  required final PairingRepository _pairingRepository,
  required final PlusRepository _plusRepository,
  required final NotificationsRepository _notificationsRepository,
  required final DiscreetRepository _discreetRepository,
}) extends Cubit<SettingsHomeState> {
  this : super(const SettingsHomeState());

  /// Reads the one-line status of each section; a section that cannot be read shows no status.
  Future<void> load() async {
    final partner = await _try(_pairingRepository.getPartner);
    final plus = await _try(_plusRepository.getPlus);
    final notifications = await _try(_notificationsRepository.getPreferences);
    emit(
      SettingsHomeState(
        isLoaded: true,
        partnerName: partner.value?.displayName,
        hasPartner: partner.isOk ? partner.value != null : null,
        hasPlus: plus.value?.hasPlus,
        notificationsOn: notifications.value?.isEnabled,
        discreetOn: _discreetRepository.local.isOn,
      ),
    );
  }

  Future<({bool isOk, T? value})> _try<T>(Future<T> Function() read) async {
    try {
      return (isOk: true, value: await read());
    } on Object {
      return (isOk: false, value: null);
    }
  }
}
