import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/together/presentation/together/cubit/together_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The shared home: what to do together, and a view with only the person's own things.
@RoutePage()
class const TogetherPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<TogetherCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.tabs;
    final entry = context.l10n.questionsEntry;
    final view = context.select((TogetherCubit cubit) => cubit.state.view);
    final hasPartner = context.select((TogetherCubit cubit) => cubit.state.hasPartner);
    final showCheckin = context.select((TogetherCubit cubit) => cubit.state.showCheckin);
    final listCount = context.select((TogetherCubit cubit) => cubit.state.listCount);
    final questionTitle = context.select((TogetherCubit cubit) => cubit.state.questionTitle);
    final phase = context.select((TogetherCubit cubit) => cubit.state.phase);
    final cubit = context.read<TogetherCubit>();

    return BaseView(
      appBar: null,
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(header: true, child: Text(l10n.together, style: context.text.titleXl)),
            const SizedBox(height: AppSpace.s16),
            BaseSegmented(
              segments: [l10n.segmentTogether, l10n.segmentForMe],
              selectedIndex: view.index,
              onSelectionChanged: (index) => cubit.onViewChanged(TogetherView.values[index]),
            ),
            const SizedBox(height: AppSpace.s16),
            if (view == TogetherView.together) ...[
              if (!hasPartner) ...[
                BaseNote(text: l10n.soloNote),
                const SizedBox(height: AppSpace.s12),
              ],
              BaseListGroup(
                children: [
                  if (phase == 'long_distance')
                    _row(
                      icon: AppIcons.map_pin,
                      title: l10n.distanceTitle,
                      onTap: () => context.pushRoute(const DistanceRoute()),
                    )
                  else if (phase == 'with_parents')
                    _row(
                      icon: AppIcons.home,
                      title: l10n.parentsTitle,
                      onTap: () => context.pushRoute(const RitualsRoute()),
                    ),
                  if (showCheckin)
                    _row(
                      icon: AppIcons.check,
                      title: l10n.checkinTitle,
                      onTap: () => _openCheckin(context, cubit),
                    ),
                  _row(
                    icon: AppIcons.plant,
                    title: context.l10n.programs.title,
                    onTap: () => context.pushRoute(const ProgramsRoute()),
                  ),
                  _row(
                    icon: AppIcons.chat,
                    title: entry.title,
                    subtitle: questionTitle,
                    onTap: () => context.pushRoute(const QuestionsRoute()),
                  ),
                  _row(
                    icon: AppIcons.play,
                    title: l10n.gamesTitle,
                    trailing: hasPartner ? null : BaseTag(text: l10n.gamesLock),
                    onTap: () => context.pushRoute(const GamesRoute()),
                  ),
                  _row(
                    icon: AppIcons.cart,
                    title: l10n.logisticsTitle,
                    onTap: () => context.pushRoute(const LogisticsRoute()),
                  ),
                  _row(
                    icon: AppIcons.rings,
                    title: l10n.ritualsTitle,
                    onTap: () => context.pushRoute(const RitualsRoute()),
                  ),
                  _row(
                    icon: AppIcons.sparkle,
                    title: l10n.dateNightTitle,
                    onTap: () => context.pushRoute(const DateNightRoute()),
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.s24),
              BaseListGroup(
                children: [
                  _row(
                    icon: AppIcons.note,
                    title: l10n.listsTitle,
                    subtitle: switch ((hasPartner, listCount)) {
                      (true, 0) => l10n.listsEmpty,
                      (false, 0) => l10n.listsEmptyPrivate,
                      (true, final count) => l10n.listsSharedCount(count: count),
                      (false, final count) => l10n.listsPrivateCount(count: count),
                    },
                    onTap: () async {
                      await context.pushRoute(const ListsRoute());
                      if (context.mounted) await cubit.load();
                    },
                  ),
                  _row(
                    icon: AppIcons.gift,
                    title: context.l10n.gifts.entryTitle,
                    onTap: () => context.pushRoute(const GiftsRoute()),
                  ),
                  _row(
                    icon: AppIcons.book,
                    title: l10n.guidesTitle,
                    onTap: () => context.pushRoute(const GuidesRoute()),
                  ),
                  _row(
                    icon: AppIcons.calendar,
                    title: l10n.datesTitle,
                    onTap: () => context.pushRoute(const DatesRoute()),
                  ),
                  _row(
                    icon: AppIcons.sun,
                    title: l10n.dayTitle,
                    onTap: () => context.pushRoute(const DayRoute()),
                  ),
                  _row(
                    icon: AppIcons.sparkle,
                    title: l10n.starterTitle,
                    onTap: () => context.pushRoute(const StarterRoute()),
                  ),
                  _row(
                    icon: AppIcons.cloud,
                    title: l10n.badDayTitle,
                    onTap: () => context.pushRoute(const BadDayRoute()),
                  ),
                  _row(
                    icon: AppIcons.smile,
                    title: l10n.temperatureTitle,
                    onTap: () => context.pushRoute(const TemperatureRoute()),
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.s24),
              BaseListGroup(
                children: [
                  if (hasPartner) ...[
                    _row(
                      icon: AppIcons.heart,
                      title: l10n.usTitle,
                      onTap: () => context.pushRoute(const UsRoute()),
                    ),
                    _row(
                      icon: AppIcons.twinkle,
                      title: l10n.touchTitle,
                      onTap: () => context.pushRoute(const TouchRoute()),
                    ),
                  ],
                  _row(
                    icon: AppIcons.timer,
                    title: l10n.capsulesTitle,
                    onTap: () => context.pushRoute(const CapsulesRoute()),
                  ),
                  _row(
                    icon: AppIcons.smartphone,
                    title: context.l10n.widgets.juntosTitle,
                    onTap: () => context.pushRoute(const WidgetsGalleryRoute()),
                  ),
                ],
              ),
            ] else ...[
              BaseListGroup(
                children: [
                  _row(
                    icon: AppIcons.lock,
                    title: context.l10n.programs.diaryTitle,
                    onTap: () => context.pushRoute(const DiaryRoute()),
                  ),
                  _row(
                    icon: AppIcons.chat,
                    title: l10n.chatTitle,
                    onTap: () => context.pushRoute(ChatRoute()),
                  ),
                  _row(
                    icon: AppIcons.heart,
                    title: l10n.hardTalkTitle,
                    onTap: () => context.pushRoute(const HardConversationRoute()),
                  ),
                  _row(
                    icon: AppIcons.pencil,
                    title: l10n.notesTitle,
                    onTap: () => context.pushRoute(const ComposeRoute()),
                  ),
                  _row(
                    icon: AppIcons.lightbulb,
                    title: l10n.learningTitle,
                    onTap: () => context.pushRoute(LearningRoute()),
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.s24),
              BaseListGroup(
                footer: l10n.forMeFooter,
                children: [
                  _row(
                    icon: AppIcons.twinkle,
                    title: l10n.fightStyleTitle,
                    onTap: () => context.pushRoute(const FightStyleRoute()),
                  ),
                  _row(
                    icon: AppIcons.heart,
                    title: context.l10n.loveStyle.entryTitle,
                    onTap: () => context.pushRoute(const LoveStyleRoute()),
                  ),
                  _row(
                    icon: AppIcons.user,
                    title: l10n.partnerTitle,
                    onTap: () => context.pushRoute(const PartnerProfileRoute()),
                  ),
                  _row(
                    icon: AppIcons.star,
                    title: l10n.plusTitle,
                    onTap: () => context.pushRoute(const PlansRoute()),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _row({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    String? subtitle,
    Widget? trailing,
  }) {
    return BaseListTile(
      icon: icon,
      title: title,
      subtitle: subtitle,
      subtitleMaxLines: 1,
      titleMaxLines: 1,
      trailing: trailing,
      showsChevron: true,
      onTap: onTap,
    );
  }

  Future<void> _openCheckin(BuildContext context, TogetherCubit cubit) async {
    await context.pushRoute(const CheckinRoute());
    if (context.mounted) await cubit.load();
  }
}
