import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';

class FileCard extends StatelessWidget {
  final String name;
  final String date;
  final String size;
  const FileCard({
    super.key,
    required this.name,
    required this.date,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primarySwatch[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.insert_drive_file_outlined,
                      color: AppColors.primary,
                      size: 36,
                    ),
                    Icon(Icons.more_vert_rounded, color: AppColors.primary),
                  ],
                ),
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColors.subtext, fontSize: 11),
                ),
                Text(
                  size,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColors.subtext, fontSize: 11),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
