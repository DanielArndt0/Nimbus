abstract class FolderController {
  Future<void> createFolder({
    required String name,
    required String path,
    required String? parentId,
  });
}
