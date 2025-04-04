import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:nimbus/Models/FileCloudModel.dart';
import 'package:nimbus/Models/FileLocalModel.dart';
import 'package:nimbus/Services/StorageService.dart';

class StorageServiceImpl implements StorageService {
  StorageServiceImpl._();
  static final StorageServiceImpl instance = StorageServiceImpl._();

  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> _uploadSingleFile({
    required String userId,
    required FileLocalModel file,
    required void Function(FileCloudModel file) onUploadComplete,
  }) async {
    try {
      final ref = _storage.ref('users/$userId/${file.name}');
      final task = ref.putData(file.bytes);

      file.isUploading = true;
      file.progress = 0.0;
      file.isInCloud = false;

      await for (final event in task.snapshotEvents) {
        file.progress = event.bytesTransferred / event.totalBytes;
      }
      await task;

      file.progress = 1.0;
      file.isUploading = false;
      file.isInCloud = true;

      final metadata = await ref.getMetadata();
    
      onUploadComplete(
        FileCloudModel(
          name: file.name,
          type: metadata.contentType ?? 'application/octet-stream',
          path: ref.fullPath,
          size: file.size,
          uploadAt: DateTime.now(),
        ),
      );
    } catch (e) {
      file.isUploading = false;
      file.progress = 0.0;
      file.isInCloud = false;
    }
  }

  @override
  Future<void> uploadFiles({
    required String userId,
    required ValueNotifier<List<FileLocalModel>> filesNotifier,
    required Future<void> Function(FileCloudModel file) onUploadComplete,
  }) async {
    final uploads = <Future<void>>[];

    for (final file in filesNotifier.value) {
      final uploadFuture = _uploadSingleFile(
        userId: userId,
        file: file,
        onUploadComplete: onUploadComplete,
      );
      uploads.add(uploadFuture);
    }

    await Future.wait(uploads);
  }

  @override
  Future<List<Reference>> getFiles({
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
