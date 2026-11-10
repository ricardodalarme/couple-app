import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/soft_start/cubit/soft_start_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

@RoutePage()
class const SoftStartPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<SoftStartCubit>(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.repair.softStart;
    final state = context.select((SoftStartCubit cubit) => cubit.state);
    final cubit = context.read<SoftStartCubit>();

    return BaseView(
      appBar: BaseAppBar(onClose: () => context.router.maybePop()),
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              header: true,
              child: AppHighlightedText(
                text: l10n.title,
                highlight: l10n.titleHighlight,
                style: context.text.display,
              ),
            ),
            const SizedBox(height: AppSpace.s8),
            Text(
              l10n.subtitle,
              style: context.text.body.copyWith(color: context.colors.textSecondary),
            ),
            const SizedBox(height: AppSpace.s20),
            BaseTextField(
              text: state.feeling,
              label: l10n.feeling,
              hint: l10n.feelingHint,
              onChanged: cubit.onFeelingChanged,
            ),
            const SizedBox(height: AppSpace.s12),
            BaseTextField(
              text: state.situation,
              label: l10n.situation,
              hint: l10n.situationHint,
              onChanged: cubit.onSituationChanged,
            ),
            const SizedBox(height: AppSpace.s12),
            BaseTextField(
              text: state.need,
              label: l10n.need,
              hint: l10n.needHint,
              onChanged: cubit.onNeedChanged,
            ),
          ],
        ),
        footer: BaseButton(
          text: l10n.use,
          isEnabled: state.isComplete,
          onPressed: () => context.router.replace(
            QuickRepairRoute(
              text: l10n.template(
                feeling: state.feeling.trim(),
                situation: state.situation.trim(),
                need: state.need.trim(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
