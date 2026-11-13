part of 'create_list_sheet_cubit.dart';

final class const CreateListSheetState({
  final FormInput<String> title = const FormInput(''),
  final String kind = '',
  final bool isShared = false,
  final bool hasPartner = false,
}) with Equatable {
  CreateListSheetState copyWith({
    FormInput<String>? title,
    String? kind,
    bool? isShared,
    bool? hasPartner,
  }) => CreateListSheetState(
    title: title ?? this.title,
    kind: kind ?? this.kind,
    isShared: isShared ?? this.isShared,
    hasPartner: hasPartner ?? this.hasPartner,
  );

  @override
  List<Object?> get props => [title, kind, isShared, hasPartner];
}
