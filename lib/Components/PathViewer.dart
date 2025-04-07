import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';

class PathViewer extends StatelessWidget {
  final String path;
  const PathViewer({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    final List<String> segments =
        path.split('/').where((element) => element.isNotEmpty).toList();
    return Row(
      children: [
        Icon(Icons.arrow_forward_ios_rounded, size: 16),
        Text(
          'User',
          style: TextStyle(
            color: AppColors.fontColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        ..._buildSegments(segments),
      ],
    );
  }

  List<Widget> _buildSegments(List<String> segments) {
    List<Widget> widgets = [];

    for (final segment in segments) {
      widgets.add(Icon(Icons.arrow_forward_ios_rounded, size: 16));
      widgets.add(
        Text(
          segment,
          style: TextStyle(
            color: AppColors.subtext,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      );
    }
    return widgets;
  }
}
