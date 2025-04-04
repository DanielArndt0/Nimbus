import 'package:flutter/material.dart';
import 'package:nimbus/Models/FileCloudModel.dart';
import 'package:nimbus/Models/FileLocalModel.dart';

abstract class FileController {
  Future<void> selectFiles({
    required ValueNotifier<List<FileLocalModel>> localFilesNotifier,
  });
  Future<void> uploadFiles({
    required ValueNotifier<List<FileLocalModel>> localFilesNotifier,
  });

  Stream<List<FileCloudModel>> getCloudFiles();
}
