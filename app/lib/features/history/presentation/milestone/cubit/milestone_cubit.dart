import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:uuid/uuid.dart';

part 'milestone_state.dart';

class MilestoneCubit({required final HistoryRepository _historyRepository})
    extends Cubit<MilestoneState> {
  this : super(const MilestoneState());

  final Uuid _uuid = const Uuid();
  String? _pendingId;

  Future<void> initialize({
    HistoryMilestone? initialMilestone,
    String? initialTitle,
    MilestoneKind? initialKind,
  }) async {
    final existing = initialMilestone;
    if (existing != null) {
      emit(
        state.copyWith(
          existing: existing,
          title: FormInput(existing.title),
          place: FormInput(existing.place ?? ''),
          body: FormInput(existing.body ?? ''),
          kind: existing.kind,
          precision: existing.precision,
          date: existing.date ?? clock.now(),
          isShared: existing.isShared,
        ),
      );
    } else {
      emit(
        state.copyWith(
          title: FormInput(initialTitle ?? ''),
          kind: initialKind ?? MilestoneKind.custom,
          date: clock.now(),
        ),
      );
    }

    try {
      final overview = await _historyRepository.getOverview();
      emit(
        state.copyWith(
          coupleId: overview.coupleId,
          selfId: overview.selfId,
          isShared: existing == null ? overview.coupleId != null : state.isShared,
        ),
      );
    } catch (_) {
      // Keep local editor working even if overview metadata fails.
    }
  }

  void onTitleChanged(String title) => emit(state.copyWith(title: FormInput(title)));

  void onPlaceChanged(String place) => emit(state.copyWith(place: FormInput(place)));

  void onBodyChanged(String body) => emit(state.copyWith(body: FormInput(body)));

  void onKindSelected(MilestoneKind kind) => emit(state.copyWith(kind: kind));

  void onPrecisionSelected(MilestoneDatePrecision precision) =>
      emit(state.copyWith(precision: precision));

  void onDateChanged(DateTime date) => emit(state.copyWith(date: date));

  void toggleVisibility() => emit(state.copyWith(isShared: !state.isShared));

  Future<void> save() async {
    if (!state.canEdit || state.saveAction.isLoading || !_validate()) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      final id = state.existing?.id ?? (_pendingId ??= _uuid.v4());
      await _historyRepository.saveMilestone(
        id: id,
        title: state.title.value,
        kind: state.kind,
        precision: state.precision,
        isShared: state.isShared,
        date: state.isUnknownDate ? null : (state.date ?? clock.now()),
        place: state.place.value,
        body: state.body.value,
        coupleId: state.coupleId,
        existing: state.existing,
      );
      _pendingId = null;
      emit(state.copyWith(saveAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  bool _validate() {
    final validatedTitle = state.title.validate(
      CompositeValidator<String>([
        NonEmptyValidator(),
        MaxLengthValidator(milestoneTitleMaxLength),
      ]),
    );
    final validatedPlace = state.place.validate(MaxLengthValidator(milestonePlaceMaxLength));
    final validatedBody = state.body.validate(MaxLengthValidator(milestoneBodyMaxLength));

    emit(state.copyWith(title: validatedTitle, place: validatedPlace, body: validatedBody));

    return validatedTitle.isValid && validatedPlace.isValid && validatedBody.isValid;
  }

  Future<void> delete() async {
    final existing = state.existing;
    if (existing == null || !state.canDelete || state.deleteAction.isLoading) return;

    emit(state.copyWith(deleteAction: const Loading()));
    try {
      await _historyRepository.deleteMilestone(existing);
      emit(state.copyWith(deleteAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(deleteAction: Failure.fromObject(exception)));
      emit(state.copyWith(deleteAction: const Initial()));
    }
  }
}
