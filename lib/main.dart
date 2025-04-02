import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/ProviderHandler.dart';
import 'package:nimbus/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await HiveConfig.start(); 
  
  runApp(providerHandler);
}
