part of 'guides_cubit.dart';

final class const GuidesState({
  final Resource<List<Guide>> guides = const Loading(),
  final bool hasPlus = false,
}) with Equatable {
  GuidesState copyWith({Resource<List<Guide>>? guides, bool? hasPlus}) =>
      GuidesState(guides: guides ?? this.guides, hasPlus: hasPlus ?? this.hasPlus);

  @override
  List<Object?> get props => [guides, hasPlus];
}
