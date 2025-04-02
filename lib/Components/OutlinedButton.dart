import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';

class AppOutlinedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const AppOutlinedButton({super.key, this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: AppColors.primarySwatch[100]!),
        ),
      ),
      child: Text(label),
    );
  }
}
