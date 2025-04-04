import 'package:firebase_auth/firebase_auth.dart';
import 'package:nimbus/Controllers/AuthController.dart';
import 'package:nimbus/Errors/AuthException.dart';
import 'package:nimbus/Services/AuthService.dart';
import 'package:nimbus/Services/DatabaseService.dart';

class AuthControllerImpl implements AuthController {
  AuthControllerImpl({
    required this.authService,
    required this.databaseService,
  });

  final AuthService authService;
  final DatabaseService databaseService;

  @override
  User get user => authService.user;

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await authService.login(email: email, password: password);
      await databaseService.updateLastLogin(userId: user.uid);
    } on AuthException {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await authService.signUp(email: email, password: password);
      await databaseService.createUser(userId: user.uid);
    } on AuthException {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> sendCodeToEmail() async {
    try {
      await authService.sendCodeToEmail();
    } on AuthException {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> sendSmsCode({
    required String phone,
    required void Function(String verificationId) onCodeSent,
  }) async {
    try {
      await authService.sendSmsCode(phone: phone, onCodeSent: onCodeSent);
    } on AuthException {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await authService.signOut();
    } on AuthException {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> verifyCode({required String code}) async {
    try {
      await authService.verifyCode(code: code);
    } on AuthException {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> verifySmsCode({
    required String code,
    required String verificationId,
  }) async {
    try {
      await authService.verifySmsCode(
        code: code,
        verificationId: verificationId,
      );
    } on AuthException {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }
}
