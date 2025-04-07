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
}
