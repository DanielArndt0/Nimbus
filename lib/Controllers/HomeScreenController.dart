import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

abstract class HomeScreenController {
  TextEditingController get searchController;

  Future<void> addIconPressed();
  Future<void> exitPressed();
  Future<void> refresh();
  Future<List<Reference>> getFilesSimpleData();
  Future<FullMetadata> getFileMetadata({required String ref});
  ValueNotifier<int> get itemCountNotifier;
}
