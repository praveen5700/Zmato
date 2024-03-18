abstract class AuthRepo{
  Future<bool?> registerUserWithEmailPassword(String email, String password);

  Future<void> sendVerificationEmail();

   Future<bool?> logOut();

   Future<bool?> loginUsingEmailAndPassword(String email, String password);

   Future<bool?> resetPassword(String email);

   Future<bool> changePassword(String currentPassword, String newPassword);
}