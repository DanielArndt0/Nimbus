import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/Providers/FbAuthProvider.dart';

class FbAuthProviderImpl extends ChangeNotifier implements FbAuthProvider {
  final _auth = FirebaseAuth.instance;
  User? _user;

  FbAuthProviderImpl() {
    _auth.idTokenChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  @override
  FirebaseAuth get auth => _auth;

  @override
  User? get user => _user;
}
