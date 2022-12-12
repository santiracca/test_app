import 'package:test_app/core/dependency_injection/locator.dart';
import 'package:test_app/features/workout/domain/models/exercise.dart';
import 'package:test_app/features/workout/domain/models/workout.dart';
import 'package:test_app/features/workout/domain/repositories/workout_repository.dart';

class CreateWorkout {
  final WorkoutRepository _workoutRepository;

  CreateWorkout({WorkoutRepository? workoutRepository})
      : _workoutRepository = workoutRepository ?? locator<WorkoutRepository>();

  Future<Workout> call({required List<Exercise> exercises}) async {
    final startedAt = DateTime.now();
    final endedAt = startedAt.add(const Duration(minutes: 50));
    final data = {
      "startedAt": startedAt,
      "endedAt": endedAt,
      "exercises": exercises,
    };
    final newWorkout = await _workoutRepository.addWorkout(workoutData: data);
    return newWorkout;
  }
}
