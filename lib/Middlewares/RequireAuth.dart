import 'package:flutter/material.dart';
import 'package:nimbus/NamedRoutes.dart';
import 'package:nimbus/Providers/FbAuthProvider.dart';
import 'package:nimbus/Services/NavigationService.dart';
import 'package:provider/provider.dart';

class RequireAuth extends StatelessWidget {
  final Widget child;
  const RequireAuth({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final navigationService = Provider.of<NavigationService>(context);
    final authProvider = Provider.of<FbAuthProvider>(context);

    if (authProvider.user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        navigationService.popAllAndPushNamed(route: NamedRoutes.onboarding);
      });
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return child;
  }
}
