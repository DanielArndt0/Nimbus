import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:nimbus/Controllers/HomeScreenController.dart';
import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/Services/AuthService.dart';
import 'package:nimbus/Services/LogService.dart';
import 'package:nimbus/Services/StorageService.dart';

class HomeScreenControllerImpl implements HomeScreenController {
  HomeScreenControllerImpl({
    required this.authService,
    required this.navigationController,
    required this.storageService,
    required this.logService,
  });

  final AuthService authService;
  final NavigationController navigationController;
  final LogService logService;
  final StorageService storageService;
  final TextEditingController _searchController = TextEditingController();
  final _searchNotifier = ValueNotifier<String?>('');

  @override
  TextEditingController get searchController => _searchController;

  @override
  ValueNotifier<String?> get searchNotifier => _searchNotifier;

  @override
  Future<void> addIconPressed() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      await storageService.uploadFiles(
        userId: authService.user.uid, // Pode lançar UserLogoutException
        files: result.files,
      );
    }
  }

  @override
  Future<void> exitPressed() async {
    await authService.signOut();
  }

  @override
  Future<List<Reference>> getFilesSimpleData() async {
    return storageService.getFilesSimpleReferences(
      userId: authService.user.uid,
    );
  }

  @override
  void searchOnChanged(String? str) {
    _searchNotifier.value = str;
  }
}
