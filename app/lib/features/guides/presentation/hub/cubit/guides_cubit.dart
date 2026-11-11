import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/guides/data/models/guide.dart';
import 'package:flutter_bloc_starter/features/guides/data/repositories/guides_repository.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

part 'guides_state.dart';

class GuidesCubit({required final GuidesRepository _repository}) extends Cubit<GuidesState> {
  this : super(const GuidesState());

  /// Reads the local catalogue in the current app language.
  Future<void> load() async {
    emit(state.copyWith(guides: const Loading()));
    try {
      final guides = await _repository.getGuides(
        languageCode: LocaleSettings.currentLocale.languageCode,
      );
      if (isClosed) return;
      emit(state.copyWith(guides: Success(guides)));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(guides: Failure.fromObject(exception)));
    }
  }
}
