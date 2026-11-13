import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/soft_start/cubit/soft_start_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
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
              text: state.feeling.value,
              label: l10n.feeling,
              hint: l10n.feelingHint,
              errorText: l10n.feelingErrors.selectOrNull(state.feeling.errorName),
              onChanged: cubit.onFeelingChanged,
            ),
            const SizedBox(height: AppSpace.s12),
            BaseTextField(
              text: state.situation.value,
              label: l10n.situation,
              hint: l10n.situationHint,
              errorText: l10n.situationErrors.selectOrNull(state.situation.errorName),
              onChanged: cubit.onSituationChanged,
            ),
            const SizedBox(height: AppSpace.s12),
            BaseTextField(
              text: state.need.value,
              label: l10n.need,
              hint: l10n.needHint,
              errorText: l10n.needErrors.selectOrNull(state.need.errorName),
              onChanged: cubit.onNeedChanged,
            ),
          ],
        ),
        footer: BaseButton(
          text: l10n.use,
          onPressed: () {
            if (!cubit.validate()) return;
            final current = cubit.state;
            context.router.replace(
              QuickRepairRoute(
                text: l10n.template(
                  feeling: current.feeling.value.trim(),
                  situation: current.situation.value.trim(),
                  need: current.need.value.trim(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
