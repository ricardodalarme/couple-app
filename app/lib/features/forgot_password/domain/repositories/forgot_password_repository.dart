abstract interface class ForgotPasswordRepository {
  Future<void> forgotPassword({
    required String email,
  });
}
