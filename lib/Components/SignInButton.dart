import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';

class SignInButton extends StatelessWidget {
  final void Function()? onPressed;
  const SignInButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Already have an account?'),
        TextButton(
          onPressed: onPressed,
          child: Text('Log in here', style: TextStyle(color: AppColors.primary)),
        ),
      ],
    );
  }
}
