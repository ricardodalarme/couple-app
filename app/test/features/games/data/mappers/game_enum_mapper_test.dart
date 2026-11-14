import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/games/data/mappers/game_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_session.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('maps the games the app has screens for', () {
    expect(EnumGameKind.me_or_you.toModel(), GameKind.meOrYou);
    expect(EnumGameKind.how_well.toModel(), GameKind.howWell);
    expect(EnumGameKind.twenty_questions.toModel(), GameKind.twentyQuestions);
    expect(EnumGameKind.never_have_we.toModel(), GameKind.neverHaveWe);
    expect(EnumGameKind.mission.toModel(), GameKind.mission);
  });

  test('a game without screens is left out', () {
    expect(EnumGameKind.compliments.toModel(), isNull);
    expect(EnumGameKind.$unknown.toModel(), isNull);
  });

  test('maps every status and counts an unknown one as cancelled', () {
    expect(EnumGameStatus.invited.toModel(), GameStatus.invited);
    expect(EnumGameStatus.active.toModel(), GameStatus.active);
    expect(EnumGameStatus.finished.toModel(), GameStatus.finished);
    expect(EnumGameStatus.cancelled.toModel(), GameStatus.cancelled);
    expect(EnumGameStatus.$unknown.toModel(), GameStatus.cancelled);
  });
}
