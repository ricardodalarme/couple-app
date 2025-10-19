part of 'edit_profile_bloc.dart';

final class EditProfileState with EquatableMixin, FormzMixin {
  const EditProfileState({
    this.submission = const Initial(),
    this.firstName = const NonEmptyInput.pure(),
    this.lastName = const NonEmptyInput.pure(),
    this.email = const EmailInput.pure(),
  });

  final Resource<void> submission;
  final NonEmptyInput firstName;
  final NonEmptyInput lastName;
  final EmailInput email;

  EditProfileState copyWith({
    Resource<void>? submission,
    NonEmptyInput? firstName,
    NonEmptyInput? lastName,
    EmailInput? email,
  }) {
    return EditProfileState(
      submission: submission ?? this.submission,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [firstName, lastName, email];

  @override
  List<Object?> get props => [submission, firstName, lastName, email];
}
