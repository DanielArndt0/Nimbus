import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:nimbus/Services/StorageService.dart';

class StorageServiceImpl implements StorageService {
  StorageServiceImpl._();
  static final StorageServiceImpl instance = StorageServiceImpl._();

  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Future<void> uploadFiles({
    required String userId,
    required List<PlatformFile> files,
  }) async {
    for (final file in files) {
      if (file.path != null) {
        final fileData = File(file.path!).readAsBytesSync();
        await _storage.ref('$userId/${file.name}').putData(fileData);
      }
    }
  }

  @override
  Future<int> getFileCount({required String userId, String? ref}) async {
    final result = await _storage.ref('$userId/${ref ?? ''}').list();
    return result.items.length;
  }

  @override
  Future<List<Reference>> getFilesSimpleReferences({
    required String userId,
    String? ref,
  }) async {
    final result = await _storage.ref('$userId/${ref ?? ''}').list();
    return result.items;
  }

  @override
  Future<FullMetadata> getMetadata({
    required String userId,
    required String? ref,
  }) async {
    return await _storage.ref('$userId/$ref').getMetadata();
  }
}
