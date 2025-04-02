import 'package:flutter/material.dart';
import 'package:nimbus/NamedRoutes.dart';
import 'package:nimbus/Providers/FbAuthProvider.dart';
import 'package:nimbus/Services/NavigationService.dart';
import 'package:provider/provider.dart';

class AutoLogin extends StatelessWidget {
  final Widget child;
  const AutoLogin({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Consumer2<FbAuthProvider, NavigationService>(
      builder: (context, authProvider, navigationService, _) {
        final user = authProvider.user;

        if (user != null) {
          Future.microtask(() {
            if (user.emailVerified) {
              navigationService.popAllAndPushNamed(route: NamedRoutes.home);
            } else {
              navigationService.popAllAndPushNamed(route: NamedRoutes.auth);
            }
          });
        }

        return child;
      },
    );
  }
}
