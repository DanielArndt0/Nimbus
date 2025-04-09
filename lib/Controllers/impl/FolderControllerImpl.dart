import 'package:flutter/widgets.dart';
import 'package:nimbus/Controllers/AuthController.dart';
import 'package:nimbus/Controllers/FolderController.dart';
import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/Models/FolderModel.dart';
import 'package:nimbus/Services/DatabaseService.dart';

class FolderControllerImpl implements FolderController {
  FolderControllerImpl({
    required this.databaseService,
    required this.authController,
    required this.navigationController,
  });

  final DatabaseService databaseService;
  final AuthController authController;
  final NavigationController navigationController;

  final ValueNotifier<String> _currentPathNotifier = ValueNotifier<String>('/');

  @override
  ValueNotifier<String> get currentPathNotifier => _currentPathNotifier;

  @override
  String get currentPath => _currentPathNotifier.value;

  @override
  Future<void> createFolder({
    required String name,
    required String userId,
    required String path,
    String? parentId,
  }) async {
    final folderRef = databaseService.getFolderRef();

    FolderModel folder = FolderModel(
      id: folderRef.id,
      name: name,
      userId: userId,
      parentId: parentId,
      path: path,
      createdAt: DateTime.now(),
    );

    await databaseService.createFolder(
      userId: authController.user.uid,
      folder: folder,
    );
  }

  @override
  void enterFolder({required String newPath}) {
    _currentPathNotifier.value = newPath;
  }

  @override
  void goBack() {
    final segments = _currentPathNotifier.value.split('/');

    if (segments.length > 1) {
      _currentPathNotifier.value = segments
          .sublist(0, segments.length - 1)
          .join('/');
    }
  }

  @override
  Stream<List<FolderModel>> getFolders({required String userId}) {
    return databaseService.listenFolders(userId: userId, path: currentPath);
  }
  
  @override
  Future<void> deleteFolder({required FolderModel folder}) async {
    databaseService.deleteFolder(folder: folder);
  }
}
