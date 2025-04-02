import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 100, height: 1, color: AppColors.primaryMaterial[100]),
        const SizedBox(width: 10),
        Text('or', style: TextStyle(color: AppColors.subtext)),
        const SizedBox(width: 10),
        Container(width: 100, height: 1, color: AppColors.primaryMaterial[100]),
      ],
    );
  }
}
