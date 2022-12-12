import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_app/features/workout/data/repositories/workout_repository_implementation.dart';
import 'package:test_app/features/workout/domain/repositories/workout_repository.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton<WorkoutRepository>(
      () => WorkoutRepositoryImplementation());
}
