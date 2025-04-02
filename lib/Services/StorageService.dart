import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class StorageService {
  Future<void> uploadFiles({
    required String userId,
    required List<PlatformFile> files,
  });

  Future<int> getFileCount({required String userId, String? ref});

  Future<List<Reference>> getFilesSimpleReferences({
    required String userId,
    String? ref,
  });

  Future<FullMetadata> getMetadata({
    required String userId,
    required String? ref,
  });
}
