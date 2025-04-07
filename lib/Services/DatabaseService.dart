
abstract class DatabaseService {
  Future<void> createUser({required String userId});
  Future<void> updateLastLogin({required String userId});
}
