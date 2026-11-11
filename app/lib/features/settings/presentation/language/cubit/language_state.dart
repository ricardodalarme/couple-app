part of 'language_cubit.dart';

final class const LanguageState({
  required final String locale,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  LanguageState copyWith({String? locale, Resource<void>? saveAction}) =>
      LanguageState(locale: locale ?? this.locale, saveAction: saveAction ?? this.saveAction);

  @override
  List<Object?> get props => [locale, saveAction];
}
