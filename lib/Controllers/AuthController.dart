import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthController {
  Future<void> signOut();
  Future<void> login({required String email, required String password});
  Future<void> signUp({required String email, required String password});
  Future<void> sendCodeToEmail();
  Future<void> verifyCode({required String code});
  Future<void> sendSmsCode({
    required String phone,
    required void Function(String verificationId) onCodeSent,
  });
  Future<void> verifySmsCode({
    required String code,
    required String verificationId,
  });

  User get user;
}
