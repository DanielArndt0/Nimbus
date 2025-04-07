import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';

class WarningMessage extends StatelessWidget {
  final String message;
  const WarningMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(
        color: AppColors.subtext,
        fontStyle: FontStyle.italic,
        fontSize: 16,
      ),
    );
  }
}
