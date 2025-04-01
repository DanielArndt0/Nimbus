import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/ProviderHandler.dart';
import 'package:nimbus/firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(providerHandler);
}
