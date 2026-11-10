import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/pairing/presentation/relationship/cubit/relationship_changed_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_details.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_status.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

const List<RelationshipStatus> _optionOrder = [
  RelationshipStatus.ended,
  RelationshipStatus.bereaved,
  RelationshipStatus.onBreak,
  RelationshipStatus.together,
];

@RoutePage()
class const RelationshipChangedPage({super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<RelationshipChangedCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.relationshipChanged;
    final details = context.select((RelationshipChangedCubit cubit) => cubit.state.details);

    return BaseView(
      body: BlocListener<RelationshipChangedCubit, RelationshipChangedState>(
        listenWhen: (previous, current) => previous.saveAction != current.saveAction,
        listener: (context, state) {
          switch (state.saveAction) {
            case Success():
              BaseToast.show(context, l10n.saved);
            case Failure(:final exception):
              BaseToast.show(context, l10n.errors.selectOrFallback(exception.l10nKey));
            default:
              break;
          }
        },
        child: SkeletonizerResourceWidget<RelationshipDetails>(
          details,
          fakeValue: RelationshipDetails.fake(),
          successBuilder: (_) => const _Options(),
          failureBuilder: (_) => BaseEmptyState(
            title: context.l10n.relationshipSettings.loadErrorTitle,
            text: context.l10n.relationshipSettings.loadErrorText,
            actionText: context.l10n.common.retry,
            onAction: context.read<RelationshipChangedCubit>().load,
          ),
        ),
      ),
    );
  }
}

class const _Options() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.relationshipChanged;
    final status = context.select((RelationshipChangedCubit cubit) => cubit.state.selected);
    final canContinue = context.select((RelationshipChangedCubit cubit) => cubit.state.canContinue);
    final isSaving = context.select(
      (RelationshipChangedCubit cubit) => cubit.state.saveAction.isLoading,
    );
    final cubit = context.read<RelationshipChangedCubit>();

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            child: AppHighlightedText(
              text: l10n.title,
              highlight: l10n.highlight,
              style: context.text.display,
            ),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            l10n.subtitle,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s20),
          for (final value in _optionOrder) ...[
            BaseOptionTile(
              title: _label(l10n, value),
              isSelected: status == value,
              isEnabled: !isSaving,
              onTap: () => cubit.choose(value),
            ),
            if (value != _optionOrder.last) const SizedBox(height: AppSpace.s10),
          ],
        ],
      ),
      footer: BaseButton(
        text: l10n.continueLabel,
        isEnabled: canContinue,
        isLoading: isSaving,
        onPressed: canContinue ? () => _continue(context, cubit) : null,
      ),
    );
  }

  String _label(Translations$relationshipChanged$pt l10n, RelationshipStatus status) =>
      switch (status) {
        RelationshipStatus.ended => l10n.optionEnded,
        RelationshipStatus.bereaved => l10n.optionBereaved,
        RelationshipStatus.onBreak => l10n.optionOnBreak,
        RelationshipStatus.together => l10n.optionTogether,
      };

  Future<void> _continue(BuildContext context, RelationshipChangedCubit cubit) async {
    final saved = await cubit.save();
    if (!saved || !context.mounted) return;

    switch (cubit.state.selected) {
      case RelationshipStatus.bereaved:
        unawaited(context.pushRoute(const GriefSupportRoute()));
      case RelationshipStatus.onBreak:
        unawaited(context.pushRoute(const PauseRoute()));
      case RelationshipStatus.ended || RelationshipStatus.together || null:
        unawaited(context.router.maybePop());
    }
  }
}
