import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_session.dart';

extension EnumGameKindMapper on EnumGameKind {
  /// Null for a game this version has no screens for.
  GameKind? toModel() => switch (this) {
    EnumGameKind.me_or_you => GameKind.meOrYou,
    EnumGameKind.how_well => GameKind.howWell,
    EnumGameKind.twenty_questions => GameKind.twentyQuestions,
    EnumGameKind.never_have_we => GameKind.neverHaveWe,
    EnumGameKind.mission => GameKind.mission,
    EnumGameKind.compliments || EnumGameKind.$unknown => null,
  };
}

extension EnumGameStatusMapper on EnumGameStatus {
  /// An unknown status counts as cancelled, so it never blocks a new session.
  GameStatus toModel() => switch (this) {
    EnumGameStatus.invited => GameStatus.invited,
    EnumGameStatus.active => GameStatus.active,
    EnumGameStatus.finished => GameStatus.finished,
    EnumGameStatus.cancelled || EnumGameStatus.$unknown => GameStatus.cancelled,
  };
}
