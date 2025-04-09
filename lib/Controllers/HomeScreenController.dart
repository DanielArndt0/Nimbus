import 'package:flutter/material.dart';
import 'package:nimbus/Models/FolderModel.dart';

abstract class HomeScreenController {
  TextEditingController get searchController;
  TextEditingController get createFolderName;
  GlobalKey<FormState> get createFormKey;
  GlobalKey<FormState> get deleteFormKey;
  TextEditingController get deleteFolderName;
  ValueNotifier<String?> get searchNotifier;

  Future<void> exitPressed();
  void searchOnChanged(String? str);

  Future<void> createFolder();
  Future<void> cancelCreateFolder();

  Future<void> deleteFolder(FolderModel folder);
  Future<void> cancelDeleteFolder();

  Stream<List<FolderModel>> getFolders();

  Widget streamTreatment({
    required BuildContext context,
    required AsyncSnapshot<List<FolderModel>> snapshot,
  });
}
