import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';

class FileCard extends StatelessWidget {
  final String name;
  final String date;
  final String size;
  final void Function()? onPressed;
  const FileCard({
    super.key,
    required this.name,
    required this.date,
    required this.size,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryMaterial[50],
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.insert_drive_file_rounded,
                  size: 48,
                  color: AppColors.primaryMaterial,
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: AppColors.fontColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      size,
                      style: TextStyle(color: AppColors.subtext, fontSize: 14),
                    ),
                    Text(
                      date,
                      style: TextStyle(color: AppColors.subtext, fontSize: 12),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: onPressed,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Open',

                    style: TextStyle(color: AppColors.primaryMaterial),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
