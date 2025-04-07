import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nimbus/FirestoreConsts.dart';
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
}
