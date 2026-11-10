part of 'help_cubit.dart';

final class const HelpState({
  final Resource<List<HelpItem>> items = const Loading(),
  final int index = 0,
}) with Equatable {
  HelpState copyWith({Resource<List<HelpItem>>? items, int? index}) {
    return HelpState(items: items ?? this.items, index: index ?? this.index);
  }

  @override
  List<Object?> get props => [items, index];
}
