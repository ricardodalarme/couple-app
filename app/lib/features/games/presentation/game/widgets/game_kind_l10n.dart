import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

extension GameKindL10n on GameKind {
  /// The name of the game in the current language.
  String title(BuildContext context) {
    final kinds = context.l10n.games.kinds;

    return switch (this) {
      GameKind.meOrYou => kinds.meOrYou.title,
      GameKind.howWell => kinds.howWell.title,
      GameKind.twentyQuestions => kinds.twentyQuestions.title,
      GameKind.neverHaveWe => kinds.neverHaveWe.title,
      GameKind.mission => kinds.mission.title,
    };
  }

  /// A short description of how the game is played.
  String intro(BuildContext context) {
    final kinds = context.l10n.games.kinds;

    return switch (this) {
      GameKind.meOrYou => kinds.meOrYou.intro,
      GameKind.howWell => kinds.howWell.intro,
      GameKind.twentyQuestions => kinds.twentyQuestions.intro,
      GameKind.neverHaveWe => kinds.neverHaveWe.intro,
      GameKind.mission => kinds.mission.intro,
    };
  }

  IconData get icon => switch (this) {
    GameKind.meOrYou => AppIcons.users,
    GameKind.howWell => AppIcons.star,
    GameKind.twentyQuestions => AppIcons.chat,
    GameKind.neverHaveWe => AppIcons.heart,
    GameKind.mission => AppIcons.calendar,
  };
}

/// The partner's name, or [fallback] when it is unknown.
String gamePartnerName(String? name, String fallback) =>
    name == null || name.trim().isEmpty ? fallback : name;
