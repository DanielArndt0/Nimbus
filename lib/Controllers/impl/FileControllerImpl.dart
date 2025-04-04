import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/Controllers/AuthController.dart';
import 'package:nimbus/Controllers/FileController.dart';
import 'package:nimbus/Models/FileCloudModel.dart';
import 'package:nimbus/Models/FileLocalModel.dart';
import 'package:nimbus/Services/DatabaseService.dart';
import 'package:nimbus/Services/StorageService.dart';
import 'package:nimbus/Utils/Format.dart';

class FileControllerImpl implements FileController {
  FileControllerImpl({
    required this.authController,
    required this.databaseService,
    required this.storageService,
  });

  final AuthController authController;
  final DatabaseService databaseService;
  final StorageService storageService;

  Future<FileLocalModel?> processFile(PlatformFile file) async {
    if (file.path == null) return null;

    final data = File(file.path!).readAsBytesSync();

    return FileLocalModel(
      name: file.name,
      path: file.path!,
      size: Format.formatBytes(file.size),
      bytes: data,
    );
  }

  @override
  Future<void> selectFiles({
    required ValueNotifier<List<FileLocalModel>> localFilesNotifier,
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    if (result == null || result.files.isEmpty) return;

    final processedFiles = await Future.wait(result.files.map(processFile));

    final existingHashes =
        localFilesNotifier.value.map((file) => file.name).toSet();

    final newFiles =
        processedFiles
            .whereType<FileLocalModel>()
            .where((file) => !existingHashes.contains(file.name))
            .toList();

    if (newFiles.isNotEmpty) {
      localFilesNotifier.value = [...localFilesNotifier.value, ...newFiles];
    }
  }

  @override
  Future<void> uploadFiles({
    required ValueNotifier<List<FileLocalModel>> localFilesNotifier,
  }) async {
    List<FileCloudModel> cloudFiles = [];
    await storageService.uploadFiles(
      userId: authController.user.uid,
      filesNotifier: localFilesNotifier,

      onUploadComplete: (file) async {
        cloudFiles.add(file);
      },
    );
    if (cloudFiles.isNotEmpty) {
      await databaseService.createFiles(
        userId: authController.user.uid,
        files: cloudFiles,
      );
    }

    
  }
  
  @override
  Stream<List<FileCloudModel>> getCloudFiles() {
    return databaseService.listenFiles(userId: authController.user.uid);
  }
}
