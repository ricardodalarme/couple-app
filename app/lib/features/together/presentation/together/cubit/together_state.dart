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
  final int listCount = 0,
  final int sharedGiftCount = 0,
  final String? questionTitle,
  final String? phase,
}) with Equatable {
  TogetherState copyWith({
    TogetherView? view,
    bool? hasPartner,
    bool? showCheckin,
    int? listCount,
    int? sharedGiftCount,
    String? questionTitle,
    String? phase,
  }) {
    return TogetherState(
      view: view ?? this.view,
      hasPartner: hasPartner ?? this.hasPartner,
      showCheckin: showCheckin ?? this.showCheckin,
      listCount: listCount ?? this.listCount,
      sharedGiftCount: sharedGiftCount ?? this.sharedGiftCount,
      questionTitle: questionTitle ?? this.questionTitle,
      phase: phase ?? this.phase,
    );
  }

  @override
  List<Object?> get props => [
    view,
    hasPartner,
    showCheckin,
    listCount,
    sharedGiftCount,
    questionTitle,
    phase,
  ];
}
