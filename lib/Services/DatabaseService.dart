import 'package:nimbus/Models/FileCloudModel.dart';

abstract class DatabaseService {
  Future<void> createUser({required String userId});
  Future<void> updateLastLogin({required String userId});
  Future<void> createFile({
    required String userId,
    required FileCloudModel file,
  });
  Future<void> createFiles({
    required String userId,
    required List<FileCloudModel> files,
  });

  Stream<List<FileCloudModel>> listenFiles({required String userId});
}
