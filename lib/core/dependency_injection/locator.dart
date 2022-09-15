import 'package:get_it/get_it.dart';
import 'package:test_app/features/user/data/repositories/user_repository_implementation.dart';
import 'package:test_app/features/user/domain/repositories/user_repository.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImplementation());
}
