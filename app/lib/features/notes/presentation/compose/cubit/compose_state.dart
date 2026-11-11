part of 'compose_cubit.dart';

enum DrawingTool() { pen, eraser }

final class const ComposeState({
  final Resource<List<SentMessage>> sent = const Loading(),
  final MessageKind kind = MessageKind.note,
  final String text = '',
  final List<DrawingStroke> strokes = const [],
  final DrawingTool tool = DrawingTool.pen,
  final int penIndex = 0,
  final bool forWidget = false,
  final Resource<void> sendAction = const Initial(),
}) with Equatable {
  /// Whether there is something to send: a note within the limit, or at least one stroke.
  bool get canSend => switch (kind) {
    MessageKind.note => text.trim().isNotEmpty && text.length <= noteMaxLength,
    MessageKind.drawing => strokes.isNotEmpty,
  };

  ComposeState copyWith({
    Resource<List<SentMessage>>? sent,
    MessageKind? kind,
    String? text,
    List<DrawingStroke>? strokes,
    DrawingTool? tool,
    int? penIndex,
    bool? forWidget,
    Resource<void>? sendAction,
  }) {
    return ComposeState(
      sent: sent ?? this.sent,
      kind: kind ?? this.kind,
      text: text ?? this.text,
      strokes: strokes ?? this.strokes,
      tool: tool ?? this.tool,
      penIndex: penIndex ?? this.penIndex,
      forWidget: forWidget ?? this.forWidget,
      sendAction: sendAction ?? this.sendAction,
    );
  }

  @override
  List<Object?> get props => [sent, kind, text, strokes, tool, penIndex, forWidget, sendAction];
}
