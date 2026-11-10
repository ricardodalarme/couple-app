part of 'help_lines_cubit.dart';

final class const HelpLinesState({required final List<HelpLine> lines, final String? copiedKey})
    with Equatable {
  HelpLinesState copyWith({String? copiedKey}) =>
      HelpLinesState(lines: lines, copiedKey: copiedKey ?? this.copiedKey);

  @override
  List<Object?> get props => [lines, copiedKey];
}
