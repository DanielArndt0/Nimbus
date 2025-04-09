import 'package:flutter/foundation.dart';
import 'package:nimbus/Models/FolderModel.dart';

abstract class FolderController {
  Future<void> createFolder({
    required String name,
    required String userId,
    required String path,
    String? parentId,
  });

  Future<void> deleteFolder({required FolderModel folder});

  void enterFolder({required String newPath});
  void goBack();

  Stream<List<FolderModel>> getFolders({required String userId});

  String get currentPath;
  ValueNotifier<String> get currentPathNotifier;
}
