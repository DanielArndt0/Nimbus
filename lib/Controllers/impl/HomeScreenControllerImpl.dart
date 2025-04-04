import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:nimbus/Controllers/AuthController.dart';
import 'package:nimbus/Controllers/FileController.dart';
import 'package:nimbus/Controllers/HomeScreenController.dart';
import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/Models/FileCloudModel.dart';
import 'package:nimbus/Models/FileLocalModel.dart';
import 'package:nimbus/Services/LogService.dart';

class HomeScreenControllerImpl implements HomeScreenController {
  HomeScreenControllerImpl({
    required this.authController,
    required this.navigationController,
    required this.fileController,
    required this.logService,
  });

  final FileController fileController;
  final AuthController authController;
  final NavigationController navigationController;
  final LogService logService;
  final TextEditingController _searchController = TextEditingController();
  final _searchNotifier = ValueNotifier<String?>('');
  final _uploadFilesNotifier = ValueNotifier<List<FileLocalModel>>([]);
  final _isLoading = ValueNotifier<bool>(false);

  @override
  ValueNotifier<bool> get isLoading => _isLoading;

  @override
  TextEditingController get searchController => _searchController;

  @override
  ValueNotifier<String?> get searchNotifier => _searchNotifier;

  @override
  ValueNotifier<List<FileLocalModel>> get uploadFilesNotifier =>
      _uploadFilesNotifier;

  @override
  Future<void> exitPressed() async {
    await authController.signOut();
  }

  @override
  void searchOnChanged(String? str) {
    _searchNotifier.value = str;
  }

  @override
  Stream<List<FileCloudModel>> loadFilesFromCloud() {
    return fileController.getCloudFiles();
  }

  @override
  Future<void> selectFiles() async {
    try {
      _isLoading.value = true;

      await fileController.selectFiles(
        localFilesNotifier: _uploadFilesNotifier,
      );
    } catch (_) {
    } finally {
      _isLoading.value = false;
    }
  }

  @override
  Future<void> uploadSelectedFiles() async {
    if (_uploadFilesNotifier.value.isNotEmpty) {
      await fileController.uploadFiles(
        localFilesNotifier: _uploadFilesNotifier,
      );
      navigationController.pop();
    }
  }
}
