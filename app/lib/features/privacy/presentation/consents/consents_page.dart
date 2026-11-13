import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/privacy/data/models/consent.dart';
import 'package:flutter_bloc_starter/features/privacy/presentation/consents/cubit/consents_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const ConsentsPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<ConsentsCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.privacy;
    final consents = context.select((ConsentsCubit cubit) => cubit.state.consents);
    final cubit = context.read<ConsentsCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.consents),
      body: BlocListener<ConsentsCubit, ConsentsState>(
        listenWhen: (previous, current) =>
            previous.saveAction != current.saveAction && current.saveAction is Failure,
        listener: (context, _) => BaseToast.show(context, l10n.saveError),
        child: switch (consents) {
          Success<Map<ConsentKind, bool>>(:final value) => BaseStackedContent(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BaseListGroup(
                  children: [
                    for (final kind in ConsentKind.values)
                      if (kind.isRequired)
                        BaseListTile(
                          title: _label(l10n, kind),
                          value: l10n.required,
                          icon: AppIcons.lock,
                        )
                      else
                        BaseListTile(
                          title: _label(l10n, kind),
                          onTap: () => cubit.toggle(kind),
                          control: BaseSwitch(
                            value: value[kind] ?? false,
                            semanticLabel: _label(l10n, kind),
                            onChanged: (_) => cubit.toggle(kind),
                          ),
                        ),
                  ],
                ),
                const SizedBox(height: AppSpace.s12),
                BaseNote(text: l10n.requiredNote),
                const SizedBox(height: AppSpace.s8),
                BaseNote(text: l10n.consentsNote, icon: AppIcons.info),
              ],
            ),
          ),
          Failure() => BaseEmptyState(
            face: FaceKind.sad,
            title: l10n.errorTitle,
            text: l10n.errorText,
            actionText: context.l10n.common.retry,
            onAction: cubit.load,
          ),
          _ => const Center(child: BaseLoadingDots()),
        },
      ),
    );
  }

  String _label(Translations$privacy$pt l10n, ConsentKind kind) => switch (kind) {
    ConsentKind.sensitiveData => l10n.sensitiveData,
    ConsentKind.analytics => l10n.analytics,
    ConsentKind.marketing => l10n.marketing,
    ConsentKind.ai => l10n.ai,
    ConsentKind.terms => l10n.terms,
    ConsentKind.sensitiveTracks => l10n.sensitiveTracks,
  };
}
