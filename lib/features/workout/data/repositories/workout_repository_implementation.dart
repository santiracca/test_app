import 'package:test_app/features/workout/domain/models/workout.dart';
import 'package:test_app/features/workout/domain/repositories/workout_repository.dart';

class WorkoutRepositoryImplementation implements WorkoutRepository {
  @override
  Future<Workout> addWorkout(
      {required Map<String, dynamic> workoutData}) async {
    // TODO: implement addWorkout
    throw UnimplementedError();
  }

  @override
  Future<void> deleteWorkout({required int workoutId}) async {
    // TODO: implement deleteWorkout
    throw UnimplementedError();
  }

  @override
  Future<Workout> getWOD({required DateTime workoutDate}) async {
    // TODO: implement getWOD
    throw UnimplementedError();
  }

  @override
  Future<List<Workout>> getWorkouts() async {
    // TODO: implement getWorkouts
    throw UnimplementedError();
  }
}
