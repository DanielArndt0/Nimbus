import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';

class FolderCard extends StatelessWidget {
  final String name;
  final void Function()? onTap;
  const FolderCard({super.key, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(),
            Icon(
              Icons.folder_open_outlined,
              color: AppColors.primary,
              size: 32,
            ),
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              name,
              style: TextStyle(
                color: AppColors.fontColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
