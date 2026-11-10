part of 'logistics_cubit.dart';

final class const LogisticsState({
  final Resource<List<LogisticItem>> items = const Loading(),
  final String title = '',
  final String? meId,
  final String? partnerId,
  final String? partnerName,
  final Resource<void> addAction = const Initial(),
  final Resource<void> changeAction = const Initial(),
}) with Equatable {
  /// Whether the typed title can be added.
  bool get canAdd => title.trim().isNotEmpty && title.length <= logisticTitleMaxLength;

  /// Whether the person shares the list with a partner.
  bool get hasPartner => partnerId != null;

  LogisticsState copyWith({
    Resource<List<LogisticItem>>? items,
    String? title,
    String? meId,
    String? partnerId,
    String? partnerName,
    Resource<void>? addAction,
    Resource<void>? changeAction,
  }) {
    return LogisticsState(
      items: items ?? this.items,
      title: title ?? this.title,
      meId: meId ?? this.meId,
      partnerId: partnerId ?? this.partnerId,
      partnerName: partnerName ?? this.partnerName,
      addAction: addAction ?? this.addAction,
      changeAction: changeAction ?? this.changeAction,
    );
  }

  @override
  List<Object?> get props => [items, title, meId, partnerId, partnerName, addAction, changeAction];
}
