/// The temperature levels a person can name, matching the server levels.
const List<String> temperatureLevels = ['good', 'so_so', 'turbulent', 'fight'];

/// The next step after the check, matching the server repair paths used here.
enum RepairPath(
  /// The server value.
  final String key,
) {
  /// Calm down first.
  pause('pause'),

  /// A short, light repair.
  quick('quick'),

  /// The longer guided repair.
  guided('guided'),
}

/// The intensity from which calm comes before any conversation.
const int highIntensity = 7;

/// Chooses the next step from the temperature [level] and the [intensity] from 1 to 10.
///
/// The hottest answers always begin with calm; a good level needs no repair.
RepairPath? pathFor({required String level, required int intensity}) {
  if (level == 'good') return null;
  if (level == 'fight' || intensity >= highIntensity) return RepairPath.pause;

  return intensity >= 4 ? RepairPath.guided : RepairPath.quick;
}
