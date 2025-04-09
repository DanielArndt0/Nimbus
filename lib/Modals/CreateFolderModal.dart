import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/Components/AppFormTextField.dart';
import 'package:nimbus/Components/BlueButton.dart';
import 'package:nimbus/Controllers/HomeScreenController.dart';
import 'package:nimbus/Utils/FormValidator.dart';

class CreateFolderModal extends StatelessWidget with FormValidator {
  final HomeScreenController controller;
  const CreateFolderModal({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Create a new folder')),
      content: Form(
        key: controller.createFormKey,
        child: AppFormTextField(
          controller: controller.createFolderName,
          hint: 'Projects',
          label: 'Folder name',
          validator: isNotEmpty,
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(onPressed: controller.cancelCreateFolder, child: Text('Cancel')),
        BlueButton(onPressed: controller.createFolder, label: 'Create'),
      ],
    );
  }
}
