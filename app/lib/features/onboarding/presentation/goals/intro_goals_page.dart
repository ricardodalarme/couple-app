import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/onboarding/presentation/intro/cubit/intro_cubit.dart';
import 'package:flutter_bloc_starter/features/onboarding/presentation/intro/widgets/intro_scaffold.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const IntroGoalsPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<IntroCubit>()..start(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.intro.goals;
    final cubit = context.read<IntroCubit>();

    Future<void> next(Future<void> Function() save) async {
      await save();
      if (context.mounted) await context.pushRoute(const IntroThemeRoute());
    }

    return IntroScaffold(
      stepIndex: 1,
      title: l10n.title,
      highlight: l10n.titleHighlight,
      subtitle: l10n.subtitle,
      body: const _GoalOptions(),
      footer: IntroFooter(
        skipText: context.l10n.intro.skip,
        continueText: context.l10n.intro.continueButton,
        onSkip: () => next(() => cubit.skip(2)),
        onContinue: () => next(() => cubit.complete(2)),
      ),
    );
  }
}

class const _GoalOptions() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = context.l10n.intro.goals.options;
    final selected = context.select((IntroCubit cubit) => cubit.state.goals);

    return Column(
      children: [
        for (final goal in introGoalOptions) ...[
          BaseOptionTile(
            title: labels.selectOrFallback(goal),
            isSelected: selected.contains(goal),
            control: BaseOptionTileControl.checkbox,
            onTap: () => context.read<IntroCubit>().toggleGoal(goal),
          ),
          const SizedBox(height: AppSpace.s10),
        ],
      ],
    );
  }
}
