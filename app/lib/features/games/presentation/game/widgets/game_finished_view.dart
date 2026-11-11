import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_kind_l10n.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_result_l10n.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The warm reveal of a finished game; no score and no cancel.
class const GameFinishedView({required final GamePlay play, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games;
    final name = gamePartnerName(play.partnerName, l10n.playing.partnerFallback);

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const BaseFace(kind: FaceKind.affectionate, size: FaceSize.showcase),
          const SizedBox(height: AppSpace.s20),
          Semantics(header: true, child: Text(l10n.finished.title, style: context.text.titleXl)),
          const SizedBox(height: AppSpace.s10),
          Text(
            l10n.finished.text,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s20),
          ..._results(context, play, name),
        ],
      ),
      footer: BaseButton.primary(
        text: l10n.finished.back,
        onPressed: () => context.router.maybePop(),
      ),
    );
  }

  List<Widget> _results(BuildContext context, GamePlay play, String name) {
    final l10n = context.l10n.games;

    return switch (play.kind.flow) {
      GameFlow.pick => [
        for (final result in play.pickResults)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpace.s12),
            child: BaseSurfaceCard(
              title: result.item.title,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _AnswerLine(
                    label: l10n.finished.you,
                    value: gamePersonLabel(context, result.mine, partnerName: play.partnerName),
                  ),
                  const SizedBox(height: AppSpace.s6),
                  _AnswerLine(
                    label: name,
                    value: gamePersonLabel(context, result.theirs, partnerName: play.partnerName),
                  ),
                  if (result.agree) ...[
                    const SizedBox(height: AppSpace.s10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: BaseTag(text: l10n.finished.agreed),
                    ),
                  ],
                ],
              ),
            ),
          ),
      ],
      GameFlow.guess => [
        for (final result in play.guessResults)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpace.s12),
            child: BaseSurfaceCard(
              title: result.item.title,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _AnswerLine(
                    label: l10n.finished.you,
                    value: gameAnswerLabel(context, result.ownAnswer),
                  ),
                  const SizedBox(height: AppSpace.s6),
                  _AnswerLine(label: name, value: gameAnswerLabel(context, result.partnerAnswer)),
                  const SizedBox(height: AppSpace.s10),
                  _GuessLine(
                    label: l10n.finished.yourGuess,
                    value: gameAnswerLabel(context, result.ownGuess),
                    matched: result.ownGuessMatched,
                  ),
                  const SizedBox(height: AppSpace.s6),
                  _GuessLine(
                    label: l10n.finished.partnerGuess,
                    value: gameAnswerLabel(context, result.partnerGuess),
                    matched: result.partnerGuessMatched,
                  ),
                ],
              ),
            ),
          ),
      ],
      GameFlow.talk => [
        for (final result in play.talkResults)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpace.s12),
            child: BaseSurfaceCard(
              title: result.item.title,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _AnswerLine(
                    label: l10n.finished.you,
                    value: gameAnswerLabel(context, result.mine),
                  ),
                  const SizedBox(height: AppSpace.s6),
                  _AnswerLine(label: name, value: gameAnswerLabel(context, result.theirs)),
                ],
              ),
            ),
          ),
      ],
      GameFlow.date => [
        BaseSurfaceCard(
          title: play.items.isEmpty ? l10n.date.reflectionTitle : play.items.first.title,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _AnswerLine(
                label: l10n.finished.you,
                value: gameReflectionLabel(context, play.ownReflection),
              ),
              const SizedBox(height: AppSpace.s6),
              _AnswerLine(label: name, value: gameReflectionLabel(context, play.partnerReflection)),
            ],
          ),
        ),
      ],
    };
  }
}

class const _AnswerLine({required final String label, required final String value})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.text.caption.copyWith(color: context.colors.textSecondary)),
        const SizedBox(height: AppSpace.s2),
        Text(value, style: context.text.body),
      ],
    );
  }
}

class const _GuessLine({
  required final String label,
  required final String value,
  required final bool matched,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _AnswerLine(label: label, value: value),
        ),
        if (matched) ...[
          const SizedBox(width: AppSpace.s8),
          BaseTag(text: context.l10n.games.finished.matched),
        ],
      ],
    );
  }
}
