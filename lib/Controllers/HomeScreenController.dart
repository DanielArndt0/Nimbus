import 'package:flutter/material.dart';
import 'package:nimbus/Models/FileCloudModel.dart';
import 'package:nimbus/Models/FileLocalModel.dart';

abstract class HomeScreenController {
  TextEditingController get searchController;
  ValueNotifier<String?> get searchNotifier;
  ValueNotifier<List<FileLocalModel>> get uploadFilesNotifier;
  ValueNotifier<bool> get isLoading;

  Future<void> exitPressed();
  Future<void> selectFiles();
  Future<void> uploadSelectedFiles();
  Stream<List<FileCloudModel>> loadFilesFromCloud();

  void searchOnChanged(String? str);
}
