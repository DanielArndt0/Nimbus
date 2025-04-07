import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';

class OpenFSButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const OpenFSButton({super.key, this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: AppColors.primary),
        ),
      ),
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.add, color: AppColors.primary),
          Text(label, style: TextStyle(color: AppColors.primary)),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
