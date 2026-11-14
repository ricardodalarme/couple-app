/// How the relationship feels right now, from calm to fighting.
enum Temperature() {
  good,
  soSo,
  turbulent,
  fight,
}

/// The next step after the check.
enum RepairPath() {
  /// Calm down first.
  pause,

  /// A short, light repair.
  quick,

  /// The longer guided repair.
  guided,
}

/// The intensity from which calm comes before any conversation.
const int highIntensity = 7;

/// Chooses the next step from the temperature [level] and the [intensity] from 1 to 10.
///
/// The hottest answers always begin with calm; a good level needs no repair.
RepairPath? pathFor({required Temperature level, required int intensity}) {
  if (level == Temperature.good) return null;
  if (level == Temperature.fight || intensity >= highIntensity) return RepairPath.pause;

  return intensity >= 4 ? RepairPath.guided : RepairPath.quick;
}
