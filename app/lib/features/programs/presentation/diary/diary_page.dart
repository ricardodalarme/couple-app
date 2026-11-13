import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/diary_entry.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/diary/cubit/diary_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The private diary: today's entry, a short mood, and the recent entries.
@RoutePage()
class const DiaryPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<DiaryCubit>()..load(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.programs;
    final entries = context.select((DiaryCubit cubit) => cubit.state.entries);
    final body = context.select((DiaryCubit cubit) => cubit.state.body);
    final mood = context.select((DiaryCubit cubit) => cubit.state.mood);
    final editingId = context.select((DiaryCubit cubit) => cubit.state.editingId);
    final saveAction = context.select((DiaryCubit cubit) => cubit.state.saveAction);
    final cubit = context.read<DiaryCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.diaryTitle),
      body: BlocListener<DiaryCubit, DiaryState>(
        listenWhen: (previous, current) =>
            previous.saveAction != current.saveAction && current.saveAction is Failure,
        listener: (context, state) {
          final failure = state.saveAction as Failure;

          BaseToast.show(
            context,
            l10n.diaryErrors.selectOrFallback(failure.exception.l10nKey),
            variant: BaseToastVariant.error,
          );
        },
        child: BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BaseNote(text: l10n.diaryPrivacy),
              const SizedBox(height: AppSpace.s16),
              Text(l10n.diaryPrompt, style: context.text.titleSm),
              const SizedBox(height: AppSpace.s12),
              Wrap(
                spacing: AppSpace.s8,
                runSpacing: AppSpace.s8,
                children: [
                  for (final option in diaryMoods)
                    BaseChoiceChip(
                      label: l10n.moods.selectOrFallback(option),
                      isSelected: mood == option,
                      onTap: () => cubit.onMoodChanged(option),
                    ),
                ],
              ),
              const SizedBox(height: AppSpace.s12),
              BaseTextArea(
                text: body.value,
                hint: l10n.diaryHint,
                maxLength: journalBodyMaxLength,
                maxLines: 6,
                errorText: l10n.diaryBodyErrors.selectOrNull(body.errorName),
                onChanged: cubit.onBodyChanged,
              ),
              const SizedBox(height: AppSpace.s24),
              SkeletonizerResourceWidget<List<DiaryEntry>>(
                entries,
                fakeValue: [DiaryEntry.fake()],
                successBuilder: (list) => list.isEmpty
                    ? BaseEmptyState(title: l10n.diaryEmptyTitle, text: l10n.diaryEmptyText)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BaseListGroup(
                            children: [
                              for (final entry in list)
                                BaseListTile(
                                  title: _dateLine(context, entry.entryDate),
                                  subtitle: [
                                    if (entry.mood != null) l10n.moods.selectOrFallback(entry.mood),
                                    _preview(entry.body),
                                  ].join(' · '),
                                  onTap: () => cubit.edit(entry),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      BaseTextLink(
                                        text: l10n.diaryEdit,
                                        onPressed: () => cubit.edit(entry),
                                      ),
                                      const SizedBox(width: AppSpace.s12),
                                      BaseTextLink(
                                        text: l10n.diaryDelete,
                                        onPressed: () => _confirmDelete(context, cubit, entry),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          if (list.length >= 100) ...[
                            const SizedBox(height: AppSpace.s12),
                            BaseNote(text: l10n.diaryCapHint, icon: AppIcons.info),
                          ],
                        ],
                      ),
                failureBuilder: (_) => BaseEmptyState(
                  title: l10n.diaryErrorTitle,
                  text: l10n.diaryErrorText,
                  actionText: context.l10n.common.retry,
                  onAction: cubit.load,
                ),
              ),
            ],
          ),
          footer: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BaseButton(
                text: l10n.diarySave,
                isLoading: saveAction.isLoading,
                onPressed: cubit.save,
              ),
              if (editingId != null) ...[
                const SizedBox(height: AppSpace.s8),
                BaseTextLink(text: l10n.diaryNew, onPressed: cubit.newEntry),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _dateLine(BuildContext context, DateTime date) {
    final l10n = context.l10n.programs;

    return l10n.dateLine(day: date.day, month: l10n.monthsShort[date.month - 1], year: date.year);
  }

  String _preview(String body) => body.length <= 120 ? body : '${body.substring(0, 120)}…';

  Future<void> _confirmDelete(BuildContext context, DiaryCubit cubit, DiaryEntry entry) async {
    final l10n = context.l10n.programs;
    final confirmed = await BaseConfirmSheet.show(
      context: context,
      title: l10n.diaryDeleteTitle,
      text: l10n.diaryDeleteText,
      confirmText: l10n.diaryDeleteConfirm,
      isDestructive: true,
    );
    if (confirmed) await cubit.delete(entry);
  }
}
