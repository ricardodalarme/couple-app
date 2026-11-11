import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';

part 'widgets_gallery_state.dart';

class WidgetsGalleryCubit({required final WidgetsRepository _repository})
    extends Cubit<WidgetsGalleryState> {
  this : super(const WidgetsGalleryState());

  Future<void> load() async {
    emit(state.copyWith(overview: const Loading()));
    try {
      final overview = await _repository.loadAndSync();
      if (isClosed) return;
      emit(state.copyWith(overview: Success(overview)));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(overview: Failure.fromObject(exception)));
    }
  }

  void selectSegment(WidgetGallerySegment segment) {
    if (state.segment == segment) return;
    emit(state.copyWith(segment: segment));
  }
}
