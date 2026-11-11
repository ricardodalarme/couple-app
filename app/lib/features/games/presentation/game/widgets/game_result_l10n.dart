import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_kind_l10n.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// A pick from the reader's point of view, or the missing-answer label.
String gamePersonLabel(BuildContext context, GamePerson? person, {String? partnerName}) {
  final l10n = context.l10n.games;
  final name = gamePartnerName(partnerName, l10n.playing.partnerFallback);

  return switch (person) {
    GamePerson.self => l10n.finished.you,
    GamePerson.partner => name,
    GamePerson.both => l10n.finished.both,
    null => l10n.finished.noAnswer,
  };
}

/// A stored date reflection, or the missing-answer label.
String gameReflectionLabel(BuildContext context, String? reflection) =>
    context.l10n.games.reflections.selectOrFallback(reflection);

/// A stored answer, or the missing-answer label.
String gameAnswerLabel(BuildContext context, String? answer) {
  if (answer == null || answer.trim().isEmpty) return context.l10n.games.finished.noAnswer;

  return answer;
}
