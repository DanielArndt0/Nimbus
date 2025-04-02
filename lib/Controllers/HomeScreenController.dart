import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

abstract class HomeScreenController {
  TextEditingController get searchController;

  Future<void> addIconPressed();
  Future<void> exitPressed();
  Future<List<Reference>> getFilesSimpleData();
  ValueNotifier<String?> get searchNotifier;
  void searchOnChanged(String? str);
}
