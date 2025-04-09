import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nimbus/FirestoreConsts.dart';
import 'package:nimbus/Models/FolderModel.dart';
import 'package:nimbus/Services/DatabaseService.dart';

class DatabaseServiceImpl implements DatabaseService {
  DatabaseServiceImpl._();
  static final DatabaseServiceImpl instance = DatabaseServiceImpl._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createUser({required String userId}) async {
    await _firestore.collection(FirestoreConsts.users).doc(userId).set({
      'createdAt': FieldValue.serverTimestamp(),
      'lastLogin': FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<void> updateLastLogin({required String userId}) async {
    await _firestore.collection(FirestoreConsts.users).doc(userId).update({
      'lastLogin': FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<void> createFolder({
    required String userId,
    required FolderModel folder,
  }) async {
    _firestore
        .collection(FirestoreConsts.folders)
        .doc(folder.id)
        .set(folder.toJson());
  }

  @override
  DocumentReference getFolderRef() {
    return _firestore.collection(FirestoreConsts.folders).doc();
  }

  @override
  Future<void> deleteFolder({required FolderModel folder}) async {
    await _firestore
        .collection(FirestoreConsts.folders)
        .doc(folder.id)
        .delete();
  }

  @override
  Stream<List<FolderModel>> listenFolders({
    required String userId,
    required String path,
  }) {
    return _firestore
        .collection(FirestoreConsts.folders)
        .where('userId', isEqualTo: userId)
        .where('path', isEqualTo: path)
        .snapshots()
        .map((event) {
          return event.docs.map((e) {
            return FolderModel.fromJson(e.data());
          }).toList();
        });
  }
}
