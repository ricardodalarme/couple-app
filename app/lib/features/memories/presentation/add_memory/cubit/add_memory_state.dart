part of 'add_memory_cubit.dart';

final class const AddMemoryState({
  final FormInput<String> title = const FormInput(''),
  final FormInput<String> body = const FormInput(''),
  final FormInput<String> place = const FormInput(''),
}) with Equatable {
  /// Whether the typed place reads like an address instead of a name.
  bool get placeLooksLikeAddress => place.value.trim().isNotEmpty && looksLikeAddress(place.value);

  AddMemoryState copyWith({
    FormInput<String>? title,
    FormInput<String>? body,
    FormInput<String>? place,
  }) => AddMemoryState(
    title: title ?? this.title,
    body: body ?? this.body,
    place: place ?? this.place,
  );

  @override
  List<Object?> get props => [title, body, place];
}
