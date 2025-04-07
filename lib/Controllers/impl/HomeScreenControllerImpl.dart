import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:nimbus/Controllers/AuthController.dart';
import 'package:nimbus/Controllers/HomeScreenController.dart';
import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/Services/LogService.dart';

class HomeScreenControllerImpl implements HomeScreenController {
  HomeScreenControllerImpl({
    required this.authController,
    required this.navigationController,
    required this.logService,
  });

  final AuthController authController;
  final NavigationController navigationController;
  final LogService logService;
  final TextEditingController _searchController = TextEditingController();
  final _searchNotifier = ValueNotifier<String?>('');

  @override
  TextEditingController get searchController => _searchController;

  @override
  ValueNotifier<String?> get searchNotifier => _searchNotifier;

  @override
  Future<void> exitPressed() async {
    await authController.signOut();
  }

  @override
  void searchOnChanged(String? str) {
    _searchNotifier.value = str;
  }
}
