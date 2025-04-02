import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class FbAuthProvider extends ChangeNotifier{
  FirebaseAuth get auth;
  User? get user;
}
