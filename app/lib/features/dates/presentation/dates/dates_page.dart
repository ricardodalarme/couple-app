import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/dates/data/models/dates_models.dart';
import 'package:flutter_bloc_starter/features/dates/presentation/dates/cubit/dates_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Important dates, private gift ideas and the holiday calendar.
@RoutePage()
class const DatesPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<DatesCubit>()..load(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.dates;
    final view = context.select((DatesCubit cubit) => cubit.state.view);
    final cubit = context.read<DatesCubit>();

    return BaseView(
      body: BlocListener<DatesCubit, DatesState>(
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
              const SizedBox(height: AppSpace.s16),
              BaseSegmented(
                segments: [l10n.segmentDates, l10n.segmentGifts, l10n.segmentHolidays],
                selectedIndex: view.index,
                onSelectionChanged: (index) => cubit.onViewChanged(DatesView.values[index]),
              ),
              const SizedBox(height: AppSpace.s16),
              switch (view) {
                DatesView.dates => const _DatesView(),
                DatesView.gifts => const _GiftsView(),
                DatesView.holidays => const _HolidaysView(),
              },
            ],
          ),
          footer: view == DatesView.dates ? const _SaveDateButton() : null,
        ),
      ),
    );
  }
}

class const _SaveDateButton() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final canSaveDate = context.select((DatesCubit cubit) => cubit.state.canSaveDate);
    final isSaving = context.select((DatesCubit cubit) => cubit.state.saveAction.isLoading);
    final cubit = context.read<DatesCubit>();

    return BaseButton(
      text: context.l10n.dates.saveDate,
      isEnabled: canSaveDate,
      isLoading: isSaving,
      onPressed: cubit.saveDate,
    );
  }
}

class const _DatesView() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.dates;
    final title = context.select((DatesCubit cubit) => cubit.state.title);
    final kind = context.select((DatesCubit cubit) => cubit.state.kind);
    final selectedMonth = context.select((DatesCubit cubit) => cubit.state.month);
    final selectedDay = context.select((DatesCubit cubit) => cubit.state.day);
    final year = context.select((DatesCubit cubit) => cubit.state.year);
    final cubit = context.read<DatesCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseTextField(
          text: title,
          label: l10n.titleLabel,
          hint: l10n.titleHint,
          onChanged: cubit.onTitleChanged,
        ),
        const SizedBox(height: AppSpace.s12),
        Wrap(
          spacing: AppSpace.s8,
          runSpacing: AppSpace.s8,
          children: [
            for (final kindOption in dateKinds)
              BaseChoiceChip(
                label: l10n.kinds.selectOrFallback(kindOption),
                isSelected: kind == kindOption,
                onTap: () => cubit.onKindChosen(kindOption),
              ),
          ],
        ),
        const SizedBox(height: AppSpace.s12),
        BaseSelect<int>(
          label: l10n.monthLabel,
          options: [
            for (var month = 1; month <= 12; month++)
              BaseSelectOption(value: month, label: l10n.months[month - 1]),
          ],
          value: selectedMonth,
          onChanged: cubit.onMonthChosen,
        ),
        const SizedBox(height: AppSpace.s12),
        BaseSelect<int>(
          label: l10n.dayLabel,
          options: [
            for (var day = 1; day <= 31; day++) BaseSelectOption(value: day, label: '$day'),
          ],
          value: selectedDay,
          onChanged: cubit.onDayChosen,
        ),
        const SizedBox(height: AppSpace.s12),
        BaseTextField(
          text: year,
          label: l10n.yearLabel,
          hint: l10n.yearHint,
          helpText: l10n.yearHelp,
          onChanged: cubit.onYearChanged,
        ),
        const SizedBox(height: AppSpace.s24),
        const _DatesList(),
      ],
    );
  }
}

class const _DatesList() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.dates;
    final dates = context.select((DatesCubit cubit) => cubit.state.dates);
    final cubit = context.read<DatesCubit>();

    return SkeletonizerResourceWidget<List<ImportantDate>>(
      dates,
      fakeValue: [ImportantDate.fake()],
      successBuilder: (dates) => dates.isEmpty
          ? BaseEmptyState(title: l10n.emptyDatesTitle, text: l10n.emptyDatesText)
          : BaseListGroup(
              children: [
                for (final date in dates)
                  BaseListTile(
                    title: date.title,
                    subtitle: l10n.dayLine(
                      day: date.day,
                      month: l10n.monthsShort[date.month - 1],
                      kind: l10n.kinds.selectOrFallback(date.kind),
                    ),
                    trailing: BaseTextLink(
                      text: l10n.delete,
                      onPressed: () => cubit.deleteDate(date),
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
    );
  }
}

class const _GiftsView() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.dates;
    final giftTitle = context.select((DatesCubit cubit) => cubit.state.giftTitle);
    final cubit = context.read<DatesCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseNote(text: l10n.giftsPrivate),
        const SizedBox(height: AppSpace.s12),
        BaseTextField(
          text: giftTitle,
          hint: l10n.giftHint,
          onChanged: cubit.onGiftTitleChanged,
          onSubmitted: (_) => cubit.addGift(),
          trailingAction: BaseTextLink(
            text: l10n.add,
            onPressed: giftTitle.trim().isEmpty ? null : cubit.addGift,
          ),
        ),
        const SizedBox(height: AppSpace.s16),
        const _GiftsList(),
      ],
    );
  }
}

class const _GiftsList() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.dates;
    final gifts = context.select((DatesCubit cubit) => cubit.state.gifts);
    final cubit = context.read<DatesCubit>();

    return SkeletonizerResourceWidget<List<GiftIdea>>(
      gifts,
      fakeValue: [GiftIdea.fake()],
      successBuilder: (gifts) => gifts.isEmpty
          ? BaseEmptyState(title: l10n.emptyGiftsTitle, text: l10n.emptyGiftsText)
          : BaseListGroup(
              children: [
                for (final gift in gifts)
                  BaseListTile(
                    title: gift.title,
                    subtitle: gift.isGiven ? l10n.given : null,
                    leading: BaseCheckbox(
                      value: gift.isGiven,
                      semanticLabel: gift.title,
                      onChanged: (_) => cubit.toggleGift(gift),
                    ),
                    trailing: BaseTextLink(
                      text: l10n.delete,
                      onPressed: () => cubit.deleteGift(gift),
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
    );
  }
}

class const _HolidaysView() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.dates;
    final holidays = context.select((DatesCubit cubit) => cubit.state.holidays);
    final cubit = context.read<DatesCubit>();

    return SkeletonizerResourceWidget<List<Holiday>>(
      holidays,
      fakeValue: const [Holiday(slug: 'fake', title: 'Dia dos Namorados', month: 6, day: 12)],
      successBuilder: (list) => list.isEmpty
          ? BaseEmptyState(title: l10n.emptyHolidaysTitle, text: l10n.emptyHolidaysText)
          : BaseListGroup(
              children: [
                for (final holiday in list)
                  BaseListTile(
                    title: holiday.title,
                    subtitle: l10n.dayOnly(
                      day: holiday.day,
                      month: l10n.monthsShort[holiday.month - 1],
                    ),
                    trailing: BaseTextLink(
                      text: l10n.add,
                      onPressed: () => cubit.addHoliday(holiday),
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
    );
  }
}
