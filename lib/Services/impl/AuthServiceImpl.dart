import 'package:firebase_auth/firebase_auth.dart';
import 'package:nimbus/Errors/AuthException.dart';
import 'package:nimbus/Errors/EmailAlreadyInUseException.dart';
import 'package:nimbus/Errors/ExpiredActionCodeException.dart';
import 'package:nimbus/Errors/InvalidActionCodeException.dart';
import 'package:nimbus/Errors/InvalidCredentialException.dart';
import 'package:nimbus/Errors/InvalidEmailException.dart';
import 'package:nimbus/Errors/NetworkRequestFailedException.dart';
import 'package:nimbus/Errors/OperationNotAllowedException.dart';
import 'package:nimbus/Errors/TooManyRequestsException.dart';
import 'package:nimbus/Errors/UserDisabledException.dart';
import 'package:nimbus/Errors/UserLogoutException.dart';
import 'package:nimbus/Errors/UserNotFoundException.dart';
import 'package:nimbus/Errors/UserTokenExpiredException.dart';
import 'package:nimbus/Errors/WeakPasswordException.dart';
import 'package:nimbus/Errors/WrongPasswordException.dart';
import 'package:nimbus/Providers/FbAuthProvider.dart';
import 'package:nimbus/Services/AuthService.dart';

class AuthServiceImpl implements AuthService {
  AuthServiceImpl({required this.authProvider});

  FbAuthProvider authProvider;

  @override
  User get user {
    try {
      return authProvider.user!;
    } catch (error) {
      throw throw UserLogouException();
    }
  }

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await authProvider.auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        throw InvalidEmailException();
      } else if (error.code == 'user-disabled') {
        throw UserDisabledException();
      } else if (error.code == 'user-not-found') {
        throw UserNotFoundException();
      } else if (error.code == 'wrong-password') {
        throw WrongPasswordException();
      } else if (error.code == 'operation-not-allowed') {
        throw OperationNotAllowedException();
      } else if (error.code == 'too-many-requests') {
        throw TooManyRequestsException();
      } else if (error.code == 'user-token-expired') {
        throw UserTokenExpiredException();
      } else if (error.code == 'network-request-failed') {
        throw NetworkRequestFailedException();
      } else if (error.code == 'invalid-credential' ||
          error.code == 'INVALID_LOGIN_CREDENTIALS') {
        throw InvalidCredentialException();
      }
      throw AuthException(
        message: 'Auth exception error',
        code: 'unknown-code',
      );
    } catch (error) {
      throw AuthException(message: error.toString(), code: 'unknown-code');
    }
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await authProvider.auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        throw InvalidEmailException();
      } else if (error.code == 'email-already-in-use') {
        throw EmailAlreadyInUseException();
      } else if (error.code == 'weak-password') {
        throw WeakPasswordException();
      } else if (error.code == 'wrong-password') {
        throw WrongPasswordException();
      } else if (error.code == 'operation-not-allowed') {
        throw OperationNotAllowedException();
      } else if (error.code == 'too-many-requests') {
        throw TooManyRequestsException();
      } else if (error.code == 'user-token-expired') {
        throw UserTokenExpiredException();
      } else if (error.code == 'network-request-failed') {
        throw NetworkRequestFailedException();
      }
      throw AuthException(
        message: 'Auth exception error',
        code: 'unknown-code',
      );
    } catch (error) {
      throw AuthException(message: error.toString(), code: 'unknown-code');
    }
  }

  @override
  Future<void> signOut() async {
    await authProvider.auth.signOut();
  }

  @override
  Future<void> sendCodeToEmail() async {
    try {
      await authProvider.user!.sendEmailVerification();
    } on FirebaseAuthException catch (error) {
      throw AuthException(
        message: error.message ?? 'Auth Exception',
        code: error.code,
      );
    }
  }

  @override
  Future<void> verifyCode({required String code}) async {
    try {
      await authProvider.auth.checkActionCode(code);
      await authProvider.user?.reload();
    } on FirebaseAuthException catch (error) {
      if (error.code == 'expired-action-code') {
        throw ExpiredActionCodeException();
      } else if (error.code == 'invalid-action-code') {
        throw InvalidActionCodeException();
      } else if (error.code == 'user-disabled') {
        throw UserDisabledException();
      } else if (error.code == 'user-not-found') {
        throw UserNotFoundException();
      }
      throw AuthException(
        message: 'Auth exception error',
        code: 'unknown-code',
      );
    } catch (error) {
      throw AuthException(message: error.toString(), code: 'unknown-code');
    }
  }

  @override
  Future<void> sendSmsCode({
    required String phone,
    required void Function(String verificationId) onCodeSent,
  }) async {
    try {
      await authProvider.auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (phoneAuthCredential) {},
        verificationFailed: (error) {
          throw AuthException(
            message: error.message ?? 'Auth Exception',
            code: error.code,
          );
        },
        codeSent: (verificationId, forceResendingToken) {
          onCodeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (error) {
      throw AuthException(
        message: error.message ?? error.toString(),
        code: error.code,
      );
    } catch (error) {
      throw AuthException(message: error.toString(), code: 'unknown-code');
    }
  }

  @override
  Future<void> verifySmsCode({
    required String code,
    required String verificationId,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: code,
      );
      await authProvider.auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (error) {
      throw AuthException(
        message: error.message ?? error.toString(),
        code: error.code,
      );
    } catch (error) {
      throw AuthException(message: error.toString(), code: 'unknown-code');
    }
  }
}
