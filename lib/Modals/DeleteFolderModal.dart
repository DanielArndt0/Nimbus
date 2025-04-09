import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';
import 'package:nimbus/Components/AppFormTextField.dart';
import 'package:nimbus/Components/BlueButton.dart';
import 'package:nimbus/Controllers/HomeScreenController.dart';
import 'package:nimbus/Models/FolderModel.dart';
import 'package:nimbus/Utils/FormValidator.dart';

class DeleteFolderModal extends StatelessWidget with FormValidator {
  final HomeScreenController controller;
  final FolderModel folder;
  const DeleteFolderModal({
    super.key,
    required this.controller,
    required this.folder,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text('Are you sure you want to delete this folder?'),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: TextSpan(
              text: 'This will permanently delete the folder. Type ',
              style: TextStyle(color: AppColors.subtext, fontSize: 14),
              children: [
                TextSpan(
                  text: folder.name,
                  style: TextStyle(
                    color: AppColors.subtext,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: ' to confirm.',
                      style: TextStyle(
                        color: AppColors.subtext,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Form(
            key: controller.deleteFormKey,
            child: AppFormTextField(
              controller: controller.deleteFolderName,
              hint: folder.name,
              label: 'Folder name',
              validator: (p0) => combine([
                isNotEmpty(p0),
                equalsTo(p0, folder.name)
              ]),
            ),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
          onPressed: controller.cancelCreateFolder,
          child: Text('Cancel'),
        ),
        BlueButton(
          onPressed: () => controller.deleteFolder(folder),
          label: 'Delete',
        ),
      ],
    );
  }
}
