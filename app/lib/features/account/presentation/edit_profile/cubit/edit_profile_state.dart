part of 'edit_profile_cubit.dart';

final class const EditProfileState({
  final Resource<void> submission = const Initial(),
  final NonEmptyInput firstName = const NonEmptyInput.pure(),
  final NonEmptyInput lastName = const NonEmptyInput.pure(),
  final EmailInput email = const EmailInput.pure(),
}) with Equatable, FormzMixin {
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
