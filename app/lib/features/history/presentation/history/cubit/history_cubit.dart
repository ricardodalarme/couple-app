import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';

part 'history_state.dart';

class HistoryCubit({required final HistoryRepository _historyRepository})
    extends Cubit<HistoryState> {
  this : super(const HistoryState());

  Future<void> load() async {
    if (state.overview is! Success) emit(state.copyWith(overview: const Loading()));
    try {
      final overview = await _historyRepository.getOverview();
      emit(state.copyWith(overview: Success(overview)));
      final selectedYear = state.selectedYear;
      if (selectedYear != null && !overview.availableYears.contains(selectedYear)) {
        emit(state.copyWith(clearSelectedYear: true, showUnknownOnly: false));
      } else if (state.showUnknownOnly && !overview.hasUnknownYearMilestones) {
        emit(state.copyWith(showUnknownOnly: false));
      }
    } catch (exception) {
      if (state.overview is Success) return;
      emit(state.copyWith(overview: Failure.fromObject(exception)));
    }
  }

  void selectYear(int? year) {
    emit(
      state.copyWith(selectedYear: year, clearSelectedYear: year == null, showUnknownOnly: false),
    );
  }

  void selectUnknownYear() {
    emit(state.copyWith(clearSelectedYear: true, showUnknownOnly: true));
  }

  void showMoreYears() {
    emit(state.copyWith(visibleYearCount: state.visibleYearCount + 1));
  }
}
