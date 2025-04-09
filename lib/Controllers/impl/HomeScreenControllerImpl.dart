import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:nimbus/Components/FoldersList.dart';
import 'package:nimbus/Components/WarningMessage.dart';
import 'package:nimbus/Controllers/AuthController.dart';
import 'package:nimbus/Controllers/FolderController.dart';
import 'package:nimbus/Controllers/HomeScreenController.dart';
import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/Models/FolderModel.dart';
import 'package:nimbus/Services/LogService.dart';

class HomeScreenControllerImpl implements HomeScreenController {
  HomeScreenControllerImpl({
    required this.folderController,
    required this.authController,
    required this.navigationController,
    required this.logService,
  });

  final AuthController authController;
  final FolderController folderController;
  final NavigationController navigationController;
  final LogService logService;

  final _searchController = TextEditingController();
  final _createFolderName = TextEditingController();
  final _createFormKey = GlobalKey<FormState>();
  final _deleteFolderName = TextEditingController();
  final _deleteFormKey = GlobalKey<FormState>();
  final _searchNotifier = ValueNotifier<String?>('');

  @override
  TextEditingController get searchController => _searchController;

  @override
  TextEditingController get createFolderName => _createFolderName;

  @override
  TextEditingController get deleteFolderName => _deleteFolderName;

  @override
  GlobalKey<FormState> get deleteFormKey => _deleteFormKey;

  @override
  GlobalKey<FormState> get createFormKey => _createFormKey;

  @override
  ValueNotifier<String?> get searchNotifier => _searchNotifier;

  @override
  Future<void> exitPressed() async {
    await authController.signOut();
  }

  @override
  void searchOnChanged(String? str) {
    _searchNotifier.value = str;
  }

  @override
  Future<void> createFolder() async {
    if (createFormKey.currentState!.validate()) {
      final name = createFolderName.text.trim();
      await folderController.createFolder(
        name: name,
        userId: authController.user.uid,
        path: folderController.currentPath,
      );
      navigationController.pop();
      createFolderName.text = '';
    }
  }

  @override
  Future<void> cancelCreateFolder() async {
    return navigationController.pop();
  }

  @override
  Stream<List<FolderModel>> getFolders() {
    return folderController.getFolders(userId: authController.user.uid);
  }

  @override
  Future<void> cancelDeleteFolder() async {
    return navigationController.pop();
  }

  @override
  Future<void> deleteFolder(FolderModel folder) async {
    if (deleteFormKey.currentState!.validate()) {
      await folderController.deleteFolder(folder: folder);
      deleteFolderName.text = '';
      cancelDeleteFolder();
    }
  }

  @override
  Widget streamTreatment({
    required BuildContext context,
    required AsyncSnapshot<List<FolderModel>> snapshot,
  }) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }

    if (!snapshot.hasData || snapshot.data == null) {
      return WarningMessage(
        message: 'Looks like it\'s empty here. Let\'s create a folder!',
      );
    }

    if (snapshot.data!.isEmpty) {
      return WarningMessage(
        message: 'Looks like it\'s empty here. Let\'s create a folder!',
      );
    }

    final folders = snapshot.data!;

    return FoldersList(folders: folders, controller: this);
  }
}
