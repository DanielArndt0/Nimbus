import 'package:flutter/material.dart';

abstract class HomeScreenController {
  TextEditingController get searchController;
  ValueNotifier<String?> get searchNotifier;

  Future<void> exitPressed();

  void searchOnChanged(String? str);
}
