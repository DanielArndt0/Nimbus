import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';

class SignUpButton extends StatelessWidget {
  final void Function()? onPressed;
  const SignUpButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Don\'t have account? Create here!'),
        TextButton(
          onPressed: onPressed,
          child: Text('Sign Up', style: TextStyle(color: AppColors.primary)),
        ),
      ],
    );
  }
}
