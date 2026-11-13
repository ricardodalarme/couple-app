import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/safety/data/repositories/safe_mode_repository.dart';
import 'package:flutter_bloc_starter/features/spice/data/data_sources/remote/spice_data_source.dart';
import 'package:logger/logger.dart';

/// What the spice page can show.
enum SpiceStage() {
  /// The person has not switched the mode on, or safe mode hides it.
  off,

  /// The person switched it on but the server returns no cards yet.
  waiting,

  /// Both switched it on and cards are available.
  ready,

  /// The cards need Plus, and the person does not have it.
  plusLocked,
}

/// The state of the mode and its cards.
final class const SpiceView({required final SpiceStage stage, final List<String> cards = const []})
    with Equatable {
  @override
  List<Object?> get props => [stage, cards];
}

class SpiceRepository({
  required final SpiceDataSource _dataSource,
  required final ProfileRepository _profileRepository,
  required final SafeModeRepository _safeModeRepository,
  required final PlusRepository _plusRepository,
}) {
  final Logger _logger = Logger('SpiceRepository');

  /// Whether safe mode is on, in which case the section stays hidden.
  bool get isHidden => _safeModeRepository.isOn;

  Future<SpiceView> getView() async {
    try {
      if (!(await _plusRepository.getPlus()).hasPlus) {
        return const SpiceView(stage: SpiceStage.plusLocked);
      }

      final settings = await _profileRepository.getMySettings();
      final enabled = await _dataSource.getEnabled(settings.profileId);
      if (!enabled) return const SpiceView(stage: SpiceStage.off);

      final cards = await _dataSource.getCards(settings.locale);

      return SpiceView(stage: cards.isEmpty ? SpiceStage.waiting : SpiceStage.ready, cards: cards);
    } catch (e, stack) {
      _logger.error('Failed to read the spice mode', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Switches the mode for this person only; nothing is sent to the partner.
  Future<void> setEnabled({required bool enabled}) async {
    try {
      final settings = await _profileRepository.getMySettings();
      final affected = await _dataSource.setEnabled(
        profileId: settings.profileId,
        enabled: enabled,
      );
      if (affected != 1) throw const LocalizedException(l10nKey: 'UPDATE_FAILED');
    } catch (e, stack) {
      _logger.error('Failed to change the spice mode', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
