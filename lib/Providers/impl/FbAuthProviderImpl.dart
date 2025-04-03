import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nimbus/Providers/FbAuthProvider.dart';

class FbAuthProviderImpl extends ChangeNotifier implements FbAuthProvider {
  final _auth = FirebaseAuth.instance;
  User? _user;
  Timer? _emailVerificationTimer;

  FbAuthProviderImpl() {
    _auth.idTokenChanges().listen((user) {
      _user = user;
      notifyListeners();

      if (_user != null) {
        if (!user!.emailVerified && user.phoneNumber == null) {
          _startEmailVerificationLoop();
        } else {
          _stopEmailVerificationLoop();
        }
      }
    });
  }

  @override
  FirebaseAuth get auth => _auth;

  @override
  User? get user => _user;

  void _startEmailVerificationLoop() {
    _emailVerificationTimer?.cancel();
    _emailVerificationTimer = Timer.periodic(Duration(seconds: 2), (
      timer,
    ) async {
      Logger().d('Email verification job');
      await auth.currentUser?.reload(); // Refresh
      _user = auth.currentUser;

      notifyListeners();
      if (user != null && user!.emailVerified) {
        _stopEmailVerificationLoop();
      }
    });
  }

  void _stopEmailVerificationLoop() {
    _emailVerificationTimer?.cancel();
    _emailVerificationTimer = null;
  }

  @override
  void dispose() {
    _stopEmailVerificationLoop();
    super.dispose();
  }
}
