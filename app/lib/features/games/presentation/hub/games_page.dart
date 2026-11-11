import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/games/data/models/game_kind.dart';
import 'package:flutter_bloc_starter/features/games/data/models/games_overview.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/widgets/game_kind_l10n.dart';
import 'package:flutter_bloc_starter/features/games/presentation/hub/cubit/games_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The games the couple can play, with invitations and the state of each game.
@RoutePage()
class const GamesPage({super.key}) extends StatefulWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<GamesCubit>()..load(), child: this);
  }

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState() extends State<GamesPage> with WidgetsBindingObserver {
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
    if (state == AppLifecycleState.resumed) context.read<GamesCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games.hub;
    final overview = context.select((GamesCubit cubit) => cubit.state.overview);
    final cubit = context.read<GamesCubit>();

    return BaseView(
      body: SkeletonizerResourceWidget<GamesOverview>(
        overview,
        fakeValue: GamesOverview.fake(),
        successBuilder: (value) => BaseRefreshable(
          onRefresh: cubit.load,
          child: _GamesBody(overview: value),
        ),
        failureBuilder: (_) => BaseEmptyState(
          title: l10n.loadErrorTitle,
          text: l10n.loadErrorText,
          actionText: context.l10n.common.retry,
          onAction: cubit.load,
        ),
      ),
    );
  }
}

class const _GamesBody({required final GamesOverview overview}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games.hub;
    final entries = overview.entries(DateTime.now());
    final invitation = overview.pendingInvitation(DateTime.now());

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(header: true, child: Text(l10n.title, style: context.text.titleXl)),
          const SizedBox(height: AppSpace.s8),
          Text(
            l10n.subtitle,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s20),
          if (!overview.hasPartner) ...[
            BaseNote(text: l10n.noPartnerNote),
            const SizedBox(height: AppSpace.s16),
          ],
          if (invitation != null) ...[
            _InvitationCard(entry: invitation, partnerName: overview.partnerName),
            const SizedBox(height: AppSpace.s20),
          ],
          _Section(
            title: l10n.guessLabel,
            entries: [
              for (final entry in entries)
                if (entry.kind.flow case GameFlow.pick || GameFlow.guess) entry,
            ],
            overview: overview,
          ),
          _Section(
            title: l10n.talkLabel,
            entries: [
              for (final entry in entries)
                if (entry.kind.flow == GameFlow.talk) entry,
            ],
            overview: overview,
          ),
          _Section(
            title: l10n.challengeLabel,
            entries: [
              for (final entry in entries)
                if (entry.kind.flow == GameFlow.date) entry,
            ],
            overview: overview,
          ),
          BaseNote(text: l10n.refreshNote, icon: AppIcons.refresh),
        ],
      ),
    );
  }
}

class const _Section({
  required final String title,
  required final List<GameEntry> entries,
  required final GamesOverview overview,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseSectionHeader(title: title, isLabel: true),
        const SizedBox(height: AppSpace.s8),
        BaseListGroup(
          children: [
            for (final entry in entries)
              _GameTile(
                entry: entry,
                hasPartner: overview.hasPartner,
                partnerName: overview.partnerName,
              ),
          ],
        ),
        const SizedBox(height: AppSpace.s20),
      ],
    );
  }
}

class const _GameTile({
  required final GameEntry entry,
  required final bool hasPartner,
  final String? partnerName,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games.hub;
    final minutes = l10n.minutes(minutes: entry.kind.minutes);
    final state = _stateText(context, l10n, entry.state);

    return BaseListTile(
      title: entry.kind.title(context),
      subtitle: state == null ? minutes : '$minutes · $state',
      icon: entry.kind.icon,
      showsChevron: hasPartner,
      trailing: hasPartner ? null : BaseTag(text: l10n.lockChip),
      isEnabled: hasPartner,
      showsDivider: true,
      onTap: () async {
        final cubit = context.read<GamesCubit>();
        await context.pushRoute(GameRoute(game: entry.kind.key));
        if (context.mounted) await cubit.load();
      },
    );
  }

  String? _stateText(BuildContext context, Translations$games$hub$pt l10n, GameEntryState state) {
    final name = gamePartnerName(partnerName, '');

    return switch (state) {
      GameEntryState.idle => null,
      GameEntryState.waiting =>
        name.isEmpty ? l10n.stateWaitingFallback : l10n.stateWaiting(name: name),
      GameEntryState.invited => l10n.stateInvited,
      GameEntryState.active => l10n.stateActive,
      GameEntryState.finished => l10n.stateFinished,
      GameEntryState.cancelled => l10n.stateCancelled,
      GameEntryState.expired => l10n.stateExpired,
    };
  }
}

class const _InvitationCard({required final GameEntry entry, final String? partnerName})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.games.hub;
    final name = gamePartnerName(partnerName, '');

    return BaseSurfaceCard(
      title: name.isEmpty ? l10n.invitedFallbackTitle : l10n.invitedTitle(name: name),
      supportText: '${entry.kind.title(context)} · ${l10n.minutes(minutes: entry.kind.minutes)}',
      child: Align(
        alignment: Alignment.centerLeft,
        child: BaseButton.compact(
          text: l10n.join,
          onPressed: () async {
            final cubit = context.read<GamesCubit>();
            await context.pushRoute(GameRoute(game: entry.kind.key));
            if (context.mounted) await cubit.load();
          },
        ),
      ),
    );
  }
}
