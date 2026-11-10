import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/sunday_card.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/draft/cubit/sunday_card_cubit.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/draft/widgets/sunday_card_body.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const SundayCardPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<SundayCardCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.sundayCard;
    final card = context.select((SundayCardCubit cubit) => cubit.state.card);

    return BaseView(
      appBar: BaseAppBar(title: l10n.title),
      body: BlocListener<SundayCardCubit, SundayCardState>(
        listenWhen: (previous, current) => previous.saveAction != current.saveAction,
        listener: (context, state) {
          if (state.saveAction is Failure) BaseToast.show(context, l10n.saveError);
        },
        child: switch (card) {
          Success<SundayCard>(:final value) => SundayCardBody(card: value),
          Failure() => BaseEmptyState(
            title: l10n.errorTitle,
            text: l10n.errorText,
            actionText: context.l10n.common.retry,
            onAction: context.read<SundayCardCubit>().load,
          ),
          _ => const Center(child: BaseLoadingDots()),
        },
      ),
    );
  }
}
