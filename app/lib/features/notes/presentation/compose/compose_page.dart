import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notes/data/models/sent_message.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/cubit/compose_cubit.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/widgets/drawing_canvas.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

const double _thumbSize = 56;

/// Writes a short note or draws a picture for the partner, and lists what was already sent.
@RoutePage()
class const ComposePage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<ComposeCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.notes;
    final kind = context.select((ComposeCubit cubit) => cubit.state.kind);
    final text = context.select((ComposeCubit cubit) => cubit.state.text);
    final forWidget = context.select((ComposeCubit cubit) => cubit.state.forWidget);
    final canSend = context.select((ComposeCubit cubit) => cubit.state.canSend);
    final isSending = context.select((ComposeCubit cubit) => cubit.state.sendAction.isLoading);
    final cubit = context.read<ComposeCubit>();

    return BaseView(
      body: BlocListener<ComposeCubit, ComposeState>(
        listenWhen: (previous, current) => previous.sendAction != current.sendAction,
        listener: (context, state) {
          final action = state.sendAction;
          if (action is Failure) {
            BaseToast.show(context, l10n.errors.selectOrFallback(action.exception.l10nKey));
          } else if (action is Success) {
            BaseToast.show(context, l10n.sent);
          }
        },
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(header: true, child: Text(l10n.title, style: context.text.titleXl)),
              const SizedBox(height: AppSpace.s8),
              Text(
                l10n.intro,
                style: context.text.body.copyWith(color: context.colors.textSecondary),
              ),
              const SizedBox(height: AppSpace.s16),
              BaseSegmented(
                segments: l10n.kinds,
                selectedIndex: kind.index,
                onSelectionChanged: (index) => cubit.onKindChanged(MessageKind.values[index]),
              ),
              const SizedBox(height: AppSpace.s16),
              if (kind == MessageKind.note)
                BaseTextArea(
                  text: text,
                  hint: l10n.noteHint,
                  maxLength: noteMaxLength,
                  maxLines: 4,
                  onChanged: cubit.onTextChanged,
                )
              else
                const DrawingCanvas(),
              const SizedBox(height: AppSpace.s16),
              BaseListTile(
                title: l10n.widgetLabel,
                subtitle: l10n.widgetText,
                control: BaseSwitch(
                  value: forWidget,
                  semanticLabel: l10n.widgetLabel,
                  onChanged: cubit.onForWidgetChanged,
                ),
              ),
              const SizedBox(height: AppSpace.sectionGap),
              const _SentSection(),
            ],
          ),
          footer: BaseButton(
            text: l10n.send,
            isEnabled: canSend,
            isLoading: isSending,
            onPressed: cubit.send,
          ),
        ),
      ),
    );
  }
}

class const _SentSection() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.notes;
    final sent = context.select((ComposeCubit cubit) => cubit.state.sent);
    final cubit = context.read<ComposeCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Semantics(header: true, child: Text(l10n.sentTitle, style: context.text.titleLg)),
        const SizedBox(height: AppSpace.s12),
        SkeletonizerResourceWidget<List<SentMessage>>(
          sent,
          fakeValue: [SentMessage.fake()],
          successBuilder: (messages) => messages.isEmpty
              ? BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText)
              : BaseListGroup(
                  children: [
                    for (final message in messages)
                      BaseListTile(
                        title: message.kind == MessageKind.note
                            ? message.body ?? ''
                            : l10n.drawingAlt,
                        subtitle: message.wasSeen ? l10n.seen : l10n.delivered,
                        leading: message.kind == MessageKind.drawing
                            ? _Thumbnail(url: message.imageUrl)
                            : null,
                        trailing: BaseTextLink(
                          text: l10n.delete,
                          onPressed: () => cubit.delete(message),
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
    );
  }
}

class const _Thumbnail({required final String? url}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final url = this.url;

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: SizedBox(
        width: _thumbSize,
        height: _thumbSize,
        child: url == null
            ? const BaseImagePlaceholder()
            : Image.network(
                url,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => const BaseImagePlaceholder(),
              ),
      ),
    );
  }
}
