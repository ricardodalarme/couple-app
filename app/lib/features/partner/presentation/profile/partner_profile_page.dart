import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/partner/data/models/partner_fact.dart';
import 'package:flutter_bloc_starter/features/partner/data/models/partner_fact_category.dart';
import 'package:flutter_bloc_starter/features/partner/presentation/profile/cubit/partner_profile_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// A private notebook about the partner; nothing here reaches anyone else, a widget or a push.
@RoutePage()
class const PartnerProfilePage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<PartnerProfileCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.partnerProfile;
    final state = context.select((PartnerProfileCubit cubit) => cubit.state);
    final label = context.select((PartnerProfileCubit cubit) => cubit.state.label);
    final value = context.select((PartnerProfileCubit cubit) => cubit.state.value);
    final cubit = context.read<PartnerProfileCubit>();

    return BaseView(
      body: BlocListener<PartnerProfileCubit, PartnerProfileState>(
        listenWhen: (previous, current) => previous.saveAction != current.saveAction,
        listener: (context, state) {
          final action = state.saveAction;
          if (action is Failure) {
            BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
          }
        },
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(header: true, child: Text(l10n.title, style: context.text.titleXl)),
              const SizedBox(height: AppSpace.s8),
              BaseNote(text: l10n.privateNote),
              const SizedBox(height: AppSpace.s16),
              Wrap(
                spacing: AppSpace.s8,
                runSpacing: AppSpace.s8,
                children: [
                  for (final key in PartnerFactCategory.values)
                    BaseChoiceChip(
                      label: l10n.categories.selectOrFallback(key.name),
                      isSelected: state.category == key,
                      onTap: () => cubit.onCategoryToggled(key),
                    ),
                ],
              ),
              const SizedBox(height: AppSpace.s12),
              BaseTextField(
                text: label.value,
                label: l10n.labelLabel,
                hint: l10n.labelHint,
                errorText: l10n.labelErrors.selectOrNull(label.errorName),
                onChanged: cubit.onLabelChanged,
              ),
              const SizedBox(height: AppSpace.s12),
              BaseTextArea(
                text: value.value,
                hint: l10n.valueHint,
                maxLength: partnerFactValueMaxLength,
                maxLines: 3,
                errorText: l10n.valueErrors.selectOrNull(value.errorName),
                onChanged: cubit.onValueChanged,
              ),
              const SizedBox(height: AppSpace.s24),
              SkeletonizerResourceWidget<List<PartnerFact>>(
                state.facts,
                fakeValue: [PartnerFact.fake()],
                successBuilder: (facts) => facts.isEmpty
                    ? BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText)
                    : BaseListGroup(
                        children: [
                          for (final fact in facts)
                            BaseListTile(
                              title: fact.label,
                              subtitle: fact.value,
                              trailing: BaseTextLink(
                                text: l10n.delete,
                                onPressed: () => cubit.delete(fact),
                              ),
                            ),
                        ],
                      ),
                failureBuilder: (_) => BaseEmptyState(
                  title: l10n.errorTitle,
                  text: l10n.errorText,
                  actionText: context.l10n.common.retry,
                  onAction: cubit.load,
                ),
              ),
            ],
          ),
          footer: BaseButton(
            text: l10n.save,
            isLoading: state.saveAction.isLoading,
            onPressed: cubit.save,
          ),
        ),
      ),
    );
  }
}
