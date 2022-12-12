import 'package:test_app/features/workout/domain/models/workout.dart';

abstract class WorkoutRepository {
  Future<Workout> getWOD({required DateTime workoutDate});
  Future<List<Workout>> getWorkouts();
  Future<Workout> addWorkout({required Map<String, dynamic> workoutData});
  Future<void> deleteWorkout({required int workoutId});
}
