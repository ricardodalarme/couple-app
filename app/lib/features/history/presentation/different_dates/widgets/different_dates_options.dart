import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/presentation/different_dates/cubit/different_dates_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/widgets/history_date_formatter.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const DifferentDatesOptions({required final HistoryOverview overview, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.history;
    final usePartnerDate = context.select(
      (DifferentDatesCubit cubit) => cubit.state.usePartnerDate,
    );
    final cubit = context.read<DifferentDatesCubit>();

    final selfDate = overview.storyDates.selfStartDate ?? overview.togetherSince;
    final partnerDate = overview.storyDates.partnerStartDate;
    final partnerName = overview.partnerName ?? l10n.partnerFallback;

    if (selfDate == null && partnerDate == null) {
      return BaseNote(icon: AppIcons.calendar, text: l10n.differentNoDates);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (selfDate != null)
          BaseOptionTile(
            title: HistoryDateFormatter.formatFullDate(l10n, selfDate),
            support: l10n.differentYourDate,
            isSelected: !usePartnerDate,
            onTap: () => cubit.selectPartnerDate(false),
          ),
        if (selfDate != null && partnerDate != null) const SizedBox(height: AppSpace.s10),
        if (partnerDate != null)
          BaseOptionTile(
            title: HistoryDateFormatter.formatFullDate(l10n, partnerDate),
            support: l10n.differentPartnerDate(partner: partnerName),
            isSelected: usePartnerDate,
            onTap: () => cubit.selectPartnerDate(true),
          ),
        const SizedBox(height: AppSpace.s18),
        BaseNote(icon: AppIcons.heart, text: l10n.differentNote),
      ],
    );
  }
}
