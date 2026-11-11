import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_play.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/cubit/game_cubit.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_not_found_view.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_play_view.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// One game: the start, the invitation, the questions and what both people answered.
@RoutePage()
class const GamePage({@PathParam('game') final String game = '', super.key})
    extends StatefulWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    final kind = GameKind.fromKey(game);
    if (kind == null) return this;

    return BlocProvider(
      create: (_) => AppInjector.instance.get<GameCubit>()..load(kind),
      child: this,
    );
  }

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState() extends State<GamePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    if (GameKind.fromKey(widget.game) == null) return;
    final cubit = context.read<GameCubit>();
    if (!cubit.state.isBusy) cubit.refresh();
  }

  @override
  Widget build(BuildContext context) {
    if (GameKind.fromKey(widget.game) == null) {
      return const BaseView(body: GameNotFoundView());
    }
    final l10n = context.l10n.games;
    final play = context.select((GameCubit cubit) => cubit.state.play);
    final cubit = context.read<GameCubit>();

    return BaseView(
      body: BlocListener<GameCubit, GameState>(
        listenWhen: (previous, current) => previous.action != current.action,
        listener: (context, state) {
          final action = state.action;
          if (action is! Failure) return;
          BaseToast.show(
            context,
            l10n.errors.selectOrFallback(action.exception.l10nKey),
            variant: BaseToastVariant.error,
          );
          context.read<GameCubit>().refresh();
        },
        child: SkeletonizerResourceWidget<GamePlay>(
          play,
          fakeValue: GamePlay.fake(),
          successBuilder: (value) => GamePlayView(play: value),
          failureBuilder: (_) => BaseEmptyState(
            title: l10n.loadErrorTitle,
            text: l10n.loadErrorText,
            actionText: context.l10n.common.retry,
            onAction: cubit.refresh,
          ),
        ),
      ),
    );
  }
}
