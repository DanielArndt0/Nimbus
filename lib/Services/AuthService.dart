abstract class AuthService {
  Future<void> signOut();
  Future<void> login({required String email, required String password});
  Future<void> signUp({required String email, required String password});
  Future<void> signUpWithPhone({required String phone});
  Future<void> sendCodeToEmail();
  Future<void> verifyCode({required String code});
}
