import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/together/data/models/logistic_item.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:uuid/uuid.dart';

part 'logistics_state.dart';

class LogisticsCubit({
  required final TogetherRepository _togetherRepository,
  required final ProfileRepository _profileRepository,
  required final PairingRepository _pairingRepository,
}) extends Cubit<LogisticsState> {
  this : super(const LogisticsState());

  final Uuid _uuid = const Uuid();

  /// Reads the list and who the person shares it with; the list on screen stays while it reloads.
  Future<void> load() async {
    if (state.items is! Success) emit(state.copyWith(items: const Loading()));
    try {
      final me = await _profileRepository.getMyProfile();
      final partner = await _pairingRepository.getPartner();
      final items = await _togetherRepository.getLogisticItems();
      emit(
        state.copyWith(
          items: Success(items),
          meId: me.id,
          partnerId: partner?.id,
          partnerName: partner?.displayName,
        ),
      );
    } catch (exception) {
      if (state.items is Success) return;
      emit(state.copyWith(items: Failure.fromObject(exception)));
    }
  }

  void onTitleChanged(String title) => emit(state.copyWith(title: title));

  /// Adds the typed item, for both people unless [assigneeId] says otherwise.
  Future<void> add({String? assigneeId}) async {
    if (!state.canAdd || state.addAction.isLoading) return;

    emit(state.copyWith(addAction: const Loading()));
    try {
      await _togetherRepository.addLogisticItem(
        id: _uuid.v4(),
        title: state.title,
        assigneeId: assigneeId,
      );
      emit(state.copyWith(title: '', addAction: const Success(null)));
      await load();
    } catch (exception) {
      emit(state.copyWith(addAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(addAction: const Initial()));
  }

  Future<void> toggleDone(LogisticItem item) => _change(
    item,
    () => _togetherRepository.setLogisticItemDone(id: item.id, isDone: !item.isDone),
  );

  /// Gives the item to [assigneeId], or to both people when it is null.
  Future<void> assign(LogisticItem item, {String? assigneeId}) => _change(
    item,
    () => _togetherRepository.setLogisticItemAssignee(id: item.id, assigneeId: assigneeId),
  );

  Future<void> delete(LogisticItem item) =>
      _change(item, () => _togetherRepository.deleteLogisticItem(item.id));

  Future<void> _change(LogisticItem item, Future<void> Function() action) async {
    try {
      await action();
      await load();
    } catch (exception) {
      emit(state.copyWith(changeAction: Failure.fromObject(exception)));
      emit(state.copyWith(changeAction: const Initial()));
    }
  }
}
