import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/learned_items_repository.dart';
import 'package:flutter_bloc_starter/features/partner/data/repositories/partner_repository.dart';
import 'package:uuid/uuid.dart';

part 'learned_items_state.dart';

class LearnedItemsCubit({
  required final LearnedItemsRepository _learnedItemsRepository,
  required final PartnerRepository _partnerRepository,
}) extends Cubit<LearnedItemsState> {
  this : super(const LearnedItemsState());

  final Uuid _uuid = const Uuid();

  Future<void> load() async {
    if (state.items is! Success) emit(state.copyWith(items: const Loading()));
    try {
      emit(state.copyWith(items: Success(await _learnedItemsRepository.getItems())));
    } catch (exception) {
      if (state.items is Success) return;
      emit(state.copyWith(items: Failure.fromObject(exception)));
    }
  }

  /// Confirms a pending learning; a partner fact also becomes a private note about the partner.
  Future<void> confirm(LearnedItem item, {required String partnerFactLabel}) => _run(() async {
    await _learnedItemsRepository.setStatus(item.id, LearnedStatus.confirmed);
    if (item.target == LearnedTarget.partnerFact) {
      await _partnerRepository.addFact(id: _uuid.v4(), label: partnerFactLabel, value: item.text);
    }
  });

  Future<void> edit(LearnedItem item, String text) =>
      _run(() => _learnedItemsRepository.updateText(item.id, text));

  Future<void> discard(LearnedItem item) =>
      _run(() => _learnedItemsRepository.setStatus(item.id, LearnedStatus.rejected));

  Future<void> _run(Future<void> Function() change) async {
    if (state.action.isLoading) return;

    emit(state.copyWith(action: const Loading()));
    try {
      await change();
      emit(state.copyWith(action: const Success(null)));
      await load();
    } catch (exception) {
      emit(state.copyWith(action: Failure.fromObject(exception)));
    }
    emit(state.copyWith(action: const Initial()));
  }
}
