import 'package:quickstart_flutter_bloc/features/edit_profile/data/data_sources/edit_profile_data_source.dart';

class EditProfileRepository {
  const EditProfileRepository({required EditProfileDataSource editProfileDataSource})
    : _editProfileDataSource = editProfileDataSource;

  final EditProfileDataSource _editProfileDataSource;

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    await _editProfileDataSource.updateUser(firstName: firstName, lastName: lastName, email: email);
  }
}
