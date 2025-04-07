import 'package:cloud_firestore/cloud_firestore.dart';

class FolderModel {
  final String id;
  final String name;
  final String? parentId;
  final String path;
  final DateTime createdAt;

  FolderModel({
    required this.id,
    required this.name,
    required this.parentId,
    required this.path,
    required this.createdAt,
  });

  factory FolderModel.fromJson(Map<String, dynamic> json) {
    return FolderModel(
      id: json['id'],
      name: json['name'],
      parentId: json['parentId'],
      path: json['path'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'parentId': parentId,
      'path': path,
      'createdAt': createdAt,
    };
  }
}
