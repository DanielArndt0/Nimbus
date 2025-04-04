import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Models/FileLocalModel.dart';
import 'package:provider/provider.dart';

class LocalFileCard extends StatelessWidget {
  final IconData? icon;
  final MaterialColor? color;
  final void Function()? onMenuPressed;
  final void Function(LongPressStartDetails)? onLongPressStart;
  final void Function()? onTap;
  const LocalFileCard({
    super.key,
    this.color,
    this.icon,
    this.onMenuPressed,
    this.onLongPressStart,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FileLocalModel>(
      builder: (context, file, _) {
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
                              file.isInCloud
                                  ? Text(
                                    'Uploaded',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                  : Text(
                                    'Local',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                                !file.isUploading
                                    ? SizedBox()
                                    : LinearProgressIndicator(
                                      color: color ?? AppColors.primaryMaterial,
                                      value: file.progress,
                                    ),
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
      },
    );
  }
}
