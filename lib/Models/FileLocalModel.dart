import 'dart:typed_data';

import 'package:flutter/material.dart';

class FileLocalModel extends ChangeNotifier {
  final String name;
  final String path;
  final String size;
  final Uint8List bytes;

  bool _isUploading = false;
  double _progress = 0.0;
  bool _isInCloud = false;

  FileLocalModel({
    required this.bytes,
    required this.name,
    required this.path,
    required this.size,
  });

  double get progress => _progress;
  bool get isUploading => _isUploading;
  bool get isInCloud => _isInCloud;

  set progress(double val) {
    _progress = val;
    notifyListeners();
  }

  set isUploading(bool val) {
    _isUploading = val;
    notifyListeners();
  }

  set isInCloud(bool val) {
    _isInCloud = val;
    notifyListeners();
  }
}
