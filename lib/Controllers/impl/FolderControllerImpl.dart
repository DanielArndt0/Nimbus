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

  @override
  Future<void> createFolder({
    required String name,
    required String path,
    required String? parentId,
  }) async {
    final folderRef = databaseService.getFolderRef();

    FolderModel folder = FolderModel(
      id: folderRef.id,
      name: 'name',
      parentId: 'parentId',
      path: 'path',
      createdAt: DateTime.now(),
    );

    await databaseService.createFolder(
      userId: authController.user.uid,
      folder: folder,
    );
  }
}
