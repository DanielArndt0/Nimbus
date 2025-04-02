import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';

class BlueButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const BlueButton({required this.onPressed, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryMaterial,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
