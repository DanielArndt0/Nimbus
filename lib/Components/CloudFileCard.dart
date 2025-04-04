import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Models/FileCloudModel.dart';

class CloudFileCard extends StatelessWidget {
  final FileCloudModel file;
  final IconData? icon;
  final MaterialColor? color;
  final void Function()? onMenuPressed;
  final void Function(LongPressStartDetails)? onLongPressStart;
  final void Function()? onTap;
  const CloudFileCard({
    super.key,
    this.color,
    this.icon,
    this.onMenuPressed,
    this.onLongPressStart,
    this.onTap,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        child: GestureDetector(
          onLongPressStart: onLongPressStart,
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: color?.shade50 ?? AppColors.primarySwatch[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 30,
                left: 10,
                top: 10,
                bottom: 10,
              ),
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
                            icon ?? Icons.insert_drive_file_outlined,
                            color: color ?? AppColors.primary,
                            size: 36,
                          ),
                        ],
                      ),
                      Text(
                        file.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: color ?? AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text(
                              file.size,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.subtext,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
