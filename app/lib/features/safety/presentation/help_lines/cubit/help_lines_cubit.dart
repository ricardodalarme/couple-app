import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/safety/data/models/help_line.dart';
import 'package:flutter_bloc_starter/features/safety/data/repositories/help_lines_repository.dart';

part 'help_lines_state.dart';

class HelpLinesCubit({required final HelpLinesRepository _repository})
    extends Cubit<HelpLinesState> {
  this : super(HelpLinesState(lines: _repository.getHelpLines()));

  /// Dials [line]; when the device cannot place calls the number is copied instead.
  Future<void> reach(HelpLine line) async {
    final didCall = await _repository.call(line.number);
    if (didCall) return;

    await _repository.copy(line.number);
    emit(state.copyWith(copiedKey: line.key));
  }

  /// Copies the number so it can be pasted elsewhere.
  Future<void> copy(HelpLine line) async {
    await _repository.copy(line.number);
    emit(state.copyWith(copiedKey: line.key));
  }

  void clearCopied() => emit(HelpLinesState(lines: state.lines));
}
