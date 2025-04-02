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
  final _itemCount = ValueNotifier<int>(0);

  @override
  TextEditingController get searchController => _searchController;

  @override
  Future<void> refresh() async {
    // Pode lançar UserLogoutException
    final count = await storageService.getFileCount(
      userId: authService.user.uid,
    );
    _itemCount.value = count;
  }

  @override
  Future<void> addIconPressed() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      await storageService.uploadFiles(
        userId: authService.user.uid, // Pode lançar UserLogoutException
        files: result.files,
      );
      await refresh();
    }
  }

  @override
  Future<void> exitPressed() async {
    await authService.signOut();
  }

  @override
  ValueNotifier<int> get itemCountNotifier => _itemCount;

  @override
  Future<List<Reference>> getFilesSimpleData() async {
    return storageService.getFilesSimpleReferences(
      userId: authService.user.uid,
    );
  }

  @override
  Future<FullMetadata> getFileMetadata({required String ref}) async {
    return storageService.getMetadata(userId: authService.user.uid, ref: ref);
  }
}
