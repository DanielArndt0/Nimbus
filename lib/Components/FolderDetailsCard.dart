import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Components/BlueButton.dart';
import 'package:nimbus/Models/FolderModel.dart';

class FolderDetailCard extends StatelessWidget {
  final FolderModel folder;

  const FolderDetailCard({super.key, required this.folder});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(),
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + kToolbarHeight,
            right: 40,
            left: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.folder_open_rounded,
                    size: 48,
                    color: AppColors.primary,
                  ),
                  SizedBox(height: 10),
                  Text(
                    folder.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              color: AppColors.primary,
            ),
            child: Column(children: []),
          ),
        ),
        BlueButton(onPressed: () => Navigator.pop(context), label: 'Close'),
        SizedBox(height: 60),
      ],
    );
  }
}
