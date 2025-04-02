import 'package:flutter/cupertino.dart';
import 'package:nimbus/NamedRoutes.dart';
import 'package:nimbus/Providers/FbAuthProvider.dart';
import 'package:nimbus/Services/NavigationService.dart';
import 'package:provider/provider.dart';

class VerifyEmail extends StatelessWidget {
  final Widget child;
  const VerifyEmail({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Consumer2<FbAuthProvider, NavigationService>(
      builder: (context, authProvider, navigationSerivce, _) {
        Future.microtask(() {
          if (authProvider.user!.emailVerified) {
            navigationSerivce.popAllAndPushNamed(route: NamedRoutes.home);
          }
        });

        return child;
      },
    );
  }
}
