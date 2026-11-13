import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/discreet/cubit/discreet_mode_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The three switches of discreet mode, with the board's note about what it hides.
@RoutePage()
class const DiscreetModePage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<DiscreetModeCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.discreet;
    final values = context.select((DiscreetModeCubit cubit) => cubit.state.values);
    final cubit = context.read<DiscreetModeCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.title),
      body: BlocListener<DiscreetModeCubit, DiscreetModeState>(
        listenWhen: (previous, current) =>
            previous.saveAction != current.saveAction && current.saveAction is Failure,
        listener: (context, _) => BaseToast.show(context, l10n.saveError),
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BaseListGroup(
                children: [
                  BaseListTile(
                    title: l10n.neutralIcon,
                    onTap: () => cubit.setNeutralIcon(value: !values.neutralIcon),
                    control: BaseSwitch(
                      value: values.neutralIcon,
                      semanticLabel: l10n.neutralIcon,
                      onChanged: (value) => cubit.setNeutralIcon(value: value),
                    ),
                  ),
                  BaseListTile(
                    title: l10n.neutralNotifications,
                    onTap: () => cubit.setNeutralNotifications(value: !values.neutralNotifications),
                    control: BaseSwitch(
                      value: values.neutralNotifications,
                      semanticLabel: l10n.neutralNotifications,
                      onChanged: (value) => cubit.setNeutralNotifications(value: value),
                    ),
                  ),
                  BaseListTile(
                    title: l10n.hideWidgetText,
                    onTap: () => cubit.setHideWidgetText(value: !values.hideWidgetText),
                    control: BaseSwitch(
                      value: values.hideWidgetText,
                      semanticLabel: l10n.hideWidgetText,
                      onChanged: (value) => cubit.setHideWidgetText(value: value),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.s12),
              BaseNote(text: l10n.note, icon: AppIcons.eye_off),
            ],
          ),
        ),
      ),
    );
  }
}
