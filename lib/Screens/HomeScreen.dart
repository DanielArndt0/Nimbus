import 'package:flutter/material.dart';
import 'package:nimbus/Providers/impl/FbAuthProviderImpl.dart';
import 'package:nimbus/Services/impl/AuthServiceImpl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(onPressed: () {
            AuthServiceImpl(authProvider: FbAuthProviderImpl()).signOut();
          }, icon: Icon(Icons.exit_to_app_rounded)),
        ],
      ),
    );
  }
}
