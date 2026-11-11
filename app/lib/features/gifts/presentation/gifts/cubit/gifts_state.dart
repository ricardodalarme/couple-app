part of 'gifts_cubit.dart';

const Object _coupleIdUnset = Object();

final class const GiftsState({
  final Resource<List<GiftIdea>> gifts = const Loading(),
  final String? coupleId,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  List<GiftIdea> get currentGifts => switch (gifts) {
    Success<List<GiftIdea>>(:final value) => value,
    _ => const [],
  };

  List<GiftIdea> get myGifts => [
    for (final gift in currentGifts)
      if (gift.isMine) gift,
  ];

  List<GiftIdea> get partnerGifts => [
    for (final gift in currentGifts)
      if (!gift.isMine) gift,
  ];

  bool get hasPartner => coupleId != null;

  GiftsState copyWith({
    Resource<List<GiftIdea>>? gifts,
    Object? coupleId = _coupleIdUnset,
    Resource<void>? saveAction,
  }) {
    return GiftsState(
      gifts: gifts ?? this.gifts,
      coupleId: identical(coupleId, _coupleIdUnset) ? this.coupleId : coupleId as String?,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [gifts, coupleId, saveAction];
}
