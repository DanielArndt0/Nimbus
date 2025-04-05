import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:nimbus/Models/FileCloudModel.dart';
import 'package:nimbus/Models/FileLocalModel.dart';

abstract class StorageService {
  Future<void> uploadFiles({
    required String userId,
    required ValueNotifier<List<FileLocalModel>> filesNotifier,
    required Future<void> Function(FileCloudModel file) onUploadComplete,
  });

  Future<List<Reference>> getFiles({required String userId, String? ref});

  Future<FullMetadata> getMetadata({
    required String userId,
    required String? ref,
  });
}
