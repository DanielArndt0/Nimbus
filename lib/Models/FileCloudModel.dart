import 'package:cloud_firestore/cloud_firestore.dart';

class FileCloudModel {
  final String name;
  final String type;
  final String path;
  final String size;
  final DateTime uploadAt;

  FileCloudModel({
    required this.name,
    required this.type,
    required this.path,
    required this.size,
    required this.uploadAt,
  });

  factory FileCloudModel.fromJson({required Map<String, dynamic> json}) {
    return FileCloudModel(
      name: json['name'],
      path: json['path'],
      size: json['size'],
      type: json['type'],
      uploadAt: (json['uploadAt'] as Timestamp).toDate(),
    );
  }

  factory FileCloudModel.fromDoc({required DocumentSnapshot doc}) {
    return FileCloudModel.fromJson(json: (doc.data as Map<String, dynamic>));
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'path': path,
      'size': size,
      'type': type,
      'uploadAt': uploadAt,
    };
  }
}
