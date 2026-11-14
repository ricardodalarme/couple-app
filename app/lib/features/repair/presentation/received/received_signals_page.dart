import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/received_signal.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/received/cubit/received_signals_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// Messages from the partner, shown one at a time with calm ways to answer.
@RoutePage()
class const ReceivedSignalsPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<ReceivedSignalsCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.received;
    final signals = context.select((ReceivedSignalsCubit cubit) => cubit.state.signals);
    final answered = context.select((ReceivedSignalsCubit cubit) => cubit.state.answeredCount);

    return BaseView(
      appBar: BaseAppBar(onClose: () => context.router.maybePop()),
      body: BlocListener<ReceivedSignalsCubit, ReceivedSignalsState>(
        listenWhen: (previous, current) => previous.respondAction != current.respondAction,
        listener: (context, state) {
          final action = state.respondAction;
          if (action is Failure) {
            BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
          }
        },
        child: SkeletonizerResourceWidget<List<ReceivedSignal>>(
          signals,
          fakeValue: [ReceivedSignal.fake()],
          successBuilder: (items) =>
              items.isEmpty ? _Done(hasAnswered: answered > 0) : _SignalView(signal: items.first),
          failureBuilder: (_) => BaseEmptyState(
            title: l10n.errorTitle,
            text: l10n.errorText,
            actionText: context.l10n.common.retry,
            onAction: context.read<ReceivedSignalsCubit>().load,
          ),
        ),
      ),
    );
  }
}

class const _SignalView({required final ReceivedSignal signal}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.received;
    final isLoading = context.select(
      (ReceivedSignalsCubit cubit) => cubit.state.respondAction.isLoading,
    );
    final cubit = context.read<ReceivedSignalsCubit>();
    final isRepair = signal.kind == SignalKind.repair;
    final value = signal.value;
    final needLabel = value == null ? '' : context.l10n.need.options.selectOrFallback(value);
    final kindBody = l10n.bodies.selectOrFallback(signal.kind.name);
    final text =
        signal.body ??
        (kindBody.isNotEmpty ? kindBody : (needLabel.isNotEmpty ? needLabel : value));

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: BaseTag(text: l10n.kinds.selectOrFallback(signal.kind.name)),
          ),
          const SizedBox(height: AppSpace.s16),
          Semantics(header: true, child: Text(l10n.fromPartner, style: context.text.label)),
          if (text != null) ...[
            const SizedBox(height: AppSpace.s8),
            BaseSurfaceCard(
              style: .ring,
              padding: const EdgeInsets.all(AppSpace.s20),
              child: Text(text, style: context.text.titleLg),
            ),
          ],
          const SizedBox(height: AppSpace.s12),
          BaseNote(text: l10n.privateFirst),
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isRepair)
            for (final response in RepairResponse.values) ...[
              BaseButton(
                text: l10n.responses.selectOrFallback(response.name),
                variant: response == RepairResponse.values.first ? .primary : .secondary,
                isEnabled: !isLoading,
                onPressed: () => cubit.respond(signal, response: response),
              ),
              const SizedBox(height: AppSpace.s10),
            ]
          else ...[
            BaseButton(
              text: l10n.seen,
              isEnabled: !isLoading,
              onPressed: () => cubit.respond(signal),
            ),
            if (signal.kind == SignalKind.missUs) ...[
              const SizedBox(height: AppSpace.s10),
              BaseButton(
                text: l10n.suggestPlan,
                variant: .secondary,
                onPressed: () => context.pushRoute(const DateNightRoute()),
              ),
            ],
          ],
        ],
      ),
    );
  }
}

class const _Done({required final bool hasAnswered}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.received;

    return BaseMomentContent(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BaseFace(kind: FaceKind.smile, size: FaceSize.showcase),
          const SizedBox(height: AppSpace.s20),
          Semantics(
            header: true,
            liveRegion: true,
            child: Text(
              hasAnswered ? l10n.doneTitle : l10n.emptyTitle,
              style: context.text.titleXl,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            hasAnswered ? l10n.doneText : l10n.emptyText,
            textAlign: TextAlign.center,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
        ],
      ),
      footer: BaseButton(text: l10n.close, onPressed: () => context.router.maybePop()),
    );
  }
}
