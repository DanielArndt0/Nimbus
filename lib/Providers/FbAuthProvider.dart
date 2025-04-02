import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class FbAuthProvider implements ChangeNotifier{
  FirebaseAuth get auth;
  User? get user;
}
