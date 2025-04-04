import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nimbus/FirestoreConsts.dart';
import 'package:nimbus/Models/FileCloudModel.dart';
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
  Future<void> createFile({
    required String userId,
    required FileCloudModel file,
  }) async {
    await _firestore
        .collection(FirestoreConsts.users)
        .doc(userId)
        .collection(FirestoreConsts.files)
        .add(file.toJson());
  }

  @override
  Future<void> createFiles({
    required String userId,
    required List<FileCloudModel> files,
  }) async {
    if (files.isEmpty) return;

    final batch = _firestore.batch();
    final filesRef = _firestore
        .collection(FirestoreConsts.users)
        .doc(userId)
        .collection(FirestoreConsts.files);

    final snapshot = await filesRef.get();
    final fileNames =
        snapshot.docs.map((e) {
          return FileCloudModel.fromJson(json: e.data()).name;
        }).toList();

    for (final file in files) {
      if (!fileNames.contains(file.name)) {
        final docRef = filesRef.doc();
        batch.set(docRef, file.toJson());
      }
    }

    batch.commit();
  }

  @override
  Stream<List<FileCloudModel>> listenFiles({required String userId}) {
    return _firestore
        .collection(FirestoreConsts.users)
        .doc(userId)
        .collection(FirestoreConsts.files)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => FileCloudModel.fromJson(json: doc.data()))
              .toList();
        });
  }
}
