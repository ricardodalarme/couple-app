part of 'together_cubit.dart';

/// The two views of Juntos.
enum TogetherView() {
  together,
  forMe,
}

final class const TogetherState({
  final TogetherView view = TogetherView.together,
  final bool hasPartner = true,
}) with Equatable {
  TogetherState copyWith({TogetherView? view, bool? hasPartner}) {
    return TogetherState(view: view ?? this.view, hasPartner: hasPartner ?? this.hasPartner);
  }

  @override
  List<Object?> get props => [view, hasPartner];
}
