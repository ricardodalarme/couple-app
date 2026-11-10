part of 'edit_profile_cubit.dart';

final class const EditProfileState({
  final Resource<void> submission = const Initial(),
  final FormInput<String> firstName = const FormInput<String>(''),
  final FormInput<String> lastName = const FormInput<String>(''),
  final FormInput<String> email = const FormInput<String>(''),
}) with Equatable {
  EditProfileState copyWith({
    Resource<void>? submission,
    FormInput<String>? firstName,
    FormInput<String>? lastName,
    FormInput<String>? email,
  }) {
    return EditProfileState(
      submission: submission ?? this.submission,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [submission, firstName, lastName, email];
}
