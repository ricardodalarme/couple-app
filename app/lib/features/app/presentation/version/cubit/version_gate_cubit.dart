import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/app/data/repositories/app_config_repository.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'version_gate_state.dart';

/// Blocks the app when the installed version is below the server minimum.
class VersionGateCubit({
  required final AppConfigRepository _repository,
  final Future<String> Function()? installedVersion,
}) extends Cubit<VersionGateState> {
  this : super(const VersionGateState());

  bool _hasChecked = false;

  Future<void> check() async {
    if (_hasChecked) return;
    _hasChecked = true;
    emit(state.copyWith(isChecking: true));
    try {
      final installed = await _installed();
      final minimum = await _repository.getMinAppVersion();
      final blocked = minimum != null && isOlder(installed, minimum);
      emit(
        state.copyWith(
          isChecking: false,
          updateRequired: blocked,
          installedVersion: installed,
          minVersion: minimum,
        ),
      );
    } catch (_) {
      // A version check that cannot reach the server never blocks the app.
      emit(state.copyWith(isChecking: false, updateRequired: false));
      _hasChecked = false;
    }
  }

  Future<String> _installed() async {
    final provided = installedVersion;
    if (provided != null) return provided();

    return (await PackageInfo.fromPlatform()).version;
  }
}

/// Whether [installed] is below [minimum], comparing dotted numbers.
bool isOlder(String installed, String minimum) {
  final a = _parts(installed);
  final b = _parts(minimum);
  final length = a.length > b.length ? a.length : b.length;
  for (var index = 0; index < length; index++) {
    final left = index < a.length ? a[index] : 0;
    final right = index < b.length ? b[index] : 0;
    if (left != right) return left < right;
  }

  return false;
}

List<int> _parts(String version) {
  final core = version.split('+').first.split('-').first;

  return [for (final part in core.split('.')) int.tryParse(part) ?? 0];
}
