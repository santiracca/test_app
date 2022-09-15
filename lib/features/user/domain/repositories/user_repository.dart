import 'package:test_app/features/user/domain/models/user.dart';

abstract class UserRepository {
  Future<User> getUser({required String userId});
  Future<void> updateUserName(
      {required String userId, required String newUserName});
  Future<void> deleteUser({required String userId});
}
