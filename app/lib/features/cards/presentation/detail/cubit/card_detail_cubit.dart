import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_detail.dart';
import 'package:flutter_bloc_starter/features/cards/data/repositories/cards_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';

/// Reads one sent or received card.
class CardDetailCubit({
  required final CardsRepository _cardsRepository,
  required final ProfileRepository _profileRepository,
}) extends Cubit<Resource<CardDetail>> {
  this : super(const Loading());

  Future<void> load(String cardId) async {
    if (state is! Success) emit(const Loading());
    try {
      final selfId = (await _profileRepository.getMyProfile()).id;
      emit(Success(await _cardsRepository.getDetail(id: cardId, selfId: selfId)));
    } catch (exception) {
      if (state is Success) return;
      emit(Failure.fromObject(exception));
    }
  }
}
