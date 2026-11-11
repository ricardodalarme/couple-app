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
              _section(
                context,
                title: l10n.sectionForYou,
                children: [
                  _row(
                    icon: AppIcons.cart,
                    title: l10n.logisticsTitle,
                    subtitle: l10n.logisticsMeta,
                    onTap: () => context.pushRoute(const LogisticsRoute()),
                  ),
                  _row(
                    icon: AppIcons.rings,
                    title: l10n.ritualsTitle,
                    subtitle: l10n.ritualsMeta,
                    onTap: () => context.pushRoute(const RitualsRoute()),
                  ),
                  _row(
                    icon: AppIcons.sparkle,
                    title: l10n.dateNightTitle,
                    subtitle: l10n.dateNightMeta,
                    onTap: () => context.pushRoute(const DateNightRoute()),
                  ),
                  _row(
                    icon: AppIcons.plant,
                    title: context.l10n.programs.title,
                    subtitle: l10n.programsMeta,
                    onTap: () => context.pushRoute(const ProgramsRoute()),
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.s24),
              _section(
                context,
                title: l10n.sectionTools,
                children: [
                  if (showCheckin)
                    _row(
                      icon: AppIcons.check,
                      title: l10n.checkinTitle,
                      subtitle: l10n.checkinMeta,
                      onTap: () => _openCheckin(context, cubit),
                    ),
                  _row(
                    icon: AppIcons.chat,
                    title: entry.title,
                    subtitle: l10n.questionMeta,
                    onTap: () => context.pushRoute(const QuestionsRoute()),
                  ),
                  _row(
                    icon: AppIcons.play,
                    title: l10n.gamesTitle,
                    subtitle: l10n.gamesMeta,
                    trailing: hasPartner ? null : BaseTag(text: l10n.gamesLock),
                    onTap: () => context.pushRoute(const GamesRoute()),
                  ),
                  _row(
                    icon: AppIcons.note,
                    title: l10n.listsTitle,
                    subtitle: switch ((hasPartner, listCount)) {
                      (_, 0) => l10n.listsNone,
                      (true, final count) => l10n.listsSharedCount(count: count),
                      (false, final count) => l10n.listsPrivateCount(count: count),
                    },
                    onTap: () async {
                      await context.pushRoute(const ListsRoute());
                      if (context.mounted) await cubit.load();
                    },
                  ),
                  _row(
                    icon: AppIcons.calendar,
                    title: l10n.datesTitle,
                    subtitle: l10n.datesMeta,
                    onTap: () => context.pushRoute(const DatesRoute()),
                  ),
                  _row(
                    icon: AppIcons.gift,
                    title: context.l10n.gifts.entryTitle,
                    subtitle: l10n.giftsMeta,
                    onTap: () => context.pushRoute(const GiftsRoute()),
                  ),
                  _row(
                    icon: AppIcons.book,
                    title: l10n.guidesTitle,
                    subtitle: l10n.guidesMeta,
                    onTap: () => context.pushRoute(const GuidesRoute()),
                  ),
                  _row(
                    icon: AppIcons.sparkle,
                    title: l10n.starterTitle,
                    subtitle: l10n.starterMeta,
                    onTap: () => context.pushRoute(const StarterRoute()),
                  ),
                  _row(
                    icon: AppIcons.sun,
                    title: l10n.dayTitle,
                    subtitle: l10n.dayMeta,
                    onTap: () => context.pushRoute(const DayRoute()),
                  ),
                  _row(
                    icon: AppIcons.timer,
                    title: l10n.capsulesTitle,
                    subtitle: l10n.capsulesMeta,
                    onTap: () => context.pushRoute(const CapsulesRoute()),
                  ),
                  _row(
                    icon: AppIcons.smile,
                    title: l10n.temperatureTitle,
                    subtitle: l10n.temperatureMeta,
                    onTap: () => context.pushRoute(const TemperatureRoute()),
                  ),
                  _row(
                    icon: AppIcons.smartphone,
                    title: context.l10n.widgets.juntosTitle,
                    subtitle: l10n.widgetsMeta,
                    onTap: () => context.pushRoute(const WidgetsGalleryRoute()),
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.s24),
              _section(
                context,
                title: l10n.sectionMore,
                children: [
                  if (phase == 'long_distance')
                    _row(
                      icon: AppIcons.map_pin,
                      title: l10n.distanceTitle,
                      subtitle: l10n.distanceMeta,
                      onTap: () => context.pushRoute(const DistanceRoute()),
                    )
                  else if (phase == 'with_parents')
                    _row(
                      icon: AppIcons.home,
                      title: l10n.parentsTitle,
                      subtitle: l10n.parentsMeta,
                      onTap: () => context.pushRoute(const RitualsRoute()),
                    ),
                  _row(
                    icon: AppIcons.cloud,
                    title: l10n.badDayTitle,
                    subtitle: l10n.badDayMeta,
                    onTap: () => context.pushRoute(const BadDayRoute()),
                  ),
                  if (hasPartner)
                    _row(
                      icon: AppIcons.heart,
                      title: l10n.usTitle,
                      subtitle: l10n.usMeta,
                      onTap: () => context.pushRoute(const UsRoute()),
                    ),
                  if (hasPartner)
                    _row(
                      icon: AppIcons.twinkle,
                      title: l10n.touchTitle,
                      subtitle: l10n.touchMeta,
                      onTap: () => context.pushRoute(const TouchRoute()),
                    ),
                ],
              ),
            ] else ...[
              _section(
                context,
                title: l10n.sectionPrivate,
                children: [
                  _row(
                    icon: AppIcons.lock,
                    title: context.l10n.programs.diaryTitle,
                    subtitle: l10n.diaryMeta,
                    onTap: () => context.pushRoute(const DiaryRoute()),
                  ),
                  _row(
                    icon: AppIcons.plant,
                    title: context.l10n.programs.title,
                    subtitle: l10n.programsMeta,
                    onTap: () => context.pushRoute(const ProgramsRoute()),
                  ),
                  _row(
                    icon: AppIcons.heart,
                    title: l10n.hardTalkTitle,
                    subtitle: l10n.hardTalkMeta,
                    onTap: () => context.pushRoute(const HardConversationRoute()),
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.s24),
              _section(
                context,
                title: l10n.sectionPatterns,
                children: [
                  _row(
                    icon: AppIcons.twinkle,
                    title: l10n.fightStyleTitle,
                    subtitle: l10n.fightStyleMeta,
                    onTap: () => context.pushRoute(const FightStyleRoute()),
                  ),
                  _row(
                    icon: AppIcons.heart,
                    title: context.l10n.loveStyle.entryTitle,
                    subtitle: l10n.loveStyleMeta,
                    onTap: () => context.pushRoute(const LoveStyleRoute()),
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.s24),
              _section(
                context,
                title: l10n.sectionMore,
                footer: l10n.forMeFooter,
                children: [
                  _row(
                    icon: AppIcons.chat,
                    title: l10n.chatTitle,
                    subtitle: l10n.chatMeta,
                    onTap: () => context.pushRoute(ChatRoute()),
                  ),
                  _row(
                    icon: AppIcons.pencil,
                    title: l10n.notesTitle,
                    subtitle: l10n.notesMeta,
                    onTap: () => context.pushRoute(const ComposeRoute()),
                  ),
                  _row(
                    icon: AppIcons.lightbulb,
                    title: l10n.learningTitle,
                    subtitle: l10n.learningMeta,
                    onTap: () => context.pushRoute(LearningRoute()),
                  ),
                  _row(
                    icon: AppIcons.user,
                    title: l10n.partnerTitle,
                    subtitle: l10n.partnerMeta,
                    onTap: () => context.pushRoute(const PartnerProfileRoute()),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _section(
    BuildContext context, {
    required String title,
    required List<Widget> children,
    String? footer,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseSectionHeader(title: title),
        const SizedBox(height: AppSpace.s8),
        BaseListGroup(footer: footer, children: children),
      ],
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
