import 'package:core/core.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/data_sources/models/settings_local.dart';
import 'package:quickstart_flutter_bloc/features/settings/domain/models/settings_model.dart';

final class SettingsLocalToModelMapper
    implements Mapper<SettingsLocal, SettingsModel> {
  @override
  SettingsModel map(SettingsLocal input) {
    return SettingsModel(
      hasOnboarded: input.hasOnboarded,
      useBiometrics: input.useBiometrics,
    );
  }
}
