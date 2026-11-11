import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker_service/file_picker_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/couple_photo_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';

part 'couple_photos_widget_state.dart';

class CouplePhotosWidgetCubit({
  required final WidgetsRepository _widgetsRepository,
  required final CouplePhotoRepository _couplePhotoRepository,
  required final FilePickerService _filePickerService,
}) extends Cubit<CouplePhotosWidgetState> {
  this : super(const CouplePhotosWidgetState());

  Future<void> load() async {
    emit(state.copyWith(overview: const Loading()));
    try {
      final overview = await _widgetsRepository.loadAndSync();
      if (isClosed) return;
      emit(state.copyWith(overview: Success(overview)));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(overview: Failure.fromObject(exception)));
    }
  }

  void setDarkPreview({required bool isDark}) {
    if (state.isDarkPreview == isDark) return;
    emit(state.copyWith(isDarkPreview: isDark));
  }

  /// Opens the image picker, validates the file, uploads it, and refreshes the widget.
  Future<void> choosePhoto() async {
    if (state.chooseAction.isLoading || state.removeAction.isLoading) return;
    if (!_canManagePhoto) return;

    final PlatformFile? picked;
    try {
      picked = await _filePickerService.pickFile(type: FileType.image);
    } catch (_) {
      emit(
        state.copyWith(
          chooseAction: const Failure(LocalizedException(l10nKey: 'COUPLE_PHOTO_PICK_FAILED')),
        ),
      );
      return;
    }
    if (picked == null) return;

    final Uint8List bytes;
    try {
      bytes = await picked.readAsBytes();
    } catch (_) {
      emit(
        state.copyWith(
          chooseAction: const Failure(LocalizedException(l10nKey: 'COUPLE_PHOTO_READ_FAILED')),
        ),
      );
      return;
    }

    final contentType = _contentTypeFor(picked.extension);
    if (contentType == null || bytes.isEmpty || bytes.length > CouplePhotoRepository.maxBytes) {
      emit(
        state.copyWith(
          chooseAction: const Failure(LocalizedException(l10nKey: 'COUPLE_PHOTO_INVALID')),
        ),
      );
      return;
    }

    emit(state.copyWith(chooseAction: const Loading(), localPreview: bytes));
    try {
      final overview = await _couplePhotoRepository.upload(bytes: bytes, contentType: contentType);
      if (isClosed) return;
      emit(
        state.copyWith(
          overview: Success(overview),
          chooseAction: const Success(null),
          clearLocalPreview: true,
        ),
      );
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(chooseAction: Failure.fromObject(exception), clearLocalPreview: true));
    }
  }

  /// Deletes the couple photo, its storage file, and the local widget cache.
  Future<void> removePhoto() async {
    if (state.chooseAction.isLoading || state.removeAction.isLoading) return;
    if (!_canManagePhoto) return;

    emit(state.copyWith(removeAction: const Loading(), clearLocalPreview: true));
    try {
      final overview = await _couplePhotoRepository.remove();
      if (isClosed) return;
      emit(state.copyWith(overview: Success(overview), removeAction: const Success(null)));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(removeAction: Failure.fromObject(exception)));
    }
  }

  bool get _canManagePhoto {
    final payload = _payload;
    return payload != null && payload.isPaired && payload.hasPlus && !payload.discreet;
  }

  WidgetPayload? get _payload {
    final overview = state.overview;
    return overview is Success<WidgetOverview> ? overview.value.payload : null;
  }

  static String? _contentTypeFor(String? extension) => switch (extension?.toLowerCase()) {
    'jpg' || 'jpeg' => 'image/jpeg',
    'png' => 'image/png',
    'webp' => 'image/webp',
    'heic' || 'heif' => 'image/heic',
    _ => null,
  };
}
