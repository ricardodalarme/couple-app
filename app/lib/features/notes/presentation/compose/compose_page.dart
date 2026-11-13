import 'package:auto_route/auto_route.dart';
import 'package:clock/clock.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notes/data/models/sent_message.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/cubit/compose_cubit.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/widgets/drawing_canvas.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:formatters/formatters.dart';

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
    final isUnpaired = context.select((ComposeCubit cubit) => cubit.state.isUnpaired);
    final isSending = context.select((ComposeCubit cubit) => cubit.state.sendAction.isLoading);
    final cubit = context.read<ComposeCubit>();

    return BaseView(
      body: BlocListener<ComposeCubit, ComposeState>(
        listenWhen: (previous, current) =>
            previous.sendAction != current.sendAction ||
            previous.deleteAction != current.deleteAction,
        listener: (context, state) {
          final sendAction = state.sendAction;
          if (sendAction is Failure) {
            BaseToast.show(context, l10n.errors.selectOrFallback(sendAction.exception.l10nKey));
          } else if (sendAction is Success) {
            BaseToast.show(context, l10n.sent);
          }

          final deleteAction = state.deleteAction;
          if (deleteAction is Failure) {
            BaseToast.show(context, l10n.deleteError);
          } else if (deleteAction is Success) {
            BaseToast.show(context, l10n.deleted);
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
              if (isUnpaired) ...[
                const SizedBox(height: AppSpace.s16),
                BaseListTile(
                  icon: AppIcons.link,
                  title: l10n.unpairedTitle,
                  subtitle: l10n.unpairedText,
                ),
              ],
              const SizedBox(height: AppSpace.s16),
              AbsorbPointer(
                absorbing: isSending,
                child: BaseSegmented(
                  segments: l10n.kinds,
                  selectedIndex: kind.index,
                  onSelectionChanged: (index) => cubit.onKindChanged(MessageKind.values[index]),
                ),
              ),
              const SizedBox(height: AppSpace.s16),
              if (kind == MessageKind.note)
                BaseTextArea(
                  text: text.value,
                  hint: l10n.noteHint,
                  maxLength: noteMaxLength,
                  maxLines: 4,
                  isEnabled: !isSending,
                  errorText: l10n.textErrors.selectOrNull(text.errorName),
                  onChanged: cubit.onTextChanged,
                )
              else
                AbsorbPointer(absorbing: isSending, child: const DrawingCanvas()),
              const SizedBox(height: AppSpace.s16),
              if (kind == MessageKind.note)
                BaseListTile(
                  title: l10n.widgetLabel,
                  subtitle: l10n.widgetText,
                  isEnabled: !isSending,
                  control: BaseSwitch(
                    value: forWidget,
                    semanticLabel: l10n.widgetLabel,
                    onChanged: isSending ? (_) {} : cubit.onForWidgetChanged,
                  ),
                )
              else
                Text(
                  l10n.drawingHint,
                  style: context.text.bodySm.copyWith(color: context.colors.textSecondary),
                ),
              const SizedBox(height: AppSpace.sectionGap),
              const _SentSection(),
            ],
          ),
          footer: BaseButton(
            text: l10n.send,
            isEnabled: !isUnpaired && !isSending,
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
                        subtitle: _sentAt(context, message.createdAt),
                        leading: message.kind == MessageKind.drawing
                            ? _Thumbnail(url: message.imageUrl)
                            : null,
                        trailing: BaseTextLink(
                          text: l10n.delete,
                          onPressed: () => _confirmDelete(context, message),
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

  Future<void> _confirmDelete(BuildContext context, SentMessage message) async {
    final l10n = context.l10n.notes;
    final confirmed = await BaseConfirmSheet.show(
      context: context,
      title: l10n.deleteConfirmTitle,
      text: l10n.deleteConfirmText,
      confirmText: l10n.deleteConfirm,
      isDestructive: true,
    );
    if (confirmed && context.mounted) await context.read<ComposeCubit>().delete(message);
  }
}

String _sentAt(BuildContext context, DateTime createdAt) {
  final l10n = context.l10n.notes;
  final local = createdAt.toLocal();
  final elapsed = clock.now().difference(local);

  if (elapsed.inMinutes < 1) return l10n.justNow;
  if (elapsed.inHours < 1) return l10n.minutesAgo(count: elapsed.inMinutes);
  if (elapsed.inDays < 1) return l10n.hoursAgo(count: elapsed.inHours);
  if (elapsed.inDays < 7) return l10n.daysAgo(count: elapsed.inDays);

  return DateFormatters.mediumDate(local);
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
            : CachedNetworkImage(
                imageUrl: url,
                cacheKey: Uri.tryParse(url)?.replace(query: '').toString(),
                memCacheWidth: (_thumbSize * MediaQuery.devicePixelRatioOf(context)).round(),
                fit: BoxFit.cover,
                fadeInDuration: Duration.zero,
                placeholder: (_, _) => const SizedBox.shrink(),
                errorBuilder: (_, _, _) => const BaseImagePlaceholder(),
              ),
      ),
    );
  }
}
