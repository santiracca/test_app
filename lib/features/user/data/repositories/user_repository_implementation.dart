import 'package:test_app/features/user/domain/models/user.dart';
import 'package:test_app/features/user/domain/repositories/user_repository.dart';

final userData = {
  'id': 'testId',
  'name': 'Pepe Pija-Grande',
  'age': '25',
  'hobbies': ['Merca', 'La Paja']
};

class UserRepositoryImplementation implements UserRepository {
  @override
  Future<void> deleteUser({required String userId}) async {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<User> getUser({required String userId}) async {
    await Future.delayed(const Duration(seconds: 1));
    return User.fromJson(userData);
  }

  @override
  Future<void> updateUserName(
      {required String userId, required String newUserName}) async {
    // TODO: implement updateUserName
    throw UnimplementedError();
  }
}
