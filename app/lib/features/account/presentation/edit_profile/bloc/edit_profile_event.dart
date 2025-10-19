part of 'edit_profile_bloc.dart';

sealed class EditProfileEvent {
  const EditProfileEvent();
}

class EditProfileFirstNameChanged extends EditProfileEvent {
  const EditProfileFirstNameChanged(this.firstName);

  final String firstName;
}

class EditProfileLastNameChanged extends EditProfileEvent {
  const EditProfileLastNameChanged(this.lastName);

  final String lastName;
}

class EditProfileEmailChanged extends EditProfileEvent {
  const EditProfileEmailChanged(this.email);

  final String email;
}

class EditProfileSubmitted extends EditProfileEvent {
  const EditProfileSubmitted();
}
