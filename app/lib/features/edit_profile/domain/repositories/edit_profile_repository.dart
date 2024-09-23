abstract interface class EditProfileRepository {
  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
  });
}
