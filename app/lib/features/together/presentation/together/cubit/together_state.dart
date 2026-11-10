part of 'together_cubit.dart';

/// The two views of Juntos.
enum TogetherView() {
  together,
  forMe,
}

final class const TogetherState({
  final TogetherView view = TogetherView.together,
  final bool hasPartner = true,
  final bool showCheckin = true,
}) with Equatable {
  TogetherState copyWith({TogetherView? view, bool? hasPartner, bool? showCheckin}) {
    return TogetherState(
      view: view ?? this.view,
      hasPartner: hasPartner ?? this.hasPartner,
      showCheckin: showCheckin ?? this.showCheckin,
    );
  }

  @override
  List<Object?> get props => [view, hasPartner, showCheckin];
}
