import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';

class SectionName extends StatelessWidget {
  final String name;
  const SectionName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyle(
            color: AppColors.fontColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Icon(Icons.keyboard_arrow_down_rounded),
      ],
    );
  }
}
