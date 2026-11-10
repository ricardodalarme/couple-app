import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/_shared/presentation/forms/discard_changes.dart';
import 'package:flutter_bloc_starter/features/help/data/models/support_topic.dart';
import 'package:flutter_bloc_starter/features/help/presentation/support/cubit/support_cubit.dart';
import 'package:flutter_bloc_starter/features/help/presentation/support/widgets/support_form.dart';
import 'package:flutter_bloc_starter/features/help/presentation/support/widgets/support_sent.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const SupportPage({final SupportTopic topic = SupportTopic.account, super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<SupportCubit>()..start(topic),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.helpSupport;
    final sendAction = context.select((SupportCubit cubit) => cubit.state.sendAction);
    final message = context.select((SupportCubit cubit) => cubit.state.message);
    final hasUnsavedMessage =
        message.trim().isNotEmpty && sendAction is! Success && !sendAction.isLoading;

    return BaseView(
      appBar: BaseAppBar(title: l10n.supportTitle),
      body: DirtyFormGuard(
        isDirty: hasUnsavedMessage,
        title: l10n.discardTitle,
        text: l10n.discardText,
        child: BlocListener<SupportCubit, SupportState>(
          listenWhen: (previous, current) => previous.sendAction != current.sendAction,
          listener: (context, state) {
            final action = state.sendAction;
            if (action is Failure) {
              BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
            }
          },
          child: switch (sendAction) {
            Success(:final value) => SupportSent(outcome: value),
            _ => const SupportForm(),
          },
        ),
      ),
    );
  }
}
