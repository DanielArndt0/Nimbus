import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nimbus/Models/FolderModel.dart';

abstract class DatabaseService {
  Future<void> createUser({required String userId});
  Future<void> updateLastLogin({required String userId});

  DocumentReference getFolderRef();
  Future<void> createFolder({
    required String userId,
    required FolderModel folder,
  });
  Future<void> deleteFolder({required FolderModel folder});
  Stream<List<FolderModel>> listenFolders({
    required String userId,
    required String path,
  });
}
